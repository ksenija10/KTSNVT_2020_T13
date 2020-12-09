package com.kts.nvt.serbioneer.service;

import java.util.List;
import java.util.Set;

import com.kts.nvt.serbioneer.dto.PasswordDTO;
import com.kts.nvt.serbioneer.dto.UserUpdateDTO;
import com.kts.nvt.serbioneer.model.User;
import com.kts.nvt.serbioneer.registration.VerificationToken;
import com.kts.nvt.serbioneer.repository.UserRepository;
import com.kts.nvt.serbioneer.repository.VerificationTokenRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.Admin;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepository;
import org.springframework.web.server.ResponseStatusException;

@Service
public class AuthenticatedUserService implements ServiceInterface<AuthenticatedUser> {

	@Autowired
	private AuthenticatedUserRepository authenticatedUserRepository;

	@Autowired
	private UserRepository userRepository;

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
		//mora provera nad celom user tabelom da bi mail bio jedinstven
		AuthenticatedUser authenticatedUserToCreate = (AuthenticatedUser) userRepository.findOneByEmail(entity.getEmail());
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
		return null;
	}

	public AuthenticatedUser updatePersonalInformation(UserUpdateDTO entity) throws Exception {
		AuthenticatedUser authenticatedUserToUpdate = authenticatedUserRepository.findById(entity.getId()).orElse(null);

		authenticatedUserToUpdate.setName(entity.getName());
		authenticatedUserToUpdate.setSurname(entity.getSurname());
		return authenticatedUserRepository.save(authenticatedUserToUpdate);
	}

	public void updatePassword (PasswordDTO passwordDTO) throws Exception {
		AuthenticatedUser user = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		AuthenticatedUser authenticatedUserToUpdate = authenticatedUserRepository.findById(user.getId()).orElse(null);
		if(authenticatedUserToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}

		//enkodovanje sifre
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		if(!encoder.matches(passwordDTO.getOldPassword(), authenticatedUserToUpdate.getPassword())) {
			throw new Exception("Old password is incorrect.");
		}

		if(passwordDTO.getOldPassword().equals(passwordDTO.getNewPassword())) {
			throw new Exception("New password can not be same as old password.");
		}

		if(!passwordDTO.getNewPassword().equals(passwordDTO.getRepeatedPassword())) {
			throw new Exception("New password and repeated password don`t match.");
		}

		authenticatedUserToUpdate.setPassword(encoder.encode(passwordDTO.getNewPassword()));
		authenticatedUserRepository.save(authenticatedUserToUpdate);
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

	public void addSubscribedSite(CulturalSite culturalSite) throws Exception {
		AuthenticatedUser loggedIn = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		AuthenticatedUser user = authenticatedUserRepository.findById(loggedIn.getId()).orElse(null);
		if(user == null) {
			throw new Exception("Logged in user not found in database");
		}
		Set<CulturalSite> allSubscribed = user.getSubscribedSites();
		if(allSubscribed.contains(culturalSite)) {
			throw new Exception("User is already subscribed");
		}
		user.addSubscribedSite(culturalSite);
		authenticatedUserRepository.save(user);
		
	}

}
