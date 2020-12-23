package com.kts.nvt.serbioneer.repository;

import static com.kts.nvt.serbioneer.constants.AuthenticatedUserConstants.*;
import static org.junit.Assert.assertNull;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class AuthenticatedUserRepositoryIntegrationTest {

	@Autowired
	private AuthenticatedUserRepository authenticatedUserRepository;
	
	@Test
	public void testFindOneByEmail() {
		AuthenticatedUser found = authenticatedUserRepository.findOneByEmail(USER_EMAIL);
		assertNotNull(found);
		assertEquals(USER_EMAIL, found.getEmail());
	}
	
	@Test
	public void testFindOneByEmailNull() {
		AuthenticatedUser found = authenticatedUserRepository.findOneByEmail(USER_EMAIL_NULL);
		assertNull(found);
	}
	
	@Test
	public void testFindOneByEmailAndActivated() {
		AuthenticatedUser found = authenticatedUserRepository.findOneByEmail(USER_EMAIL);
		assertNotNull(found);
		assertEquals(USER_EMAIL, found.getEmail());
		assertEquals(true, found.isActivated());
	}
	
	@Test
	public void testFindOneByEmailAndNotActivated() {
		AuthenticatedUser found = authenticatedUserRepository.findOneByEmail(USER_NOT_ACTIVATED);
		assertNotNull(found);
		assertEquals(USER_NOT_ACTIVATED, found.getEmail());
		assertEquals(false, found.isActivated());
	}
}
