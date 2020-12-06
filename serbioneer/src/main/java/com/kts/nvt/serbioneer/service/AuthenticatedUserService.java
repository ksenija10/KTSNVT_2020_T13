package com.kts.nvt.serbioneer.service;

import java.util.List;

import com.kts.nvt.serbioneer.registration.VerificationToken;
import com.kts.nvt.serbioneer.repository.VerificationTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.Admin;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepository;
import org.springframework.web.server.ResponseStatusException;

@Service
public class AuthenticatedUserService implements ServiceInterface<AuthenticatedUser> {

	@Autowired
	private AuthenticatedUserRepository authenticatedUserRepository;

	@Autowired
	private VerificationTokenRepository verificationTokenRepository;

	private final String type = "AuthenticatedUser";
	
	@Override
	public List<AuthenticatedUser> findAll() {
		return authenticatedUserRepository.findAll();
	}
	
	public Page<AuthenticatedUser> findAll(Pageable pageable) {
		return authenticatedUserRepository.findAll(pageable);
	}

	@Override
	public AuthenticatedUser findOneById(Long id) {
		return authenticatedUserRepository.findById(id).orElse(null);
	}

	@Override
	public AuthenticatedUser create(AuthenticatedUser entity) throws Exception {
		//enkripcija lozinke
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		entity.setPassword(encoder.encode(entity.getPassword()));
		AuthenticatedUser authenticatedUserToCreate = authenticatedUserRepository.findOneByEmail(entity.getEmail());

		if(authenticatedUserToCreate == null) {
			AuthenticatedUser saved = authenticatedUserRepository.save(entity);
			return saved;
		} else {
			if (authenticatedUserToCreate.isActivated()) {
				throw new ExistentFieldValueException(this.type, "email");
			} else {
				//postoji u bazi ali je neaktivan jer nije pration link
				VerificationToken token = verificationTokenRepository.findByUser(authenticatedUserToCreate);
				if (token.isExpired()) {
					//istekao je moze da se registruje ponovo
					verificationTokenRepository.delete(token);
					System.out.println(authenticatedUserToCreate.getId());
					return authenticatedUserToCreate;
				} else {
					throw new Exception("Please check your email for the verification link!");
				}

			}
		}

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
		//provera da li je ulogovani korisnik isti onaj koji je napravio komentar
		AuthenticatedUser user = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (!user.getId().equals(entity.getId())) {
			throw new Exception("You can only update your own profile.");
		}
		AuthenticatedUser authenticatedUserToUpdate = authenticatedUserRepository.findById(id).orElse(null);
		if(authenticatedUserToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		authenticatedUserToUpdate.setEmail(entity.getEmail());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		authenticatedUserToUpdate.setPassword(encoder.encode(entity.getPassword()));
		authenticatedUserToUpdate.setName(entity.getName());
		authenticatedUserToUpdate.setSurname(entity.getSurname());
		return authenticatedUserRepository.save(authenticatedUserToUpdate);
	}

	public AuthenticatedUser getUserByToken(String verificationToken) {
		AuthenticatedUser user = verificationTokenRepository.findByToken(verificationToken).getUser();
		return user;
	}

	public VerificationToken getVerificationToken(String VerificationToken) {
		return verificationTokenRepository.findByToken(VerificationToken);
	}

	public void saveRegisteredUser(AuthenticatedUser user) {
		authenticatedUserRepository.save(user);
	}

	public void createVerificationToken(AuthenticatedUser user, String token) {
		VerificationToken myToken = new VerificationToken(token, user);
		verificationTokenRepository.save(myToken);
	}

}
