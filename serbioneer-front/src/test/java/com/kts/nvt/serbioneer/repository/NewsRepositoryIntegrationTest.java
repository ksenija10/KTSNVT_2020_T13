package com.kts.nvt.serbioneer.repository;

import static com.kts.nvt.serbioneer.constants.NewsConstants.EXISTING_CULTURAL_SITE_ID;
import static com.kts.nvt.serbioneer.constants.NewsConstants.EXISTING_USER_ID;
import static com.kts.nvt.serbioneer.constants.NewsConstants.NEWS_BY_CULTURAL_SITES_ADD;
import static com.kts.nvt.serbioneer.constants.NewsConstants.NEWS_CULTURAL_SITE_ID_1;
import static com.kts.nvt.serbioneer.constants.NewsConstants.PAGEABLE_PAGE;
import static com.kts.nvt.serbioneer.constants.NewsConstants.PAGEABLE_SIZE;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.News;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class NewsRepositoryIntegrationTest {

    @Autowired
    private NewsRepository newsRepository;

    @Autowired
    private AuthenticatedUserRepository userRepository;

    @Test
    public void testFindAllByCulturalSiteId() {
        List<News> newsByCulturalSiteId = newsRepository.findAllByCulturalSiteId(EXISTING_CULTURAL_SITE_ID);

        assertEquals(NEWS_CULTURAL_SITE_ID_1, newsByCulturalSiteId.size());
    }

    @Test
    public void testFindAllByCulturalSiteIdPageable() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<News> newsByCulturalSiteId = newsRepository.findAllByCulturalSiteId(pageable, EXISTING_CULTURAL_SITE_ID);

        assertEquals(NEWS_CULTURAL_SITE_ID_1, newsByCulturalSiteId.getContent().size());
    }

    @Test
    @Transactional
    public void testFindAllByCulturalSiteInOrderByDateTimeDesc() {
        Set<CulturalSite> subscribedCulturalSites = (userRepository.findById(EXISTING_USER_ID).
                orElse(null)).getSubscribedSites();
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<News> newsByCulturalSiteInOrderByDateTimeDesc =
                newsRepository.findAllByCulturalSiteInOrderByDateTimeDesc(subscribedCulturalSites, pageable);

        assertEquals(NEWS_BY_CULTURAL_SITES_ADD, newsByCulturalSiteInOrderByDateTimeDesc.getContent().size());
        assertTrue(newsByCulturalSiteInOrderByDateTimeDesc.getContent().get(0).getDateTime().after(
                newsByCulturalSiteInOrderByDateTimeDesc.getContent().get(1).getDateTime()
        ));
    }
}
