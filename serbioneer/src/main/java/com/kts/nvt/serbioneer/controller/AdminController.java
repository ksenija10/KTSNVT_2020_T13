package com.kts.nvt.serbioneer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.jwt.TokenUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import org.springframework.web.server.ResponseStatusException;

import com.kts.nvt.serbioneer.dto.AdminDTO;
import com.kts.nvt.serbioneer.dto.PasswordDTO;
import com.kts.nvt.serbioneer.dto.UserUpdateDTO;
import com.kts.nvt.serbioneer.helper.AdminMapper;
import com.kts.nvt.serbioneer.model.Admin;
import com.kts.nvt.serbioneer.service.AdminService;

@RestController
@RequestMapping(value = "api/admin", produces = MediaType.APPLICATION_JSON_VALUE)
public class AdminController {

	@Autowired
	private AdminService adminService;

	@Autowired
	private TokenUtils tokenUtils;
	
	private final AdminMapper adminMapper = new AdminMapper();
	
	/*
	 * url: GET localhost:8080/api/admin/by-page
	 * HTTP Request for getting all admins
	*/
	@CrossOrigin(origins = "http://localhost:4200")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/by-page")
	public ResponseEntity<Page<AdminDTO>> getAllAdmins(Pageable pageable) {
		Page<Admin> admins = adminService.findAll(pageable);
		return new ResponseEntity<>(adminMapper.toDtoPage(admins), HttpStatus.OK);
	}
	
	/*
	 * url: GET localhost:8080/api/admin/view-profile
	 * HTTP Request for viewing pesonal information
	*/
	@CrossOrigin(origins = "http://localhost:4200")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/view-profile")
	public ResponseEntity<AdminDTO> getCurrentAdmin() {
		Admin admin = adminService.findCurrent();
		return new ResponseEntity<>(adminMapper.toDto(admin), HttpStatus.OK);
	}
	
	/*
	 * url: POST localhost:8080/api/admin
	 * HTTP Request for creating new admin
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<AdminDTO> createAdmin(@Valid @RequestBody AdminDTO adminDto) {
		Admin admin = adminMapper.toEntity(adminDto);
		try {
			admin = adminService.create(admin);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(adminMapper.toDto(admin), HttpStatus.CREATED);
	}
	
	/*
	 * url: DELETE localhost:8080/api/admin/{id}
	 * HTTP Request for deleting an admin by id
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deleteAdmin(@PathVariable("id") Long id) {
		try {
			adminService.delete(id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	/*
	 * url: PUT localhost:8080/api/admin/updatePersonalInformation
	 * HTTP Request for updating personal information
	*/
	@CrossOrigin(origins = "http://localhost:4200")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PutMapping(value = "/updatePersonalInformation", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<UserUpdateDTO> updatePersonalInformation(@Valid @RequestBody UserUpdateDTO userUpdateDTO) {
		try {
			Admin user = (Admin) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			adminService.updatePersonalInformation(userUpdateDTO, user);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}

		return new ResponseEntity<>(userUpdateDTO, HttpStatus.OK);
	}

	/*
	 * url: PUT localhost:8080/api/admin/updatePassword
	 * HTTP Request for updating password
	 */
	@CrossOrigin(origins = "http://localhost:4200")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PutMapping(value = "/updatePassword", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> updatePassword (@Valid @RequestBody PasswordDTO passwordDTO,
														HttpServletRequest request,
														HttpServletResponse response) {
		UserLoginDTO userNewPassword;
		try{
			Admin user = (Admin) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			user = adminService.updatePassword(passwordDTO, user);

			// uspesno promenio sifru
			userNewPassword = new UserLoginDTO(user.getUsername(), passwordDTO.getNewPassword());
			String newToken = tokenUtils.generateToken(user.getUsername(), user.getAuthorities());
			int expiresIn = tokenUtils.getExpiresIn();
			System.out.println("========================================");
			System.out.println(newToken);
			System.out.println(tokenUtils.getIssuedAtDateFromToken(newToken));
			System.out.println("========================================");
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
}
