package com.kts.nvt.serbioneer.controller;

import static com.kts.nvt.serbioneer.constants.RatingConstants.CULTURAL_SITE_ID;
import static com.kts.nvt.serbioneer.constants.RatingConstants.NEW_CULTURAL_SITE;
import static com.kts.nvt.serbioneer.constants.RatingConstants.NEW_USER_PASSWORD;
import static com.kts.nvt.serbioneer.constants.RatingConstants.NEW_USER_USERNAME;
import static com.kts.nvt.serbioneer.constants.RatingConstants.NEW_VALUE;
import static com.kts.nvt.serbioneer.constants.RatingConstants.RATING_ID;
import static com.kts.nvt.serbioneer.constants.RatingConstants.USER_PASSWORD;
import static com.kts.nvt.serbioneer.constants.RatingConstants.USER_USERNAME;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;
import java.util.Objects;

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
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.kts.nvt.serbioneer.dto.RatingDTO;
import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.helper.HelperPage;
import com.kts.nvt.serbioneer.jwt.JwtBasedAuthentication;
import com.kts.nvt.serbioneer.model.Rating;
import com.kts.nvt.serbioneer.service.RatingService;
import com.kts.nvt.serbioneer.service.SecureUserDetailsService;

import net.minidev.json.JSONObject;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class RatingControllerIntegrationTest {

    @Autowired
    private RatingService ratingService;

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private SecureUserDetailsService userDetailsService;

    private String accessToken;

    public void login(String username, String password) {
        //poziv REST servisa za logovanje
        ResponseEntity<UserLoginDTO> responseEntity = restTemplate.postForEntity("/login",
                new UserLoginDTO(username, password), UserLoginDTO.class);
        //postavljanje authorization tokena
        this.accessToken = Objects.requireNonNull(responseEntity.getHeaders().get("Authorization")).get(0);
    }

    @Test
    public void Test_get_all_ratings_for_cultural_site_page(){
        login(USER_USERNAME, USER_PASSWORD);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        ResponseEntity<HelperPage<RatingDTO>> responseEntity = restTemplate.exchange("/api/rating/cultural-site/1/by-page?page=0&size=3",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<RatingDTO>>() {} );

        List<RatingDTO> ratings = Objects.requireNonNull(responseEntity.getBody()).toList();
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(1, ratings.size());
    }


    @Test
    public void Test_get_all_ratings_for_authenticated_user() {
        login(USER_USERNAME, USER_PASSWORD);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<>(headers);

        ResponseEntity<HelperPage<RatingDTO>> responseEntity = restTemplate.exchange("/api/rating/authenticated-user/2/by-page?page=0&size=3",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<>() {} );

        List<RatingDTO> ratings = Objects.requireNonNull(responseEntity.getBody()).toList();
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(2, ratings.size());
    }

    @Test
    @Transactional
    @Rollback
    public void Test_create_rating() throws Exception {
        login(NEW_USER_USERNAME, NEW_USER_PASSWORD);

        UserDetails userDetails = userDetailsService.loadUserByUsername(NEW_USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        headers.setContentType(MediaType.APPLICATION_JSON);

        JSONObject ratingDto = new JSONObject();
        ratingDto.put("value", NEW_VALUE);


        HttpEntity<Object> httpEntity = new HttpEntity<>(ratingDto.toString(), headers);

        int size = ratingService.findAll().size();

        ResponseEntity<RatingDTO> responseEntity = restTemplate.postForEntity("/api/rating/cultural-site/"+NEW_CULTURAL_SITE, httpEntity, RatingDTO.class);

        assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
        assertNotNull(responseEntity.getBody());
        assertEquals(size + 1, ratingService.findAll().size());
        assertEquals(NEW_VALUE, responseEntity.getBody().getValue());

//        ratingService.delete(NEW_ID);

    }

    @Test
    @Transactional
    @Rollback
    public void Test_update_rating(){
        login(USER_USERNAME, USER_PASSWORD);

        UserDetails userDetails = userDetailsService.loadUserByUsername(NEW_USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        headers.setContentType(MediaType.APPLICATION_JSON);

        JSONObject ratingDto = new JSONObject();
        ratingDto.put("id", RATING_ID);
        ratingDto.put("value", NEW_VALUE);
        ratingDto.put("culturalSiteId", CULTURAL_SITE_ID);

        HttpEntity<Object> httpEntity = new HttpEntity<>(ratingDto.toString(), headers);

        Rating rating = ratingService.findOneById(RATING_ID);

        ResponseEntity<RatingDTO> responseEntity = restTemplate.exchange("/api/rating/", HttpMethod.PUT, httpEntity, RatingDTO.class);


        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertNotNull(responseEntity.getBody());
        assertNotEquals(NEW_VALUE, rating.getValue());
        assertEquals(NEW_VALUE, responseEntity.getBody().getValue());

    }
}
