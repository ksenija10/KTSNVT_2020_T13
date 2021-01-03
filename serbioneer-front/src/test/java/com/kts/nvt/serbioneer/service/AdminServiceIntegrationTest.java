package com.kts.nvt.serbioneer.service;

import static com.kts.nvt.serbioneer.constants.AdminConstants.*;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;

import java.util.List;

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
import com.kts.nvt.serbioneer.model.Admin;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class AdminServiceIntegrationTest {

	@Autowired
	private AdminService adminService;
	
	@Test
    public void testFindAll() {
        List<Admin> found = adminService.findAll();
        assertEquals(FIND_ADMINS, found.size());
    }
	
	@Test 
	public void testFindAllPageable() {
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE,PAGEABLE_SIZE);
        Page<Admin> found = adminService.findAll(pageable);
        assertEquals(FIND_PAGEABLE_ADMINS, found.getNumberOfElements());
	}
	
	@Test
	public void testFindOneById() {
		Admin found = adminService.findOneById(ADMIN_ID);
		assertEquals(ADMIN_ID, found.getId());
	}
	
	/*@Test
	public void testFindOneByIdNull() {
		Admin found = adminService.findOneById(NULL_ID);
		assertNull(found);
	}*/
	
	@Test
	public void testCreate() throws Exception {
		List<Admin> admins = adminService.findAll();
		int size = admins.size();
		Admin created = adminService.create(
				new Admin(CREATE_ID, CREATE_NAME, CREATE_SURNAME, CREATE_EMAIL, CREATE_PASSWORD, null));
		
		List<Admin> adminsAfter = adminService.findAll();
		
		Admin newAdmin = adminsAfter.get(adminsAfter.size()-1);
		
		assertNotNull(created);
		assertEquals(size+1, adminsAfter.size());
		assertEquals(CREATE_NAME, newAdmin.getName());
		assertEquals(CREATE_SURNAME, newAdmin.getSurname());
		assertEquals(CREATE_EMAIL, newAdmin.getEmail());
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		assertEquals(true, encoder.matches(CREATE_PASSWORD, newAdmin.getPassword()));
		//vracamo na staro
		adminService.delete(created.getId());
	}
	
	@Test
	public void testDelete() throws Exception {
		Admin admin = adminService.create(new Admin(DELETE_ID, DELETE_NAME, DELETE_SURNAME, DELETE_EMAIL, DELETE_PASSWORD, null));
		List<Admin> adminsBefore = adminService.findAll();
		adminService.delete(admin.getId());
		List<Admin> adminsAfter = adminService.findAll();
		assertEquals(adminsBefore.size()-1, adminsAfter.size());
	}
	
	@Test
	public void testUpdatePersonalInformation() throws Exception {
		UserUpdateDTO updateDto = new UserUpdateDTO(UPDATE_NAME, UPDATE_SURNAME, null);
		Admin adminToUpdate = adminService.findOneById(ADMIN_ID);
		Admin updated = adminService.updatePersonalInformation(updateDto, adminToUpdate);
		
		//proveri da li su promenjeni name i surname
		assertNotEquals(UPDATE_NAME, adminToUpdate.getName());
		assertEquals(UPDATE_NAME, updated.getName());
		assertNotEquals(UPDATE_SURNAME, adminToUpdate.getSurname());
		assertEquals(UPDATE_SURNAME, updated.getSurname());
	}
	
	@Test
	public void testUpdatePassword() throws Exception {
		Admin adminToUpdate = adminService.findOneById(ADMIN3_ID);
		PasswordDTO passwordDto = new PasswordDTO(ADMIN3_PASSWORD, UPDAT3_PASSWORD, UPDAT3_REPEATED_PASSWORD);
		Admin updated = adminService.updatePassword(passwordDto, adminToUpdate);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		assertEquals(false, encoder.matches(ADMIN3_PASSWORD, updated.getPassword()));
		assertEquals(true, encoder.matches(UPDAT3_PASSWORD, updated.getPassword()));
	}
}
