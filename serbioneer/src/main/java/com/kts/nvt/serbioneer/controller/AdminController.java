package com.kts.nvt.serbioneer.controller;

import javax.validation.Valid;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
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
	
	private final AdminMapper adminMapper = new AdminMapper();
	
	/*
	 * url: GET localhost:8080/api/admin/by-page
	 * HTTP Request for getting all admins
	*/
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
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PutMapping(value = "/updatePersonalInformation", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<UserUpdateDTO> updatePersonalInformation(@Valid @RequestBody UserUpdateDTO userUpdateDTO) {

		try {
			adminService.updatePersonalInformation(userUpdateDTO);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}

		return new ResponseEntity<>(userUpdateDTO, HttpStatus.OK);
	}

	/*
	 * url: PUT localhost:8080/api/admin/updatePassword
	 * HTTP Request for updating password
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PutMapping(value = "/updatePassword", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Void> updatePassword (@Valid @RequestBody PasswordDTO passwordDTO) {
		try{
			adminService.updatePassword(passwordDTO);
		}catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}

		return new ResponseEntity<>(HttpStatus.OK);
	}
}
