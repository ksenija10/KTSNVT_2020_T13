package com.kts.nvt.serbioneer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.kts.nvt.serbioneer.helper.AdminMapper;
import com.kts.nvt.serbioneer.model.Admin;
import com.kts.nvt.serbioneer.service.AdminService;

@RestController
@RequestMapping(value = "api/admin", produces = MediaType.APPLICATION_JSON_VALUE)
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	private AdminMapper adminMapper;
	
	public AdminController() {
		this.adminMapper = new AdminMapper();
	}
	
	/*
	 * url: GET localhost:8080/api/admin
	 * HTTP Request for getting all admins
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping
	public ResponseEntity<List<AdminDTO>> getAllAdmins() {
		List<Admin> admins = adminService.findAll();
		return new ResponseEntity<>(adminMapper.toDtoList(admins), HttpStatus.OK);
	}
	
	/*
	 * url: POST localhost:8080/api/admin
	 * HTTP Request for creating new admin
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<AdminDTO> createAdmin(@RequestBody AdminDTO adminDto) {
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
	 * url: PUT localhost:8080/api/admin/{id}
	 * HTTP Request for updating an admins by id
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<AdminDTO> updateAdmin(@PathVariable("id") Long id, 
												@RequestBody AdminDTO adminDto) {
		
		Admin admin = adminMapper.toEntity(adminDto);
		try {
			admin = adminService.update(admin, id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(adminMapper.toDto(admin), HttpStatus.OK);
	}
}
