package com.kts.nvt.serbioneer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
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

	@Override
	public AuthenticatedUser findOneById(Long id) {
		return authenticatedUserRepository.findById(id).orElse(null);
	}

	@Override
	public AuthenticatedUser create(AuthenticatedUser entity) throws Exception {
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
		AuthenticatedUser authenticatedUserToUpdate = authenticatedUserRepository.findById(id).orElse(null);
		if(authenticatedUserToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		authenticatedUserToUpdate.setEmail(entity.getEmail());
		authenticatedUserToUpdate.setEmail(entity.getEmail());
		authenticatedUserToUpdate.setPassword(entity.getPassword());
		authenticatedUserToUpdate.setName(entity.getName());
		authenticatedUserToUpdate.setSurname(entity.getSurname());
		return null;
	}

}
