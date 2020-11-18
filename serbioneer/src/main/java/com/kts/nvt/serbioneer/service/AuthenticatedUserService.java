package com.kts.nvt.serbioneer.service;

import java.util.Set;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;

@Service
public class AuthenticatedUserService implements ServiceInterface<AuthenticatedUser> {

	@Override
	public Set<AuthenticatedUser> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AuthenticatedUser findOneById(UUID id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AuthenticatedUser create(AuthenticatedUser entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(UUID id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public AuthenticatedUser update(AuthenticatedUser entity, UUID id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
