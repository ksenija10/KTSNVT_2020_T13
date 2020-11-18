package com.kts.nvt.serbioneer.service;

import java.util.Set;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.Admin;

@Service
public class AdminService implements ServiceInterface<Admin> {

	@Override
	public Set<Admin> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Admin findOneById(UUID id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Admin create(Admin entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(UUID id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Admin update(Admin entity, UUID id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
