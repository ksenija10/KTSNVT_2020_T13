package com.kts.nvt.serbioneer.repository;

import static com.kts.nvt.serbioneer.constants.AdminConstants.*;
import static org.junit.Assert.assertNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.model.Admin;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class AdminRepositoryIntegationTest {

	@Autowired
	private AdminRepository adminRepository;
	
	@Test
	public void testFindOneById() {
		Admin admin = adminRepository.findOneById(ADMIN_ID);
		assertEquals(ADMIN_ID, admin.getId());
	}
	
	@Test
	public void testFindOneByIdNull() {
		Admin admin = adminRepository.findOneById(NULL_ID);
		assertNull(admin);
	}
	
	@Test
	public void testFindOneByEmail() {
		Admin admin = adminRepository.findOneByEmail(ADMIN_USERNAME);
		assertEquals(ADMIN_USERNAME, admin.getEmail());
	}
	
	@Test
	public void testFindOneByEmailNull() {
		Admin admin = adminRepository.findOneByEmail(ADMIN_NULL_USERNAME);
		assertNull(admin);
	}
}
