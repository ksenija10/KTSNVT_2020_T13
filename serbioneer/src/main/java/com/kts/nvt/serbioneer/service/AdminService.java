package com.kts.nvt.serbioneer.service;

import java.util.HashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.dto.PasswordDTO;
import com.kts.nvt.serbioneer.dto.UserUpdateDTO;
import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.Admin;
import com.kts.nvt.serbioneer.repository.AdminRepository;
import com.kts.nvt.serbioneer.repository.UserRepository;

@Service
public class AdminService implements ServiceInterface<Admin> {

	@Autowired
	private AdminRepository adminRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private AuthorityService authorityService;
	
	private final String type = "Admin";
	
	//za potrebe testiranja
	public List<Admin> findAll() {
		return adminRepository.findAll();
	}
	
	@Override
	public Page<Admin> findAll(Pageable pageable) {
		return adminRepository.findAll(pageable);
	}

	@Override
	public Admin findOneById(Long id) {
		return adminRepository.findById(id).orElse(null);
	}

	public Admin create(Admin entity) throws Exception {
		//mora provera nad celom user tabelom da bi mail bio jedinstven
		Admin adminToCreate = (Admin) userRepository.findOneByEmail(entity.getEmail());
		if(adminToCreate == null) {
			//enkripcija lozinke
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			entity.setPassword(encoder.encode(entity.getPassword()));
			//postavljanje authorities
			entity.setAuthorities(new HashSet<>(authorityService.findByName("ROLE_ADMIN")));
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

	public Admin updatePersonalInformation(UserUpdateDTO entity, Admin user) throws Exception {
		//Admin user = (Admin) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Admin adminToUpdate = findOneById(user.getId());
		adminToUpdate.setName(entity.getName());
		adminToUpdate.setSurname(entity.getSurname());
		adminToUpdate.setDateOfBirth(entity.getDateOfBirth());
		return adminRepository.save(adminToUpdate);
	}

	public Admin updatePassword (PasswordDTO passwordDTO, Admin user) throws Exception {
		//Admin user = (Admin) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		Admin adminToUpdate = adminRepository.findById(user.getId()).orElse(null);
		if(adminToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}

		//enkodovanje sifre
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		if(!encoder.matches(passwordDTO.getOldPassword(), adminToUpdate.getPassword())) {
			throw new Exception("Old password is incorrect.");
		}

		if(passwordDTO.getOldPassword().equals(passwordDTO.getNewPassword())) {
			throw new Exception("New password cannot be the same as old password.");
		}

		if(!passwordDTO.getNewPassword().equals(passwordDTO.getRepeatedPassword())) {
			throw new Exception("New password and repeated password don`t match.");
		}

		adminToUpdate.setPassword(encoder.encode(passwordDTO.getNewPassword()));
		return adminRepository.save(adminToUpdate);
	}
	
	public Admin findCurrent() {
		return (Admin) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

}
