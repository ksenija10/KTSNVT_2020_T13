package com.kts.nvt.serbioneer.controller;

import static com.kts.nvt.serbioneer.constants.AuthenticatedUserConstants.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.dto.AuthenticatedUserDTO;
import com.kts.nvt.serbioneer.dto.PasswordDTO;
import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.dto.UserUpdateDTO;
import com.kts.nvt.serbioneer.helper.HelperPage;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.service.AuthenticatedUserService;
import com.kts.nvt.serbioneer.service.CulturalSiteService;

import net.minidev.json.JSONObject;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class AuthenticatedUserControllerIntegrationTest {

	@Autowired
    private TestRestTemplate restTemplate;
	
	@Autowired
    private AuthenticatedUserService authenticatedUserService;
	
	@Autowired
    private CulturalSiteService culturalSiteService;

    private String accessToken;
    
    public void login(String username, String password) {
    	//poziv REST servisa za logovanje
    	ResponseEntity<UserLoginDTO> responseEntity = restTemplate.postForEntity("/login", 
    													new UserLoginDTO(username, password), UserLoginDTO.class);
    	//postavljanje authorization tokena
        this.accessToken = responseEntity.getHeaders().get("Authorization").get(0);
    }
    
    @Test
    public void testGetAllAuthenticatedUsersPageable() {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(ADMIN_USERNAME, ADMIN_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<HelperPage<AuthenticatedUserDTO>> responseEntity = restTemplate.exchange("/api/authenticated-user/by-page?page=0&size=3", 
    							HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<AuthenticatedUserDTO>>() {} );
    	
    	List<AuthenticatedUserDTO> users = responseEntity.getBody().toList();
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(FIND_PAGEABLE_USERS, users.size());
    }
    
    @Test
    public void testGetCurrentAdmin() {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(USER_USERNAME, USER_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	// poziv REST servisa za dobavljanje trenutnog admina
    	ResponseEntity<AuthenticatedUserDTO> responseEntity = restTemplate.exchange("/api/authenticated-user/view-profile", 
				HttpMethod.GET, httpEntity, AuthenticatedUserDTO.class );
    	
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertEquals(USER_USERNAME, responseEntity.getBody().getEmail());
    }
    
    @Test
	public void testDeleteAdmin() throws Exception {
    	
		//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(ADMIN_USERNAME, ADMIN_PASSWORD);
		  	
	  	//postavljanje autorizacije u header
	  	HttpHeaders headers = new HttpHeaders();
	  	headers.add("Authorization", this.accessToken);
	  	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
		  	
	  	//ubacujemo novog user-a
	  	AuthenticatedUser user = authenticatedUserService.create(new AuthenticatedUser(10L, "Nikola", "Nikic", "nikola@user.com", "nikola", true));
	  	
	  	// preuzmemo trenutni broj user-a
	    List<AuthenticatedUser> users = authenticatedUserService.findAll();
	    int size = users.size();
		  
		// poziv REST servisa za brisanje
		ResponseEntity<Void> responseEntity = restTemplate.exchange("/api/authenticated-user/" + user.getId(),
		                  HttpMethod.DELETE, httpEntity, Void.class);
		  
		// provera odgovora servera
		assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
		// mora biti jedan manje slog sada nego pre
		assertEquals(size - 1, authenticatedUserService.findAll().size());
	}
    
    @Test
    public void testUpdatePersonalInformation() throws Exception {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(USER_USERNAME, USER_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	//neophodno postaviti consumes
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	//pravljenje dto objekta
    	//https://www.baeldung.com/spring-resttemplate-post-json
    	JSONObject updateUserDto = new JSONObject();
    	updateUserDto.put("name", UPDATE_NAME);
    	updateUserDto.put("surname", UPDATE_SURNAME);
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(updateUserDto.toString(), headers);
    	
    	ResponseEntity<UserUpdateDTO> responseEntity = restTemplate.exchange("/api/authenticated-user/updatePersonalInformation",
                HttpMethod.PUT, httpEntity, UserUpdateDTO.class);
    	
    	UserUpdateDTO user = responseEntity.getBody();
    	
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertNotNull(user);
    	assertEquals(UPDATE_NAME, user.getName());
    	assertEquals(UPDATE_SURNAME, user.getSurname());
    	
    	AuthenticatedUser userDatabase = (AuthenticatedUser) authenticatedUserService.findOneById(USER_ID);
    	assertEquals(USER_ID, userDatabase.getId());
    	assertEquals(UPDATE_NAME, userDatabase.getName());
    	assertEquals(UPDATE_SURNAME, userDatabase.getSurname());
    	
    	//vratiti sve na staro
    	authenticatedUserService.updatePersonalInformation(new UserUpdateDTO("Mileva", "Isic", null), userDatabase);
    }
    
    @Test
    public void testUpdatePassword() throws Exception {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(USER2_USERNAME, USER2_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	//neophodno postaviti consumes
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	//pravljenje dto objekta
    	//https://www.baeldung.com/spring-resttemplate-post-json
    	JSONObject updateUserDto = new JSONObject();
    	updateUserDto.put("oldPassword", USER2_PASSWORD);
    	updateUserDto.put("newPassword", UPDATE_PASSWORD);
    	updateUserDto.put("repeatedPassword", UPDATE_REPEATED_PASSWORD);
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(updateUserDto.toString(), headers);
    	
    	ResponseEntity<PasswordDTO> responseEntity = restTemplate.exchange("/api/authenticated-user/updatePassword",
                HttpMethod.PUT, httpEntity, PasswordDTO.class);
    	
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	
    	//trenutni ulogovani
    	AuthenticatedUser user = authenticatedUserService.findOneById(USER2_ID);
    	//dekriptujemo sifru
    	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    	//provera da li je zaista zamenjena sifra
    	assertEquals(true, encoder.matches(UPDATE_PASSWORD, user.getPassword()));
    	
    	//vracanje na staro:
    	authenticatedUserService.updatePassword(new PasswordDTO(UPDATE_PASSWORD, USER2_PASSWORD, USER2_PASSWORD), user);
    }
    
    @Test
    public void testSubscribe() {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(USER_USERNAME, USER_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	//neophodno postaviti consumes
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	AuthenticatedUser userBefore = authenticatedUserService.findOneById(USER_ID);
    	List<CulturalSite> citesBefore = culturalSiteService.findAllSubscribed(userBefore);
    	
    	ResponseEntity<Void> responseEntity = restTemplate.exchange("/api/authenticated-user/subscribe/" + CULTURAL_SITE_ID,
                HttpMethod.POST, httpEntity, Void.class);	
    	
    	AuthenticatedUser userAfter = authenticatedUserService.findOneById(USER_ID);
    	List<CulturalSite> citesAfter = culturalSiteService.findAllSubscribed(userAfter);
    	
    	//posto je je subscribedSites set ne mogu da proverim da li je posledji dodati taj koji sam ja dodala
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertEquals(citesBefore.size() +1, citesAfter.size());
    }
    
    @Test
    public void testUnsubscribe() {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(USER3_USERNAME, USER3_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	//neophodno postaviti consumes
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	AuthenticatedUser userBefore = authenticatedUserService.findOneById(USER3_ID);
    	List<CulturalSite> citesBefore = culturalSiteService.findAllSubscribed(userBefore);
    	
    	ResponseEntity<Void> responseEntity = restTemplate.exchange("/api/authenticated-user/unsubscribe/" + CULTURAL_SITE_ID2,
                HttpMethod.POST, httpEntity, Void.class);	
    	
    	AuthenticatedUser userAfter = authenticatedUserService.findOneById(USER3_ID);
    	List<CulturalSite> citesAfter = culturalSiteService.findAllSubscribed(userAfter);
    	
    	//posto je je subscribedSites set ne mogu da proverim da li je posledji dodati taj koji sam ja dodala
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertEquals(citesBefore.size() -1, citesAfter.size());
    }
    
}
