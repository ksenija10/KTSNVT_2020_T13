package com.kts.nvt.serbioneer.service;

import static com.kts.nvt.serbioneer.constants.AuthenticatedUserConstants.*;
import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.dto.PasswordDTO;
import com.kts.nvt.serbioneer.dto.UserUpdateDTO;
import com.kts.nvt.serbioneer.helper.exception.ConflictException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.registration.VerificationToken;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class AuthenticatedUserServiceIntegrationTest {

	@Autowired
	private AuthenticatedUserService authentiicatedUserService;
	
	@Autowired
    private CulturalSiteService culturalSiteService;
	
	@Test
	public void testFindAll() {
		List<AuthenticatedUser> found = authentiicatedUserService.findAll();
		assertEquals(ALL_USERS, found.size());
	}
	
	@Test
	public void testFindAllPageable() {
		Pageable pageable = PageRequest.of(0, 3);
		Page<AuthenticatedUser> found = authentiicatedUserService.findAll(pageable);
		assertEquals(FIND_PAGEABLE_USERS, found.getNumberOfElements());
	}
	
	@Test
	public void testFindOneById() {
		AuthenticatedUser found = authentiicatedUserService.findOneById(USER_ID);
		assertNotNull(found);
		assertEquals(USER_ID, found.getId());
	}
	
	@Test
	public void testCreate() throws Exception {
		List<AuthenticatedUser> usersBefore = authentiicatedUserService.findAll();
		AuthenticatedUser entity = new AuthenticatedUser(1L, CREATE_NAME, CREATE_SURNAME, 
				CREATE_USERNAME, CREATE_PASSWORD, true);
		AuthenticatedUser created = authentiicatedUserService.create(entity);
		List<AuthenticatedUser> usersAfter = authentiicatedUserService.findAll();
		AuthenticatedUser newUser = usersAfter.get(usersAfter.size()-1);
		
		assertNotNull(created);
		assertEquals(usersBefore.size()+1, usersAfter.size());
		assertEquals(CREATE_NAME, newUser.getName());
		assertEquals(CREATE_SURNAME, newUser.getSurname());
		assertEquals(CREATE_USERNAME, newUser.getEmail());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		assertEquals(true, encoder.matches(CREATE_PASSWORD, newUser.getPassword()));
		//vracamo na staro
		authentiicatedUserService.delete(created.getId());
	}
	
	@Test
	public void testDelete() throws Exception {
		AuthenticatedUser entity = new AuthenticatedUser(1L, DELETE_USERNAME, CREATE_PASSWORD, 
				CREATE_NAME, CREATE_SURNAME, true);
		entity = authentiicatedUserService.create(entity);
		List<AuthenticatedUser> usersBefore = authentiicatedUserService.findAll();
		authentiicatedUserService.delete(entity.getId());
		List<AuthenticatedUser> usersAfter = authentiicatedUserService.findAll();
		
		assertEquals(usersBefore.size() -1, usersAfter.size());
	}
	
	@Test
	public void testUpdatePersonalInformation() throws Exception {
		UserUpdateDTO updateDto = new UserUpdateDTO(UPDATE_NAME, UPDATE_SURNAME, null);
		AuthenticatedUser userToUpdate = authentiicatedUserService.findOneById(USER_ID);
		AuthenticatedUser updated = authentiicatedUserService.updatePersonalInformation(updateDto, userToUpdate);
		
		//proveri da li su promenjeni name i surname
		assertNotEquals(UPDATE_NAME, userToUpdate.getName());
		assertEquals(UPDATE_NAME, updated.getName());
		assertNotEquals(UPDATE_SURNAME, userToUpdate.getSurname());
		assertEquals(UPDATE_SURNAME, updated.getSurname());
	}
	
	@Test
	public void testUpdatePassword() throws Exception {
		AuthenticatedUser adminToUpdate = authentiicatedUserService.findOneById(USER4_ID);
		PasswordDTO passwordDto = new PasswordDTO(USER4_PASSWORD, UPDATE4_PASSWORD, UPDATE4_REPEATED_PASSWORD);
		AuthenticatedUser updated = authentiicatedUserService.updatePassword(passwordDto, adminToUpdate);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		assertEquals(false, encoder.matches(USER4_PASSWORD, updated.getPassword()));
		assertEquals(true, encoder.matches(UPDATE4_PASSWORD, updated.getPassword()));
	}
	
	@Test
	public void testGetVerificationToken() {
		AuthenticatedUser user = authentiicatedUserService.findOneById(USER8_ID);
		String token = UUID.randomUUID().toString();
		//ovde je odradjeno testiranje kreiranja verifikacionog tokena
		VerificationToken created = authentiicatedUserService.createVerificationToken(user, token);

		assertNotNull(created);

		VerificationToken verified = authentiicatedUserService.getVerificationToken(token);
		
		assertNotNull(verified);
		assertEquals(created.getToken(), verified.getToken());
	}
	
	@Test
	public void testSubscribe() throws NonexistentIdException, ConflictException {
		AuthenticatedUser user = authentiicatedUserService.findOneById(USER_ID);
		assertNotNull(user);
		List<CulturalSite> citesBefore = culturalSiteService.findAllSubscribed(user);
		authentiicatedUserService.addSubscribedSite(CULTURAL_SITE_ID3, user);
		List<CulturalSite> citesAfter = culturalSiteService.findAllSubscribed(user);
		assertEquals(citesBefore.size()+1, citesAfter.size());
	}
	
	@Test(expected = ConflictException.class)
	public void testSubscribeNull() throws NonexistentIdException, ConflictException {
		AuthenticatedUser user = authentiicatedUserService.findOneById(USER_ID);
		assertNotNull(user);
		List<CulturalSite> citesBefore = culturalSiteService.findAllSubscribed(user);
		authentiicatedUserService.addSubscribedSite(CULTURAL_SITE_ID5, user);
	}
	
	@Test
	public void testUnsubscribe() throws NonexistentIdException, ConflictException {
		AuthenticatedUser user = authentiicatedUserService.findOneById(USER3_ID);
		assertNotNull(user);
		List<CulturalSite> citesBefore = culturalSiteService.findAllSubscribed(user);
		authentiicatedUserService.removeSubscribedSite(CULTURAL_SITE_ID4, user);
		List<CulturalSite> citesAfter = culturalSiteService.findAllSubscribed(user);
		assertEquals(citesBefore.size()-1, citesAfter.size());
	}
	
	@Test(expected = ConflictException.class)
	public void testUnsubscribeNull() throws NonexistentIdException, ConflictException {
		AuthenticatedUser user = authentiicatedUserService.findOneById(USER3_ID);
		assertNotNull(user);
		List<CulturalSite> citesBefore = culturalSiteService.findAllSubscribed(user);
		authentiicatedUserService.removeSubscribedSite(CULTURAL_SITE_ID4, user);
	}
}
