package com.kts.nvt.serbioneer.controller;

import java.util.List;

import javax.validation.Valid;

import com.kts.nvt.serbioneer.dto.PasswordDTO;
import com.kts.nvt.serbioneer.dto.UserUpdateDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.kts.nvt.serbioneer.dto.AuthenticatedUserDTO;
import com.kts.nvt.serbioneer.helper.AuthenticatedUserMapper;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.service.AuthenticatedUserService;

@RestController
@RequestMapping(value = "api/authenticated-user", produces = MediaType.APPLICATION_JSON_VALUE)
public class AuthenticatedUserController {

	@Autowired
	private AuthenticatedUserService authenticatedUserService;

	private final AuthenticatedUserMapper authenticatedUserMapper;
	
	public AuthenticatedUserController() {
		this.authenticatedUserMapper = new AuthenticatedUserMapper();
	}
	
	/*
	 * url: GET localhost:8080/api/authenticated-user
	 * HTTP Request for getting all authenticated users
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping
	public ResponseEntity<List<AuthenticatedUserDTO>> getAllAuthenticatedUsers() {
		List<AuthenticatedUser> authenticatedUsers = authenticatedUserService.findAll();
		return new ResponseEntity<>(authenticatedUserMapper.toDtoList(authenticatedUsers), 
									HttpStatus.OK);
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
			authenticatedUserService.updatePersonalInformation(userUpdateDTO);
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
	public ResponseEntity<Void> updatePassword (@Valid @RequestBody PasswordDTO passwordDTO) {
		try{
			authenticatedUserService.updatePassword(passwordDTO);
		}catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}
