package com.kts.nvt.serbioneer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.Admin;
import com.kts.nvt.serbioneer.repository.AdminRepository;

@Service
public class AdminService implements ServiceInterface<Admin> {

	@Autowired
	private AdminRepository adminRepository;
	
	private final String type = "Admin";
	
	@Override
	public List<Admin> findAll() {
		return adminRepository.findAll();
	}
	
	public Page<Admin> findAll(Pageable pageable) {
		return adminRepository.findAll(pageable);
	}

	@Override
	public Admin findOneById(Long id) {
		return adminRepository.findOneById(id);
	}

	@Override
	public Admin create(Admin entity) throws Exception {
		Admin adminToCreate = adminRepository.findOneByEmail(entity.getEmail());
		if(adminToCreate == null) {
			return adminRepository.save(entity);
		}
		throw new ExistentFieldValueException(this.type, "email");
	}

	@Override
	public void delete(Long id) throws Exception {
		Admin adminToDelete = adminRepository.findById(id).orElse(null);
		if(adminToDelete == null) {
			throw new NonexistentIdException(this.type);
		}
		adminRepository.delete(adminToDelete);
	}

	@Override
	public Admin update(Admin entity, Long id) throws Exception {
		Admin adminToUpdate = adminRepository.findById(id).orElse(null);
		if(adminToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		adminToUpdate.setEmail(entity.getEmail());
		//enkodovanje sifre
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		adminToUpdate.setPassword(encoder.encode(entity.getPassword()));
		adminToUpdate.setName(entity.getName());
		adminToUpdate.setSurname(entity.getSurname());
		adminToUpdate.setDateOfBirth(entity.getDateOfBirth());
		return adminRepository.save(adminToUpdate);
	}

}
