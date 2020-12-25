package com.kts.nvt.serbioneer.repository;

import com.kts.nvt.serbioneer.model.Rating;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static com.kts.nvt.serbioneer.constants.RatingConstants.*;
import static com.kts.nvt.serbioneer.constants.RatingConstants.USER_ID;
import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class RatingRepositoryIntegrationTest {

    @Autowired
    RatingRepository ratingRepository;


    @Test
    public void Test_find_all_by_cultural_site_id_page() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Rating> found = ratingRepository.findAllByCulturalSiteId(pageable, CULTURAL_SITE_ID);

        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all_by_authenticated_user_id_page() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Rating> found = ratingRepository.findAllByAuthenticatedUserId(pageable, USER_ID);

        assertEquals(2, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all() {
        List<Rating> found = ratingRepository.findAll();

        assertEquals(2, found.size());
    }

    @Test
    public void Test_find_all_by_cultural_site_id() {
        List<Rating> found = ratingRepository.findAllByCulturalSiteId(CULTURAL_SITE_ID);

        assertEquals(1, found.size());
    }

    @Test
    public void Test_find_all_by_authenticated_user_id() {
        List<Rating> found = ratingRepository.findAllByAuthenticatedUserId(USER_ID);

        assertEquals(2, found.size());
    }
}
