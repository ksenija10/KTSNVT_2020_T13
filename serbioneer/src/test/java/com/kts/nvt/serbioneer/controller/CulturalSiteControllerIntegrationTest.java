package com.kts.nvt.serbioneer.controller;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import static com.kts.nvt.serbioneer.constants.CulturalSiteConstants.*;

import java.net.URISyntaxException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.client.RestClientException;

import com.kts.nvt.serbioneer.dto.CulturalSiteDTO;
import com.kts.nvt.serbioneer.dto.CulturalSiteFilterDTO;
import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.helper.HelperPage;
import com.kts.nvt.serbioneer.service.CulturalSiteService;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalSiteControllerIntegrationTest {

	@Autowired
    private TestRestTemplate restTemplate;
	
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
    public void testFilter() throws RestClientException, URISyntaxException {
    	CulturalSiteFilterDTO siteDto = new CulturalSiteFilterDTO("", "", "", "");
    	
    	HttpHeaders headers = new HttpHeaders();     
        HttpEntity<Object> request = new HttpEntity<>(siteDto, headers);

    	ResponseEntity<HelperPage<CulturalSiteDTO>> responseEntity = restTemplate.exchange(
    			"/api/cultural-site/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
    	assertNotNull(responseEntity.getBody());
    	assertEquals(CITES_NUM, responseEntity.getBody().getTotalElements());
    	
    	siteDto = new CulturalSiteFilterDTO("", TYPE_NAME, "", "");
    	request = new HttpEntity<>(siteDto, headers);
    	responseEntity = restTemplate.exchange(
    			"/api/cultural-site/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
    	assertNotNull(responseEntity.getBody());
    	assertEquals(FILTER_SAJAM_NUM, responseEntity.getBody().getTotalElements());
    	
    	siteDto = new CulturalSiteFilterDTO("", "", CITE_NAME, "");
    	request = new HttpEntity<>(siteDto, headers);
    	responseEntity = restTemplate.exchange(
    			"/api/cultural-site/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
    	assertNotNull(responseEntity.getBody());
    	assertEquals(FILTER_SAJAM_NUM, responseEntity.getBody().getTotalElements());
    	
    	siteDto = new CulturalSiteFilterDTO("", "", "", LOCATION);
    	request = new HttpEntity<>(siteDto, headers);
    	responseEntity = restTemplate.exchange(
    			"/api/cultural-site/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
    	assertNotNull(responseEntity.getBody());
    	assertEquals(FILTER_SABAC_NUM, responseEntity.getBody().getTotalElements());
    	
    	siteDto = new CulturalSiteFilterDTO(CATEGORY_NAME, "", "", LOCATION);
    	request = new HttpEntity<>(siteDto, headers);
    	responseEntity = restTemplate.exchange(
    			"/api/cultural-site/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
    	assertNotNull(responseEntity.getBody());
    	assertEquals(FILTER_NUM, responseEntity.getBody().getTotalElements());
    	
    	siteDto = new CulturalSiteFilterDTO("", TYPE_NAME, "", NO_LOCATION);
    	request = new HttpEntity<>(siteDto, headers);
    	responseEntity = restTemplate.exchange(
    			"/api/cultural-site/filter/by-page?page=0&size=3", HttpMethod.POST, request, 
    			new ParameterizedTypeReference<HelperPage<CulturalSiteDTO>>() {});
    	assertNotNull(responseEntity.getBody());
    	assertEquals(FILTER_NO_NUM, responseEntity.getBody().getTotalElements());
    }
}
