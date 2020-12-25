package com.kts.nvt.serbioneer.service;

import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.jwt.JwtBasedAuthentication;
import com.kts.nvt.serbioneer.model.Rating;
import com.kts.nvt.serbioneer.repository.RatingRepository;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static com.kts.nvt.serbioneer.constants.RatingConstants.*;
import static org.junit.Assert.assertEquals;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.*;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class RatingServiceIntegrationTest {
    @Autowired
    private RatingService ratingService;

    @Autowired
    private RatingRepository ratingRepository;

    @Autowired
    private CulturalSiteService culturalSiteService;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

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
    public void Test_find_all_page() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Rating> found = ratingService.findAll(pageable);

        assertEquals(2, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all_by_cultural_site_id_page() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Rating> found = ratingService.findAllByCulturalSiteId(pageable, CULTURAL_SITE_ID);

        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all_by_authenticated_user_id_page() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Rating> found = ratingService.findAllByAuthenticatedUserId(pageable, USER_ID);

        assertEquals(2, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all() {
        List<Rating> found = ratingService.findAll();

        assertEquals(2, found.size());
    }

    @Test
    public void Test_find_all_by_cultural_site_id() {
        List<Rating> found = ratingService.findAllByCulturalSiteId(CULTURAL_SITE_ID);

        assertEquals(1, found.size());
    }

    @Test
    public void Test_find_all_by_authenticated_user_id() {
        List<Rating> found = ratingService.findAllByAuthenticatedUserId(USER_ID);

        assertEquals(2, found.size());
    }

    @Test
    @Transactional
    @Rollback(value = true)
    public void Test_create() throws Exception {

        login(USER_USERNAME, USER_PASSWORD);
        UserDetails userDetails = userDetailsService.loadUserByUsername(USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        int size = ratingService.findAll().size();

        Rating created = ratingService.create(CULTURAL_SITE_ID, 4);

        assertEquals(NEW_RATING.getValue(), created.getValue());
        assertEquals(size+1, ratingService.findAll().size());
    }

    @Test
    @Transactional
    @Rollback(value = true)
    public void Test_update() throws Exception {
        login(USER_USERNAME, USER_PASSWORD);
        UserDetails userDetails = userDetailsService.loadUserByUsername(USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        Rating updated = ratingService.update(4, RATING_ID);

        assertEquals(NEW_RATING.getValue(), updated.getValue());
    }

    @Test
    @Transactional
    @Rollback(value = true)
    public void Test_delete() throws Exception {
        login(USER_USERNAME, USER_PASSWORD);
        UserDetails userDetails = userDetailsService.loadUserByUsername(USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        int size = ratingService.findAll().size();

        ratingService.delete(2L);

        assertEquals(size -1, ratingService.findAll().size());

    }
}
