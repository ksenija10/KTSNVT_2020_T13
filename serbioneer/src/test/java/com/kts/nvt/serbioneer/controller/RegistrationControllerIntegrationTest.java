package com.kts.nvt.serbioneer.controller;

import static com.kts.nvt.serbioneer.constants.RegistrationConstants.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.HashSet;
import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.dto.AuthenticatedUserDTO;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.registration.VerificationToken;
import com.kts.nvt.serbioneer.repository.VerificationTokenRepository;
import com.kts.nvt.serbioneer.service.AuthenticatedUserService;
import com.kts.nvt.serbioneer.service.AuthorityService;

import net.minidev.json.JSONObject;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class RegistrationControllerIntegrationTest {

	@Autowired
    AuthorityService authorityService;

    @Autowired
    AuthenticatedUserService authenticatedUserService;
    
    @Autowired
	private VerificationTokenRepository verificationTokenRepository;
    
    @Autowired
    private TestRestTemplate restTemplate;
    
    @Test
    public void testRegistration() throws Exception {
    	List<AuthenticatedUser> usersBefore = authenticatedUserService.findAll();
    	JSONObject userDto = new JSONObject();
    	userDto.put("name", USER_NAME);
    	userDto.put("surname", USER_SURNAME);
    	userDto.put("email", USER_EMAIL);
    	userDto.put("password", USER_PASSWORD);
    	userDto.put("activated", false);
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(userDto.toString(), headers);
    	
    	ResponseEntity<AuthenticatedUserDTO> responseEntity = restTemplate.postForEntity("/api/register", 
				httpEntity, AuthenticatedUserDTO.class );
    	
    	List<AuthenticatedUser> usersAfter = authenticatedUserService.findAll();
    	AuthenticatedUser user = authenticatedUserService.findOneById(responseEntity.getBody().getId());
    	assertNotNull(responseEntity.getBody());
    	assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
    	assertEquals(usersBefore.size() +1, usersAfter.size());
    	assertEquals(false, user.isActivated());
    	
    	//vrati sve u normalu
    	authenticatedUserService.delete(user.getId());
    }
    
    @Test
    public void testRegistrationFailed() {
    	JSONObject userDto = new JSONObject();
    	userDto.put("name", USER_NAME);
    	userDto.put("surname", USER_SURNAME);
    	userDto.put("email", USER_EXISTING_EMAIL);
    	userDto.put("password", USER_PASSWORD);
    	userDto.put("activated", false);
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(userDto.toString(), headers);
    	
    	ResponseEntity<Void> responseEntity = restTemplate.postForEntity("/api/register", 
				httpEntity, Void.class );
    	
    	assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
    }
    
    @Test
    public void testConfirmUser() throws Exception {
    	AuthenticatedUser authenticatedUser = new AuthenticatedUser(null, USER_NAME, USER_SURNAME, USER_EMAIL2, 
    			USER_PASSWORD, false);
    	authenticatedUser.setAuthorities(new HashSet<>(authorityService.findByName("ROLE_USER")));
    	AuthenticatedUser user = authenticatedUserService.create(authenticatedUser);
    	String stringToken = UUID.randomUUID().toString();
    	VerificationToken savedToken = authenticatedUserService.createVerificationToken(user, stringToken);
    	VerificationToken token = verificationTokenRepository.findByUser(user);
    	assertEquals(savedToken.getToken(), token.getToken());
    }
    
}
