package com.kts.nvt.serbioneer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Long> {
	
	Admin findOneById(Long id);

	Admin findOneByEmail(String email);
}
