package com.kts.nvt.serbioneer.service;

import java.util.Set;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.User;

@Service
public class UserService implements ServiceInterface<User> {

	@Override
	public Set<User> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User findOneById(UUID id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public User create(User entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(UUID id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public User update(User entity, UUID id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
