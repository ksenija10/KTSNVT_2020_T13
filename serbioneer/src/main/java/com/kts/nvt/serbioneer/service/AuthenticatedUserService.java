package com.kts.nvt.serbioneer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.Admin;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepository;

@Service
public class AuthenticatedUserService implements ServiceInterface<AuthenticatedUser> {

	@Autowired
	private AuthenticatedUserRepository authenticatedUserRepository;
	
	private final String type = "AuthenticatedUser";
	
	@Override
	public List<AuthenticatedUser> findAll() {
		return authenticatedUserRepository.findAll();
	}
	
	public Page<AuthenticatedUser> findAll(Pageable pageable) {
		return authenticatedUserRepository.findAll(pageable);
	}

	@Override
	public AuthenticatedUser findOneById(Long id) {
		return authenticatedUserRepository.findById(id).orElse(null);
	}

	@Override
	public AuthenticatedUser create(AuthenticatedUser entity) throws Exception {
		//enkripcija lozinke
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		entity.setPassword(encoder.encode(entity.getPassword()));
		AuthenticatedUser authenticatedUserToCreate = authenticatedUserRepository.findOneByEmail(entity.getEmail());
		if(authenticatedUserToCreate == null) {
			return authenticatedUserRepository.save(entity);
		}
		throw new ExistentFieldValueException(this.type, "email");
	}

	@Override
	public void delete(Long id) throws Exception {
		AuthenticatedUser authenticatedUserToDelete = authenticatedUserRepository.findById(id).orElse(null);
		if(authenticatedUserToDelete == null) {
			throw new NonexistentIdException(this.type);
		}
		authenticatedUserRepository.delete(authenticatedUserToDelete);
	}

	@Override
	public AuthenticatedUser update(AuthenticatedUser entity, Long id) throws Exception {
		//provera da li je ulogovani korisnik isti onaj koji je napravio komentar
		AuthenticatedUser user = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (!user.getId().equals(entity.getId())) {
			throw new Exception("You can only update your own profile.");
		}
		AuthenticatedUser authenticatedUserToUpdate = authenticatedUserRepository.findById(id).orElse(null);
		if(authenticatedUserToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		authenticatedUserToUpdate.setEmail(entity.getEmail());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		authenticatedUserToUpdate.setPassword(encoder.encode(entity.getPassword()));
		authenticatedUserToUpdate.setName(entity.getName());
		authenticatedUserToUpdate.setSurname(entity.getSurname());
		return authenticatedUserRepository.save(authenticatedUserToUpdate);
	}

}
