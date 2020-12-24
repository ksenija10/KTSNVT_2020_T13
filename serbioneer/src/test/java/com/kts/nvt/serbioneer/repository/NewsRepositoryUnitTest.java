package com.kts.nvt.serbioneer.repository;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.News;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.Set;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import static com.kts.nvt.serbioneer.constants.NewsConstants.*;

@RunWith(SpringRunner.class)
@DataJpaTest
@TestPropertySource("classpath:test.properties")
public class NewsRepositoryUnitTest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private NewsRepository newsRepository;

    private Set<CulturalSite> subscribedCulturalSites;

    @Before
    public void setUp() {
        CulturalSite culturalSite = entityManager.find(CulturalSite.class, CULTURAL_SITE_ID);

        News news = new News();
        news.setInformation(NEWS_INFORMATION);
        news.setDateTime(NEWS_DATE);
        news.setCulturalSite(culturalSite);

        entityManager.persist(news);

        //Subscribed cultural sites for authenticated user
        AuthenticatedUser authenticatedUser = entityManager.find(AuthenticatedUser.class, AUTHENTICATED_USER_ID);
        this.subscribedCulturalSites = authenticatedUser.getSubscribedSites();
    }

    @Test
    public void testFindAllByCulturalSiteId() {
        List<News> newsByCulturalSiteId = newsRepository.findAllByCulturalSiteId(CULTURAL_SITE_ID);

        assertEquals(NEWS_BY_CULTURAL_SITE_ID_1_ADD_SIZE, newsByCulturalSiteId.size());
    }

    @Test
    public void testFindAllByCulturalSiteIdPageable() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<News> newsByCulturalSiteId = newsRepository.findAllByCulturalSiteId(pageable, CULTURAL_SITE_ID);

        assertEquals(NEWS_BY_CULTURAL_SITE_ID_1_ADD_SIZE, newsByCulturalSiteId.getContent().size());
    }

    @Test
    public void testFindAllByCulturalSiteInOrderByDateTimeDesc() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<News> newsByCulturalSiteInOrderByDateTimeDesc =
                newsRepository.findAllByCulturalSiteInOrderByDateTimeDesc(subscribedCulturalSites, pageable);

        assertEquals(NEWS_BY_CULTURAL_SITES_ADD_SIZE, newsByCulturalSiteInOrderByDateTimeDesc.getContent().size());
        assertTrue(newsByCulturalSiteInOrderByDateTimeDesc.getContent().get(0).getDateTime().after(
                newsByCulturalSiteInOrderByDateTimeDesc.getContent().get(1).getDateTime()
            ));
    }
}
