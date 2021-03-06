package com.kts.nvt.serbioneer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import com.kts.nvt.serbioneer.jwt.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.kts.nvt.serbioneer.dto.AuthenticatedUserDTO;
import com.kts.nvt.serbioneer.dto.PasswordDTO;
import com.kts.nvt.serbioneer.dto.UserUpdateDTO;
import com.kts.nvt.serbioneer.helper.AuthenticatedUserMapper;
import com.kts.nvt.serbioneer.helper.exception.ConflictException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.service.AuthenticatedUserService;

@CrossOrigin(origins = "https://localhost:4200")
@RestController
@RequestMapping(value = "api/authenticated-user", produces = MediaType.APPLICATION_JSON_VALUE)
public class AuthenticatedUserController {

	@Autowired
	private AuthenticatedUserService authenticatedUserService;

	@Autowired
	private TokenUtils tokenUtils;
	
	private final AuthenticatedUserMapper authenticatedUserMapper;
	
	public AuthenticatedUserController() {
		this.authenticatedUserMapper = new AuthenticatedUserMapper();
	}
	
	/*
	 * url: GET localhost:8080/api/authenticated-user/by-page
	 * HTTP Request for getting all authenticated users
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/by-page")
	public ResponseEntity<Page<AuthenticatedUserDTO>> getAllAuthenticatedUsers(Pageable pageable) {
		Page<AuthenticatedUser> authenticatedUsers = authenticatedUserService.findAll(pageable);
		return new ResponseEntity<>(authenticatedUserMapper.toDtoPage(authenticatedUsers), 
									HttpStatus.OK);
	}
	
	/*
	 * url: GET localhost:8080/api/authenticated-user/view-profile
	 * HTTP Request for viewing pesonal information
	*/
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping("/view-profile")
	public ResponseEntity<AuthenticatedUserDTO> getCurrentAuthenticatedUser() {
		AuthenticatedUser authenticatedUser = authenticatedUserService.findCurrent();
		return new ResponseEntity<>(authenticatedUserMapper.toDto(authenticatedUser), HttpStatus.OK);
	}

	/*
	 * url: DELETE localhost:8080/api/authenticated-user/{id}
	 * HTTP Request for deleting an authenticated user by id
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deleteAuthenticatedUser(@PathVariable("id") Long id) {
		try {
			authenticatedUserService.delete(id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	/*
	 * url: PUT localhost:8080/api/authenticated-user/updatePersonalInformation
	 * HTTP Request for updating personal information
	*/
	@PreAuthorize("hasRole('ROLE_USER')")
	@PutMapping(value = "/updatePersonalInformation", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<UserUpdateDTO> updatePersonalInformation(@Valid @RequestBody UserUpdateDTO userUpdateDTO) {
		try {
			AuthenticatedUser user = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			authenticatedUserService.updatePersonalInformation(userUpdateDTO, user);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(userUpdateDTO, HttpStatus.OK);
	}

	/*
	 * url: PUT localhost:8080/api/authenticated/updatePassword
	 * HTTP Request for updating password
	 */
	@PreAuthorize("hasRole('ROLE_USER')")
	@PutMapping(value = "/updatePassword", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> updatePassword (@Valid @RequestBody PasswordDTO passwordDTO,
												HttpServletRequest request,
												HttpServletResponse response) {
		try{
			AuthenticatedUser user = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			user = authenticatedUserService.updatePassword(passwordDTO, user);
			// uspesno promenio sifru
			String newToken = tokenUtils.generateToken(user.getUsername(), user.getAuthorities());
			int expiresIn = tokenUtils.getExpiresIn();
			// postavljanje headera
			response.addHeader(tokenUtils.getAuthHeader(), "Bearer " + newToken);
			response.addHeader(tokenUtils.getExpHeader(), String.valueOf(expiresIn));
			// prikaz heder-a na frontu, da bismo mogli da ih dobavimo
			response.addHeader("Access-Control-Allow-Headers",  "Origin, X-Requested-With, Content-Type, Accept, Authorization, Expires-In");
			response.addHeader("Access-Control-Expose-Headers", "Authorization, Expires-In");
			return new ResponseEntity<>(HttpStatus.OK);
		}catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
	}
	
	/*
	 * url POST localhost:8080/api/authenticated-user/subscribe/{cultural-site-id}
	 * HTTP Request for subscribing to a cultural site
	 */
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/subscribe/{cultural-site-id}")
	public ResponseEntity<Void> subscribe(@PathVariable("cultural-site-id") Long culturalSiteId){
		try {
			AuthenticatedUser loggedIn = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			authenticatedUserService.addSubscribedSite(culturalSiteId, loggedIn);
		} catch (NonexistentIdException e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		} catch (ConflictException e) {
			throw new ResponseStatusException(HttpStatus.CONFLICT, e.getMessage());
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	/*
	 * url POST localhost:8080/api/authenticated-user/unsubscribe/{cultural-site-id}
	 * HTTP Request for unsubscribing from a cultural site
	 */
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping("/unsubscribe/{cultural-site-id}")
	public ResponseEntity<Object> unsubscribe(@PathVariable("cultural-site-id") Long culturalSiteId){
		try {
			AuthenticatedUser loggedIn = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			authenticatedUserService.removeSubscribedSite(culturalSiteId, loggedIn);
		} catch (NonexistentIdException e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		} catch (ConflictException e) {
			throw new ResponseStatusException(HttpStatus.CONFLICT, e.getMessage());
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}
