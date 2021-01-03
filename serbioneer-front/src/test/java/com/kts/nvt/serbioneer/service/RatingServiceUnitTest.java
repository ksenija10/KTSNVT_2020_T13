package com.kts.nvt.serbioneer.service;

import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.jwt.JwtBasedAuthentication;
import com.kts.nvt.serbioneer.model.*;
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
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import static org.mockito.BDDMockito.given;
import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import static com.kts.nvt.serbioneer.constants.RatingConstants.*;
import static org.mockito.Mockito.*;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class RatingServiceUnitTest {

    @Autowired
    private RatingService ratingService;

    @MockBean
    private RatingRepository ratingRepository;

    @MockBean
    private CulturalSiteService culturalSiteService;

    @MockBean
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

    @Before
    public void setup(){
        List<Rating> ratings = new ArrayList<>();
        ratings.add(RATING);

        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Rating> ratingPage = new PageImpl<>(ratings, pageable, PAGEABLE_TOTAL_ELEMENTS);

        given(ratingRepository.findAll()).willReturn(ratings);
        given(ratingRepository.findAll(pageable)).willReturn(ratingPage);

        given(ratingRepository.findAllByCulturalSiteId(CULTURAL_SITE_ID)).willReturn(ratings);
        given(ratingRepository.findAllByCulturalSiteId(pageable, CULTURAL_SITE_ID)).willReturn(ratingPage);

        given(ratingRepository.findAllByAuthenticatedUserId(USER_ID)).willReturn(ratings);
        given(ratingRepository.findAllByAuthenticatedUserId(pageable, USER_ID)).willReturn(ratingPage);

        given(ratingRepository.findById(RATING_ID)).willReturn(java.util.Optional.of(RATING));
        given(ratingRepository.findById(RATING_ID_RANDOM)).willReturn(java.util.Optional.empty());

        given(ratingRepository.save(NEW_RATING)).willReturn(NEW_RATING);

        doNothing().when(ratingRepository).delete(RATING);

        given(culturalSiteService.findOneById(CULTURAL_SITE_ID)).willReturn(CULTURAL_SITE);
        given(culturalSiteService.findOneById(CULTURAL_SITE_ID_RANDOM)).willReturn(null);
        given(culturalSiteService.updateRating(CULTURAL_SITE)).willReturn(5.);


        given(authenticatedUserService.findOneById(USER_ID)).willReturn(AUTHENTICATED_USER);

        //given(ratingRepository.save(NEW_RATING)).willReturn(NEW_RATING);

    }


    @Test
    public void Test_find_all_page() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Rating> found = ratingService.findAll(pageable);

        verify(ratingRepository, times(1)).findAll(pageable);
        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all_by_cultural_site_id_page() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Rating> found = ratingService.findAllByCulturalSiteId(pageable, CULTURAL_SITE_ID);

        verify(ratingRepository, times(1)).findAllByCulturalSiteId(pageable, CULTURAL_SITE_ID);
        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all_by_authenticated_user_id_page() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Rating> found = ratingService.findAllByAuthenticatedUserId(pageable, USER_ID);

        verify(ratingRepository, times(1)).findAllByAuthenticatedUserId(pageable, USER_ID);
        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all() {
        List<Rating> found = ratingService.findAll();

        verify(ratingRepository, times(1)).findAll();
        assertEquals(1, found.size());
    }

    @Test
    public void Test_find_all_by_cultural_site_id() {
        List<Rating> found = ratingService.findAllByCulturalSiteId(CULTURAL_SITE_ID);

        verify(ratingRepository, times(1)).findAllByCulturalSiteId(CULTURAL_SITE_ID);
        assertEquals(1, found.size());
    }

    @Test
    public void Test_find_all_by_authenticated_user_id() {
        List<Rating> found = ratingService.findAllByAuthenticatedUserId(USER_ID);

        verify(ratingRepository, times(1)).findAllByAuthenticatedUserId(USER_ID);
        assertEquals(1, found.size());
    }

    @Test
    public void Test_create() throws Exception {

        login(USER_USERNAME, USER_PASSWORD);
        UserDetails userDetails = userDetailsService.loadUserByUsername(USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        Rating created = ratingService.create(CULTURAL_SITE_ID, 4);

        verify(culturalSiteService, times(1)).findOneById(CULTURAL_SITE_ID);
        verify(ratingRepository, times(1)).save(NEW_RATING);
        verify(culturalSiteService, times(1)).updateRating(CULTURAL_SITE);

        assertEquals(NEW_RATING.getValue(), created.getValue());
    }

    @Test
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
    public void Test_delete() throws Exception {
        login(USER_USERNAME, USER_PASSWORD);
        UserDetails userDetails = userDetailsService.loadUserByUsername(USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        ratingService.delete(RATING_ID);

        verify(ratingRepository, times(1)).delete(RATING);
    }
}
