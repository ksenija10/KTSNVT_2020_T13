package com.kts.nvt.serbioneer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;

@Repository
public interface AuthenticatedUserRepository extends JpaRepository<AuthenticatedUser, Long> {

	AuthenticatedUser findOneByEmail(String email);

	AuthenticatedUser findOneByEmailAndActivated(String email, boolean activated);
}
