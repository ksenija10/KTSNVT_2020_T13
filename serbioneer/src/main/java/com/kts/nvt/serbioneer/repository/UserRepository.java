package com.kts.nvt.serbioneer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	
	List<User> findAll();
	
	User findOneById(Long id);
 
    User findOneByEmail(String email);

}
