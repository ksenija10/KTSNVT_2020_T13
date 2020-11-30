package com.kts.nvt.serbioneer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.User;
import com.kts.nvt.serbioneer.repository.UserRepository;

@Service
public class UserService implements ServiceInterface<User> {
	
	@Autowired
	private UserRepository userRepository;
	
	private final String type = "User";

	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}

	@Override
	public User findOneById(Long id) {
		return userRepository.findById(id).orElse(null);
	}
	
	public User findOneByEmail(String email) {
		return userRepository.findOneByEmail(email);
	}

	@Override
	public User create(User entity) throws Exception {
		//ako ima neki isPrese
		User userToAdd = userRepository.findOneByEmail(entity.getEmail());
		if(userToAdd == null) {
			return userRepository.save(entity);
		}
		throw new ExistentFieldValueException(this.type, "email");
	}

	@Override
	public void delete(Long id) throws Exception {
		User userToDelete = userRepository.findById(id).orElse(null);
		if(userToDelete == null) {
			throw new NonexistentIdException(this.type);
		}
		userRepository.delete(userToDelete);
	}

	@Override
	public User update(User entity, Long id) throws Exception {
		User userToUpdate = userRepository.findById(id).orElse(null);
		if (userToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		userToUpdate.setEmail(entity.getEmail());
		userToUpdate.setPassword(entity.getPassword());
		userToUpdate.setName(entity.getName());
		userToUpdate.setSurname(entity.getSurname());
		return userRepository.save(userToUpdate);
	}

}
