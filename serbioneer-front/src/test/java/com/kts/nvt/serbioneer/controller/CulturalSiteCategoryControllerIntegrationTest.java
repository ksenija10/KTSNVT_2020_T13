package com.kts.nvt.serbioneer.controller;

import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.DB_ADMIN_PASSWORD;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.DB_ADMIN_USERNAME;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.DB_CATEGORY_ID;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.DB_CATEGORY_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.DB_CATEGORY_TYPES_NUM;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.DB_EXISTING_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.DB_ID;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.DB_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.DB_USER_PASSWORD;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.DB_USER_USERNAME;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.INVALID_ID;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.NEW_CATEGORY_TYPE_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.PAGEABLE_TOTAL_ELEMENTS;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.UPDATED_CATEGORY_TYPE_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.DB_COUNT;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.DB_NAME_EXISTING;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.NEW_CATEGORY_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.UPDATED_CATEGORY_NAME;
import static org.junit.Assert.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.dto.CulturalCategoryTypeDTO;
import com.kts.nvt.serbioneer.dto.CulturalSiteCategoryDTO;
import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.helper.HelperPage;
import com.kts.nvt.serbioneer.model.CulturalCategoryType;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import com.kts.nvt.serbioneer.service.CulturalCategoryTypeService;
import com.kts.nvt.serbioneer.service.CulturalSiteCategoryService;

import net.minidev.json.JSONObject;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalSiteCategoryControllerIntegrationTest {

	@Autowired
	private TestRestTemplate restTemplate;
	
	@Autowired
	private CulturalSiteCategoryService culturalSiteCategoryService;
	
	@Autowired
	private CulturalCategoryTypeService culturalCategoryTypeService;
	
	private final String baseUrl = "/api/cultural-site-category";
	
	private String accessToken;
	
	// login metoda
	public void login(String username, String password) {
    	//poziv REST servisa za logovanje
    	ResponseEntity<UserLoginDTO> responseEntity = restTemplate.postForEntity("/login", 
    													new UserLoginDTO(username, password), UserLoginDTO.class);
    	//postavljanje authorization tokena
        this.accessToken = responseEntity.getHeaders().get("Authorization").get(0);
    }

	@Test
	public void testGetAllCulturalSiteCategories() {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<CulturalSiteCategoryDTO[]> responseEntity = restTemplate.exchange(
    			baseUrl, HttpMethod.GET, httpEntity, CulturalSiteCategoryDTO[].class);
	
    	// provera statusa
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertEquals(DB_COUNT, responseEntity.getBody().length);
	}
	
	@Test
	public void testGetAllCulturalSiteCategoriesAutorizationFail() {
		// neophodna autorizacija
		login(DB_USER_USERNAME, DB_USER_PASSWORD);
		
		//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<Void> responseEntity = restTemplate.exchange(
    			baseUrl, HttpMethod.GET, httpEntity, Void.class);
	
    	// provera statusa
    	assertEquals(HttpStatus.FORBIDDEN, responseEntity.getStatusCode());
	}

	@Test
	public void testGetAllCulturalSiteCategoriesPageable() {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<HelperPage<CulturalSiteCategoryDTO>> responseEntity = restTemplate.exchange(
    			baseUrl + "/by-page?page=0&size=2", 
				HttpMethod.GET, httpEntity, 
				new ParameterizedTypeReference<HelperPage<CulturalSiteCategoryDTO>>() {} );
    	
    	// provera statusa
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertEquals(PAGEABLE_TOTAL_ELEMENTS, responseEntity.getBody().getContent().size());
	}

	@Test
	public void testCreateCulturalSiteCategorySuccessful() throws Exception {
		// neophodna autorizacija
    	login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	//neophodno postaviti consumes
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	//pravljenje dto objekta
    	JSONObject categoryDto = new JSONObject();
    	categoryDto.put("name", NEW_CATEGORY_NAME);
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(categoryDto.toString(), headers);
    	
    	int dbSizeBefore = culturalSiteCategoryService.findAll().size();
    	
    	// poziv REST servisa za kreiranje
    	ResponseEntity<CulturalSiteCategoryDTO> responseEntity = 
    			restTemplate.postForEntity(baseUrl, httpEntity, CulturalSiteCategoryDTO.class);
    	
    	// provera statusa
    	assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
    	
    	assertNotNull(responseEntity.getBody());
    	List<CulturalSiteCategory> allCategories = culturalSiteCategoryService.findAll();
   		assertEquals(dbSizeBefore + 1, allCategories.size());
   		
   		// provera vrednosti
   		assertEquals(NEW_CATEGORY_NAME, allCategories.get(allCategories.size() - 1).getName());
   		
   		// vracanje baze na staro
   		culturalSiteCategoryService.delete(responseEntity.getBody().getId());
   		assertEquals(dbSizeBefore, culturalSiteCategoryService.findAll().size());
	}
	
	@Test
	public void testCreateCulturalSiteCategoryExistingName() throws Exception {
		// neophodna autorizacija
    	login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	//neophodno postaviti consumes
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	//pravljenje dto objekta
    	JSONObject categoryDto = new JSONObject();
    	categoryDto.put("name", DB_NAME_EXISTING);
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(categoryDto.toString(), headers);
    	
    	// poziv REST servisa za kreiranje
    	ResponseEntity<Void> responseEntity = 
    			restTemplate.postForEntity(baseUrl, httpEntity, Void.class);
    	
    	// provera statusa
    	assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
	}

	@Test
	public void testGetCulturalSiteCategorySuccessful() {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<CulturalSiteCategoryDTO> responseEntity = restTemplate.exchange(
    			baseUrl + "/" + DB_CATEGORY_ID, HttpMethod.GET, httpEntity, CulturalSiteCategoryDTO.class);
	
    	// provera statusa
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	// provera vrednosti
    	CulturalSiteCategoryDTO category = responseEntity.getBody();
    	assertEquals(DB_CATEGORY_ID, category.getId());
    	assertEquals(DB_CATEGORY_NAME, category.getName());
	}
	
	@Test
	public void testGetCulturalSiteCategoryNotExistingId() {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<Void> responseEntity = restTemplate.exchange(
    			baseUrl + "/" + INVALID_ID, HttpMethod.GET, httpEntity, Void.class);
	
    	// provera statusa
    	assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
	}

	@Test
	public void testUpdateCulturalSiteCategorySuccessful() {
		// neophodna autorizacija
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        //neophodno postaviti consumes
        headers.setContentType(MediaType.APPLICATION_JSON);

        //pravljenje dto objekta
        JSONObject updateCategoryDto = new JSONObject();
        updateCategoryDto.put("name", UPDATED_CATEGORY_NAME);

        HttpEntity<Object> httpEntity = new HttpEntity<Object>(updateCategoryDto.toString(), headers);

        ResponseEntity<CulturalSiteCategoryDTO> responseEntity = restTemplate.exchange(
                baseUrl + "/" + DB_ID,
                HttpMethod.PUT, httpEntity, CulturalSiteCategoryDTO.class);

        CulturalSiteCategoryDTO updatedCategory = responseEntity.getBody();

        // provera statusa
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        
        // provera vrednosti
        assertEquals(UPDATED_CATEGORY_NAME, updatedCategory.getName());

        // vracanje baze na staro
        updateCategoryDto.put("name", DB_CATEGORY_NAME);
        httpEntity = new HttpEntity<Object>(updateCategoryDto.toString(), headers);
        responseEntity = restTemplate.exchange(
        		baseUrl + "/" + DB_ID, HttpMethod.PUT, httpEntity, CulturalSiteCategoryDTO.class);
	}
	
	@Test
	public void testUpdateCulturalSiteCategoryExistingName() {
		// neophodna autorizacija
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        //neophodno postaviti consumes
        headers.setContentType(MediaType.APPLICATION_JSON);

        //pravljenje dto objekta
        JSONObject updateCategoryDto = new JSONObject();
        updateCategoryDto.put("name", DB_NAME_EXISTING);

        HttpEntity<Object> httpEntity = new HttpEntity<Object>(updateCategoryDto.toString(), headers);

        ResponseEntity<CulturalSiteCategoryDTO> responseEntity = restTemplate.exchange(
                baseUrl + "/" + DB_ID,
                HttpMethod.PUT, httpEntity, CulturalSiteCategoryDTO.class);

        // provera statusa
        assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
	}

	@Test
	public void testDeleteCulturalSiteCategorySuccessful() throws Exception {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", this.accessToken);
		HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
		
		// ubacujemo kategoriju koju cemo da brisemo
		CulturalSiteCategory forDelete = 
				culturalSiteCategoryService.create(
						new CulturalSiteCategory(NEW_CATEGORY_NAME));
		
		int dbSizeBefore = culturalSiteCategoryService.findAll().size();
		
		// poziv REST servisa za brisanje
		ResponseEntity<Void> responseEntity = restTemplate.exchange(
				baseUrl + "/" + forDelete.getId(),
				HttpMethod.DELETE, httpEntity, Void.class);
		
		// provera statusa
		assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
		
		assertEquals(dbSizeBefore - 1, culturalSiteCategoryService.findAll().size());
	}
	
	@Test
	public void testDeleteCulturalSiteCategoryNotExistingId() throws Exception {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", this.accessToken);
		HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
		
		int dbSizeBefore = culturalSiteCategoryService.findAll().size();
		
		// poziv REST servisa za brisanje
		ResponseEntity<Void> responseEntity = restTemplate.exchange(
				baseUrl + "/" + INVALID_ID,
				HttpMethod.DELETE, httpEntity, Void.class);
		
		// provera statusa
		assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
		
		assertEquals(dbSizeBefore, culturalSiteCategoryService.findAll().size());
	}

	@Test
	public void testGetAllCategoryTypesLongSuccessful() {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<CulturalCategoryTypeDTO[]> responseEntity = restTemplate.exchange(
    			baseUrl + "/" + DB_CATEGORY_ID + "/type", HttpMethod.GET, httpEntity, CulturalCategoryTypeDTO[].class);
	
    	// provera statusa
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	// provera vrednosti
    	assertEquals(DB_CATEGORY_TYPES_NUM, responseEntity.getBody().length);
    	assertEquals(DB_CATEGORY_ID, responseEntity.getBody()[0].getId());
	}
	
	@Test
	public void testGetAllCategoryTypesLongNotExistingCategoryId() {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<Void> responseEntity = restTemplate.exchange(
    			baseUrl + "/" + INVALID_ID + "/type", HttpMethod.GET, httpEntity, Void.class);
	
    	// provera statusa
    	assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
	}

	@Test
	public void testGetAllCategoryTypesPageableSuccessful() {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<HelperPage<CulturalCategoryTypeDTO>> responseEntity = restTemplate.exchange(
    			baseUrl + "/" + DB_CATEGORY_ID +"/type/by-page?page=0&size=2", 
				HttpMethod.GET, httpEntity, 
				new ParameterizedTypeReference<HelperPage<CulturalCategoryTypeDTO>>() {} );
    	
    	// provera statusa
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	// provera vrednosti
    	assertEquals(DB_CATEGORY_TYPES_NUM, responseEntity.getBody().getContent().size());
    	assertEquals(DB_CATEGORY_ID, responseEntity.getBody().getContent().get(0).getCategoryId());
	}
	
	@Test
	public void testGetAllCategoryTypesPageableNotExistingCategoryId() {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<Void> responseEntity = restTemplate.exchange(
    			baseUrl + "/" + INVALID_ID +"/type/by-page?page=0&size=2", 
				HttpMethod.GET, httpEntity, Void.class);
    	
    	// provera statusa
    	assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
    }

	@Test
	public void testCreateCategoryTypeSuccessful() throws Exception {
		// neophodna autorizacija
    	login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	//neophodno postaviti consumes
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	//pravljenje dto objekta
    	JSONObject typeDto = new JSONObject();
    	typeDto.put("name", NEW_CATEGORY_TYPE_NAME);
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(typeDto.toString(), headers);
    	
    	int dbSizeBefore = culturalCategoryTypeService.findAll().size();
    	
    	// poziv REST servisa za kreiranje
    	ResponseEntity<CulturalCategoryTypeDTO> responseEntity = 
    			restTemplate.postForEntity(baseUrl + "/" + DB_CATEGORY_ID + "/type", 
    					httpEntity, CulturalCategoryTypeDTO.class);
    	
    	// provera statusa
    	assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
    	
    	assertNotNull(responseEntity.getBody());
    	List<CulturalCategoryType> allTypes = culturalCategoryTypeService.findAll();
   		assertEquals(dbSizeBefore + 1, allTypes.size());
   		
   		// provera vrednosti
   		assertEquals(NEW_CATEGORY_TYPE_NAME, allTypes.get(allTypes.size() - 1).getName());
   		
   		// vracanje baze na staro
   		culturalCategoryTypeService.delete(responseEntity.getBody().getId());
   		assertEquals(dbSizeBefore, culturalCategoryTypeService.findAll().size());
	}
	
	@Test
	public void testCreateCategoryTypeExistingName() {
		// neophodna autorizacija
    	login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
    	
    	//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	//neophodno postaviti consumes
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	//pravljenje dto objekta
    	JSONObject typeDto = new JSONObject();
    	typeDto.put("name", DB_EXISTING_NAME);
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(typeDto.toString(), headers);
    	
    	// poziv REST servisa za kreiranje
    	ResponseEntity<Void> responseEntity = 
    			restTemplate.postForEntity(baseUrl + "/" + DB_CATEGORY_ID + "/type",
    					httpEntity, Void.class);
    	
    	// provera statusa
    	assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
	}

	@Test
	public void testGetCategoryTypeSuccessful() {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<CulturalCategoryTypeDTO> responseEntity = restTemplate.exchange(
    			baseUrl + "/type/" + DB_ID, HttpMethod.GET, 
    			httpEntity, CulturalCategoryTypeDTO.class);
	
    	// provera statusa
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	// provera vrednosti
    	CulturalCategoryTypeDTO type = responseEntity.getBody();
    	assertEquals(DB_ID, type.getId());
    	assertEquals(DB_NAME, type.getName());
	}
	
	@Test
	public void testGetCategoryTypeNotExistingId() {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<CulturalCategoryTypeDTO> responseEntity = restTemplate.exchange(
    			baseUrl + "/type/" + INVALID_ID, HttpMethod.GET, 
    			httpEntity, CulturalCategoryTypeDTO.class);
	
    	// provera statusa
    	assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
	}

	@Test
	public void testUpdateCategoryTypeSuccessful() {
		// neophodna autorizacija
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        //neophodno postaviti consumes
        headers.setContentType(MediaType.APPLICATION_JSON);

        //pravljenje dto objekta
        JSONObject updatedTypeDto = new JSONObject();
        updatedTypeDto.put("name", UPDATED_CATEGORY_TYPE_NAME);

        HttpEntity<Object> httpEntity = new HttpEntity<Object>(updatedTypeDto.toString(), headers);

        ResponseEntity<CulturalCategoryTypeDTO> responseEntity = restTemplate.exchange(
                baseUrl + "/type/" + DB_ID,
                HttpMethod.PUT, httpEntity, CulturalCategoryTypeDTO.class);

        CulturalCategoryTypeDTO updatedType = responseEntity.getBody();

        // provera statusa
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        
        // provera vrednosti
        assertEquals(UPDATED_CATEGORY_TYPE_NAME, updatedType.getName());

        // vracanje baze na staro
        updatedTypeDto.put("name", DB_NAME);
        httpEntity = new HttpEntity<Object>(updatedTypeDto.toString(), headers);
        responseEntity = restTemplate.exchange(
        		baseUrl + "/type/" + DB_ID, HttpMethod.PUT, httpEntity, CulturalCategoryTypeDTO.class);
	}
	
	@Test
	public void testUpdateCategoryTypeExistingName() {
		// neophodna autorizacija
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        //neophodno postaviti consumes
        headers.setContentType(MediaType.APPLICATION_JSON);

        //pravljenje dto objekta
        JSONObject updatedTypeDto = new JSONObject();
        updatedTypeDto.put("name", DB_EXISTING_NAME);

        HttpEntity<Object> httpEntity = new HttpEntity<Object>(updatedTypeDto.toString(), headers);

        ResponseEntity<CulturalCategoryTypeDTO> responseEntity = restTemplate.exchange(
                baseUrl + "/type/" + DB_ID,
                HttpMethod.PUT, httpEntity, CulturalCategoryTypeDTO.class);

        // provera statusa
        assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
    }

	@Test
	public void testDeleteCategoryTypeSuccessful() throws Exception {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", this.accessToken);
		HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
		
		// ubacujemo kategoriju koju cemo da brisemo
		CulturalCategoryType forDelete = 
				culturalCategoryTypeService.create(
						DB_CATEGORY_ID, new CulturalCategoryType(NEW_CATEGORY_TYPE_NAME));
		
		int dbSizeBefore = culturalCategoryTypeService.findAll().size();
		
		// poziv REST servisa za brisanje
		ResponseEntity<Void> responseEntity = restTemplate.exchange(
				baseUrl + "/type/" + forDelete.getId(),
				HttpMethod.DELETE, httpEntity, Void.class);
		
		// provera statusa
		assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
		
		assertEquals(dbSizeBefore - 1, culturalCategoryTypeService.findAll().size());
	}
	
	@Test
	public void testDeleteCategoryTypeInvalidId() throws Exception {
		// neophodna autorizacija
		login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);
		
		//postavljanje autorizacije u header
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", this.accessToken);
		HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

		int dbSizeBefore = culturalCategoryTypeService.findAll().size();
		
		// poziv REST servisa za brisanje
		ResponseEntity<Void> responseEntity = restTemplate.exchange(
				baseUrl + "/type/" + INVALID_ID,
				HttpMethod.DELETE, httpEntity, Void.class);
		
		// provera statusa
		assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
		
		assertEquals(dbSizeBefore, culturalCategoryTypeService.findAll().size());
	}

}
