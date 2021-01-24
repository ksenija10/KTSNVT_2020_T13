package com.kts.nvt.serbioneer.controller;

import static com.kts.nvt.serbioneer.constants.CulturalSiteConstants.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.net.URISyntaxException;
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
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.client.RestClientException;

import com.kts.nvt.serbioneer.dto.CommentDTO;
import com.kts.nvt.serbioneer.dto.CulturalSiteDTO;
import com.kts.nvt.serbioneer.dto.CulturalSiteFilterDTO;
import com.kts.nvt.serbioneer.dto.NewsDTO;
import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.helper.HelperPage;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.News;
import com.kts.nvt.serbioneer.service.CommentService;
import com.kts.nvt.serbioneer.service.CulturalSiteService;
import com.kts.nvt.serbioneer.service.NewsService;

import net.minidev.json.JSONObject;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalSiteControllerIntegrationTest {

	@Autowired
    private TestRestTemplate restTemplate;
	
	@Autowired
	private CulturalSiteService culturalSiteService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private NewsService newsService;
	
	private final String baseURL = "/api/cultural-site";
	
	private String accessToken;
    
    public void login(String username, String password) {
    	//poziv REST servisa za logovanje
    	ResponseEntity<UserLoginDTO> responseEntity = restTemplate.postForEntity("/login", 
    													new UserLoginDTO(username, password), UserLoginDTO.class);
    	//postavljanje authorization tokena
        this.accessToken = responseEntity.getHeaders().get("Authorization").get(0);
    }
    
    @Test
    public void testGetAllCulturalSites() {
    	HttpHeaders headers = new HttpHeaders();
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<HelperPage<CulturalSiteDTO>> responseEntity = restTemplate.exchange(baseURL + "/by-page?page=0&size=3",
    			HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
    	
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(CITES_NUM, responseEntity.getBody().getTotalElements());
    }
    
    @Test
    public void testCreateCulturalSite() throws Exception {
    	login(ADMIN_USERNAME, ADMIN_PASSWORD);
    	
    	List<CulturalSite> citesBefore = culturalSiteService.findAll();
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	JSONObject citeDto = new JSONObject();
    	//citeDto.put("id", 1L);
    	citeDto.put("name", NEW_CULTURAL_SITE_NAME);
    	citeDto.put("categoryId", NEW_CATEGORY_ID);
    	citeDto.put("categoryTypeId", NEW_TYPE_ID);
    	citeDto.put("lat", NEW_CULTURAL_SITE_LAT);
    	citeDto.put("lng", NEW_CULTURAL_SITE_LNG);
    	citeDto.put("address", NEW_CULTURAL_SITE_ADDRESS);
    	citeDto.put("city", NEW_CULTURAL_SITE_CITY);
    	//citeDto.put("description", "");
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(citeDto.toString(), headers);
    	
    	ResponseEntity<CulturalSiteDTO> responseEntity = restTemplate.postForEntity(baseURL, 
    			httpEntity, CulturalSiteDTO.class );
    	
    	List<CulturalSite> citesAfter = culturalSiteService.findAll();
    	
    	assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
    	assertNotNull(responseEntity.getBody());
    	assertEquals(citesBefore.size() + 1, citesAfter.size());
    	
    	//provera vrednosti
    	CulturalSite newCite = citesAfter.get(citesAfter.size() - 1);
    	assertEquals(NEW_CULTURAL_SITE_NAME, newCite.getName());
    	assertEquals(NEW_CATEGORY_ID, newCite.getCulturalSiteCategory().getId());
    	assertEquals(NEW_TYPE_ID, newCite.getCulturalCategoryType().getId());
    	assertEquals(NEW_CULTURAL_SITE_LAT, newCite.getLat());
    	assertEquals(NEW_CULTURAL_SITE_LNG, newCite.getLng());
    	assertEquals(NEW_CULTURAL_SITE_ADDRESS, newCite.getAddress());
    	assertEquals(NEW_CULTURAL_SITE_CITY, newCite.getCity());
    	
    	//vratiti bazu na staro
    	culturalSiteService.delete(responseEntity.getBody().getId());
    }
    
    @Test
    public void testGetCulturalSite() {
    	ResponseEntity<CulturalSiteDTO> responseEntity = restTemplate.getForEntity(baseURL + "/" + CULTURAL_SITE_ID,
    			CulturalSiteDTO.class);
    	
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertEquals(CULTURAL_SITE_ID, responseEntity.getBody().getId());
    }
    
    @Test
    public void testUpdateCulturalSite() {
    	login(ADMIN_USERNAME, ADMIN_PASSWORD);
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
//    	CulturalSiteDTO cDto = new CulturalSiteDTO("Sabacki letnji festival", 2L, "Manifestacija", 3L, "Festival", 
//    			"Sabacka Tvrdjava, Kralja Aleksandra", "Šabac", "joj");
    	
    	JSONObject culturalSiteDto = new JSONObject();
    	culturalSiteDto.put("name", "Sabacki letnji festival");
    	culturalSiteDto.put("categoryId", 2L);
    	culturalSiteDto.put("categoryTypeId", 3L);
    	culturalSiteDto.put("lat", 44.7556269);
    	culturalSiteDto.put("lng", 19.6923025);
    	culturalSiteDto.put("address", "Masarikova 6");
    	culturalSiteDto.put("city", "Novi Sad");
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(culturalSiteDto.toString(), headers);
    	
    	ResponseEntity<CulturalSiteDTO> responseEntity = restTemplate.exchange(baseURL + "/" + CULTURAL_SITE_UPDATE_ID, 
    			HttpMethod.PUT, httpEntity, CulturalSiteDTO.class);
    	
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	// provera vrednosti
    	CulturalSite updatedCite = culturalSiteService.findOneById(CULTURAL_SITE_UPDATE_ID);
    	assertEquals("Sabacki letnji festival", updatedCite.getName());
    	assertEquals(2L, updatedCite.getCulturalSiteCategory().getId());
    	assertEquals(3L, updatedCite.getCulturalCategoryType().getId());
    	assertEquals(44.7556269, updatedCite.getLat());
    	assertEquals(19.6923025, updatedCite.getLng());
    	assertEquals("Masarikova 6", updatedCite.getAddress());
    	assertEquals("Novi Sad", updatedCite.getCity());
    }
    
    @Test
    public void testDeleteCulturalSite() throws Exception {
    	login(ADMIN_USERNAME, ADMIN_PASSWORD);
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	CulturalSite siteToCreate = new CulturalSite(DELETE_CULTURAL_SITE_NAME, DELETE_CULTURAL_SITE_LAT, 
    			DELETE_CULTURAL_SITE_LNG, DELETE_CULTURAL_SITE_ADDRESS, DELETE_CULTURAL_SITE_CITY, DELETE_CULTURAL_SITE_DESC);
    	
    	CulturalSite culturalSite = culturalSiteService.create(siteToCreate, DELETE_CATEGORY_ID, DELETE_TYPE_ID);
    	
    	List<CulturalSite> citesBefore = culturalSiteService.findAll();
    	
    	ResponseEntity<Void> responseEntity = restTemplate.exchange(baseURL + "/" + culturalSite.getId(),
    			HttpMethod.DELETE, httpEntity, Void.class);
    	
    	List<CulturalSite> citesAfter = culturalSiteService.findAll();
    	
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertEquals(citesBefore.size() - 1, citesAfter.size());
    }
    
    @Test
    public void testGetAllComments() {
    	HttpHeaders headers = new HttpHeaders();
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<HelperPage<CommentDTO>> responseEntity = restTemplate.exchange(baseURL + "/" + CULTURAL_SITE_ID + 
    			"/comment/by-page?page=0&size=3", HttpMethod.GET,
    			httpEntity, new ParameterizedTypeReference<HelperPage<CommentDTO>>() {});
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertEquals(2, responseEntity.getBody().getTotalElements());
    }
    
    @Test
    public void testCreateComment() throws Exception {
    	login(USER_USERNAME, USER_PASSWORD);
    	
    	List<Comment> commentsBefore = commentService.findAllByCulturalSiteIdAndApproved(CULTURAL_SITE_ID, false);
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	JSONObject commentDto = new JSONObject();
    	commentDto.put("text", NEW_COMMENT);
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(commentDto.toString(), headers);
    	
    	ResponseEntity<CommentDTO> responseEntity = restTemplate.postForEntity(baseURL + "/" + CULTURAL_SITE_ID
    			+ "/comment", 
				httpEntity, CommentDTO.class);
    	
    	List<Comment> commentsAfter = commentService.findAllByCulturalSiteIdAndApproved(CULTURAL_SITE_ID, false);
    	
    	assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
    	assertNotNull(responseEntity.getBody());
    	assertEquals(commentsBefore.size() + 1, commentsAfter.size());
    	
    	// provera vrednosti
    	Comment newComment = commentsAfter.get(commentsAfter.size() - 1);
    	assertEquals(NEW_COMMENT, newComment.getText());
    	assertEquals(USER_ID, newComment.getAuthenticatedUser().getId());
    	
    	// vracanje baze na staro
    	// neophodno je prvo odobriti komentar da bismo ga obrisali
    	commentService.approve(responseEntity.getBody().getId());
    	commentService.delete(responseEntity.getBody().getId(), USER_ID);
    }

    @Test
    public void testGetAllNews() {
    	HttpHeaders headers = new HttpHeaders();
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<HelperPage<NewsDTO>> responseEntity = restTemplate.exchange(baseURL + "/" + CULTURAL_SITE_ID2 + 
    			"/news/by-page?page=0&size=3", HttpMethod.GET,
    			httpEntity, new ParameterizedTypeReference<HelperPage<NewsDTO>>() {});
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertEquals(NUM_OF_NEWS, responseEntity.getBody().getTotalElements());
    }
    
    @Test
    public void testCreateNews() throws Exception {
    	login(ADMIN_USERNAME, ADMIN_PASSWORD);
    	
    	List<News> newsBefore = newsService.findAllByCulturalSiteId(CULTURAL_SITE_ID2);
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	headers.setContentType(MediaType.APPLICATION_JSON);
    	
    	JSONObject commentDto = new JSONObject();
    	commentDto.put("information", NEW_NEWS);
    	
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(commentDto.toString(), headers);
    	
    	ResponseEntity<NewsDTO> responseEntity = restTemplate.postForEntity(baseURL + "/" + CULTURAL_SITE_ID2
    			+ "/news", httpEntity, NewsDTO.class );
    	
    	List<News> newsAfter = newsService.findAllByCulturalSiteId(CULTURAL_SITE_ID2);
    	
    	assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
    	assertNotNull(responseEntity.getBody());
    	assertEquals(newsBefore.size() + 1, newsAfter.size());
    	
    	// provera vrednosti
    	News newNews = newsAfter.get(newsAfter.size() - 1);
    	assertEquals(NEW_NEWS, newNews.getInformation());
    	
    	// vracanje baze na staro
    	newsService.delete(responseEntity.getBody().getId());
    }

    @Test
    public void testGetAllSubscribedSites() {
    	login(USER2_USERNAME, USER2_PASSWORD);
    	
    	HttpHeaders headers = new HttpHeaders();
    	headers.add("Authorization", this.accessToken);
    	HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);
    	
    	ResponseEntity<HelperPage<CulturalSiteDTO>> responseEntity = restTemplate.exchange(
    			baseURL + "/subscribed/by-page?page=0&size=3&userEmail='bilosta'",
    			HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertEquals(NUM_OF_SUBSCRIBED, responseEntity.getBody().getTotalElements());
    }
    
    @Test
    public void testFilter() throws RestClientException, URISyntaxException {
    	String[] catNames = new String[1];
    	CulturalSiteFilterDTO siteDto = new CulturalSiteFilterDTO(catNames, "", "");
    	
    	HttpHeaders headers = new HttpHeaders();     
        HttpEntity<Object> request = new HttpEntity<>(siteDto, headers);

    	ResponseEntity<HelperPage<CulturalSiteDTO>> responseEntity = restTemplate.exchange(
    			baseURL + "/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
    	assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertNotNull(responseEntity.getBody());
    	assertEquals(CITES_NUM, responseEntity.getBody().getTotalElements());
    }
    
    @Test
    public void testFilterCategory() throws RestClientException, URISyntaxException {
    	String[] catNames = {"Manifestacija"};
    	CulturalSiteFilterDTO siteDto = new CulturalSiteFilterDTO(catNames, "", "");
    	HttpHeaders headers = new HttpHeaders();     
        HttpEntity<Object> request = new HttpEntity<>(siteDto, headers);
        ResponseEntity<HelperPage<CulturalSiteDTO>> responseEntity = restTemplate.exchange(
        		baseURL + "/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertNotNull(responseEntity.getBody());
    	assertEquals(FILTER_SAJAM_NUM, responseEntity.getBody().getTotalElements());
    }
    
    @Test
    public void testFilterCite() throws RestClientException, URISyntaxException {
    	String[] catNames = new String[1];
    	CulturalSiteFilterDTO siteDto = new CulturalSiteFilterDTO(catNames, CITE_NAME, "");
    	HttpHeaders headers = new HttpHeaders();     
        HttpEntity<Object> request = new HttpEntity<>(siteDto, headers);
        ResponseEntity<HelperPage<CulturalSiteDTO>> responseEntity = restTemplate.exchange(
        		baseURL + "/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertNotNull(responseEntity.getBody());
    	assertEquals(FILTER_SAJAM_NUM, responseEntity.getBody().getTotalElements());
    }
    
    @Test
    public void testFilterLocation() throws RestClientException, URISyntaxException {
    	String[] catNames = new String[1];
    	CulturalSiteFilterDTO siteDto = new CulturalSiteFilterDTO(catNames, "", LOCATION);
    	HttpHeaders headers = new HttpHeaders();     
        HttpEntity<Object> request = new HttpEntity<>(siteDto, headers);
        ResponseEntity<HelperPage<CulturalSiteDTO>> responseEntity = restTemplate.exchange(
        		baseURL + "/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertNotNull(responseEntity.getBody());
    	assertEquals(FILTER_SABAC_NUM, responseEntity.getBody().getTotalElements());
    }
    
    @Test
    public void testFilterMultiple() throws RestClientException, URISyntaxException {
    	String[] catNames = {CATEGORY_NAME_CON};
    	CulturalSiteFilterDTO siteDto = new CulturalSiteFilterDTO(catNames, "", LOCATION);
    	HttpHeaders headers = new HttpHeaders();     
        HttpEntity<Object> request = new HttpEntity<>(siteDto, headers);
        ResponseEntity<HelperPage<CulturalSiteDTO>> responseEntity = restTemplate.exchange(
        		baseURL + "/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertNotNull(responseEntity.getBody());
    	assertEquals(FILTER_NUM, responseEntity.getBody().getTotalElements());
    }
    
    @Test
    public void testFilterMultipleZero() throws RestClientException, URISyntaxException {
    	String[] catNames = new String[1];
    	CulturalSiteFilterDTO siteDto = new CulturalSiteFilterDTO(catNames, "", NO_LOCATION);
    	HttpHeaders headers = new HttpHeaders();     
        HttpEntity<Object> request = new HttpEntity<>(siteDto, headers);
        ResponseEntity<HelperPage<CulturalSiteDTO>> responseEntity = restTemplate.exchange(
        		baseURL + "/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    	assertNotNull(responseEntity.getBody());
    	assertEquals(FILTER_NO_NUM, responseEntity.getBody().getTotalElements());

    }

}
