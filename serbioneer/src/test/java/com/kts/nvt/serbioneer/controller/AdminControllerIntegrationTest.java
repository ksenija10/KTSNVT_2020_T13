package com.kts.nvt.serbioneer.controller;

import static com.kts.nvt.serbioneer.constants.AdminConstants.*;
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

import com.kts.nvt.serbioneer.dto.AdminDTO;
import com.kts.nvt.serbioneer.dto.PasswordDTO;
import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.dto.UserUpdateDTO;
import com.kts.nvt.serbioneer.helper.HelperPage;
import com.kts.nvt.serbioneer.model.Admin;
import com.kts.nvt.serbioneer.service.AdminService;

import net.minidev.json.JSONObject;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class AdminControllerIntegrationTest {

	@Autowired
    private TestRestTemplate restTemplate;
	
	@Autowired
    private AdminService adminService;

    private String accessToken;
    
    public void login(String username, String password) {
    	//poziv REST servisa za logovanje
    	ResponseEntity<UserLoginDTO> responseEntity = restTemplate.postForEntity("/login", 
    													new UserLoginDTO(username, password), UserLoginDTO.class);
    	//postavljanje authorization tokena
        this.accessToken = responseEntity.getHeaders().get("Authorization").get(0);
    }
    
    @Test
    public void testGetAllAdminsPageable() {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(ADMIN_USERNAME, ADMIN_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	//exchange radi da bi poslali header
    	//HelperPage je nasa hc klasa zato sto ResponseEntity p***a ne zeli da prihvati Page jer je apstraktna klasa
    	//pa mozete procitati sve u com.kts.nvt.serbioneer.helper.HelperPage klasi!
    	ResponseEntity<HelperPage<AdminDTO>> responseEntity = restTemplate.exchange("/api/admin/by-page?page=0&size=2", 
    							HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<AdminDTO>>() {} );
    	
    	List<AdminDTO> admins = responseEntity.getBody().toList();
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(FIND_PAGEABLE_ADMINS, admins.size());
    }
    
    @Test
    public void testGetCurrentAdmin() {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(ADMIN_USERNAME, ADMIN_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	// poziv REST servisa za dobavljanje trenutnog admina
    	ResponseEntity<AdminDTO> responseEntity = restTemplate.exchange("/api/admin/view-profile", 
				HttpMethod.GET, httpEntity, AdminDTO.class );
    	
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertEquals(ADMIN_USERNAME, responseEntity.getBody().getEmail());
    }
    
    @Test
//    @Transactional()
//    @Rollback()
    public void testCreateAdmin() throws Exception {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(ADMIN_USERNAME, ADMIN_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	//neophodno postaviti consumes
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	//pravljenje dto objekta
    	//https://www.baeldung.com/spring-resttemplate-post-json
    	JSONObject adminDto = new JSONObject();
    	adminDto.put("id", NEW_ID);
    	adminDto.put("name", NEW_NAME);
    	adminDto.put("surname", NEW_SURNAME);
    	adminDto.put("email", NEW_EMAIL);
    	adminDto.put("password", NEW_PASSWORD);
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(adminDto.toString(), headers);
    	
    	int size = adminService.findAll().size();
    	
    	// poziv REST servisa za kreiranje
    	ResponseEntity<AdminDTO> responseEntity = restTemplate.postForEntity("/api/admin", 
									httpEntity, AdminDTO.class );
    	
    	assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
    	assertNotNull(responseEntity.getBody());
   		assertEquals(size + 1, adminService.findAll().size());
   		assertEquals(NEW_EMAIL, responseEntity.getBody().getEmail());
   		
   		//izbrisi ga
   		adminService.delete(responseEntity.getBody().getId());
    }
    
    
    @Test
//    @Transactional()
//    @Rollback()
    public void testDeleteAdmin() throws Exception {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(ADMIN_USERNAME, ADMIN_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	//ubacujemo novog admina
    	Admin admin = adminService.create(new Admin(10L, "Nikola", "Nikic", "nikola@admin.com", "nikola", null));
    	
        // preuzmemo trenutni broj admina
        List<Admin> admins = adminService.findAll();
        int size = admins.size();
        
        // poziv REST servisa za brisanje
        ResponseEntity<Void> responseEntity = restTemplate.exchange("/api/admin/" + admin.getId(),
                        HttpMethod.DELETE, httpEntity, Void.class);
        
        // provera odgovora servera
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        // mora biti jedan manje slog sada nego pre
        assertEquals(size - 1, adminService.findAll().size());
    }
    
    @Test
//    @Transactional()
//    @Rollback()
    public void testUpdatePersonalInformation() throws Exception {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	login(ADMIN_USERNAME, ADMIN_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	//neophodno postaviti consumes
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	//pravljenje dto objekta
    	//https://www.baeldung.com/spring-resttemplate-post-json
    	JSONObject updateAdminDto = new JSONObject();
    	updateAdminDto.put("name", UPDATE_NAME);
    	updateAdminDto.put("surname", UPDATE_SURNAME);
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(updateAdminDto.toString(), headers);
    	
    	ResponseEntity<UserUpdateDTO> responseEntity = restTemplate.exchange("/api/admin/updatePersonalInformation",
                HttpMethod.PUT, httpEntity, UserUpdateDTO.class);
    	
    	UserUpdateDTO admin = responseEntity.getBody();
    	
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertNotNull(admin);
    	assertEquals(UPDATE_NAME, admin.getName());
    	assertEquals(UPDATE_SURNAME, admin.getSurname());
    	
    	Admin adminDatabase = (Admin) adminService.findOneById(ADMIN_ID);
    	assertEquals(ADMIN_ID, adminDatabase.getId());
    	assertEquals(UPDATE_NAME, adminDatabase.getName());
    	assertEquals(UPDATE_SURNAME, adminDatabase.getSurname());
    	
    	//vratiti sve na staro
    	updateAdminDto.put("name", "Ksenija");
    	updateAdminDto.put("surname", "Prcic");
    	httpEntity = new HttpEntity<Object>(updateAdminDto.toString(), headers);
    	responseEntity = restTemplate.exchange("/api/admin/updatePersonalInformation",
                HttpMethod.PUT, httpEntity, UserUpdateDTO.class);
    }
    
    @Test
    public void testUpdatePassword() throws Exception {
    	//u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
    	//zarad ovog testa postavljen je drugi admin iz razloga sto se testovi ocigledno preklapaju
    	//pa se adminu promeni password a on u drugom testu pokusa da se ulogije sa starom lozinkom 
    	// i ne me ze
    	login(ADMIN2_USERNAME, ADMIN2_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	//neophodno postaviti consumes
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	//pravljenje dto objekta
    	//https://www.baeldung.com/spring-resttemplate-post-json
    	JSONObject updateAdminDto = new JSONObject();
    	updateAdminDto.put("oldPassword", ADMIN2_PASSWORD);
    	updateAdminDto.put("newPassword", UPDATE_PASSWORD);
    	updateAdminDto.put("repeatedPassword", UPDATE_REPEATED_PASSWORD);
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(updateAdminDto.toString(), headers);
    	
    	ResponseEntity<PasswordDTO> responseEntity = restTemplate.exchange("/api/admin/updatePassword",
                HttpMethod.PUT, httpEntity, PasswordDTO.class);
    	
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	
    	//trenutni ulogovani
    	Admin admin = adminService.findOneById(ADMIN2_ID);
    	//dekriptujemo sifru
    	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    	//provera da li je zaista zamenjena sifra
    	assertEquals(true, encoder.matches(UPDATE_PASSWORD, admin.getPassword()));
    	
    	//vracanje na staro:
    	//da, izmenila sam metodu u servisu i kontroleru tako sto sam tamo 
    	//stavila dobavljanje usera sa context-a
    	adminService.updatePassword(new PasswordDTO(UPDATE_PASSWORD, ADMIN2_PASSWORD, ADMIN2_PASSWORD), admin);
    }
    
}
