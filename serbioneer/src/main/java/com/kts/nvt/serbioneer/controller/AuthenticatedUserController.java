package com.kts.nvt.serbioneer.controller;

import java.util.List;

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

import com.kts.nvt.serbioneer.dto.AuthenticatedUserDTO;
import com.kts.nvt.serbioneer.helper.AuthenticatedUserMapper;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.service.AuthenticatedUserService;

@RestController
@RequestMapping(value = "api/authenticated-user", produces = MediaType.APPLICATION_JSON_VALUE)
public class AuthenticatedUserController {

	@Autowired
	private AuthenticatedUserService authenticatedUserService;
	
	private AuthenticatedUserMapper authenticatedUserMapper;
	
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
	 * url: POST localhost:8080/api/authenticated-user
	 * HTTP Request for creating new authenticated user
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<AuthenticatedUserDTO> createAuthenticatedUser(@Valid @RequestBody AuthenticatedUserDTO authenticatedUserDto) {
		AuthenticatedUser authenticatedUser = authenticatedUserMapper.toEntity(authenticatedUserDto);
		try {
			authenticatedUser = authenticatedUserService.create(authenticatedUser);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(authenticatedUserMapper.toDto(authenticatedUser), 
									HttpStatus.CREATED);
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
	 * url: PUT localhost:8080/api/authenticated-user/{id}
	 * HTTP Request for updating an authenticated users by id
	*/
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
	@PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<AuthenticatedUserDTO> updateAuthanticatedUser(@PathVariable("id") Long id, 
												@Valid @RequestBody AuthenticatedUserDTO authenticatedUserDto) {
		
		AuthenticatedUser authenticatedUser = authenticatedUserMapper.toEntity(authenticatedUserDto);
		try {
			authenticatedUserService.update(authenticatedUser, id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(authenticatedUserMapper.toDto(authenticatedUser), HttpStatus.OK);
	}
	
}
