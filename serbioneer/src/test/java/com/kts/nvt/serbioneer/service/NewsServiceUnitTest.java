package com.kts.nvt.serbioneer.service;



import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.News;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepository;
import com.kts.nvt.serbioneer.repository.NewsRepository;
import com.kts.nvt.serbioneer.repository.UserRepository;
import org.checkerframework.checker.index.qual.SameLenBottom;
import org.junit.Before;
import org.junit.Test;
import org.junit.jupiter.api.BeforeAll;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import javax.transaction.Transactional;
import java.util.*;

import static com.kts.nvt.serbioneer.constants.NewsConstants.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class NewsServiceUnitTest {

    @Autowired
    private NewsService newsService;

    @MockBean
    private NewsRepository newsRepository;

    @MockBean
    private CulturalSiteService culturalSiteService;

    @MockBean
    private AuthenticatedUserRepository userRepository;

    private Set<CulturalSite> subscribedCulturalSites;

    @Before
    public void setUp() {
        //create successful
        given(culturalSiteService.findOneById(EXISTING_CULTURAL_SITE_ID)).willReturn(CULTURAL_SITE);
        SAVED_NEWS.setId(NEW_NEWS_ID);
        SAVED_NEWS.setDateTime(new Date());
        SAVED_NEWS.setCulturalSite(CULTURAL_SITE);
        given(newsRepository.save(NEW_NEWS)).willReturn(SAVED_NEWS);

        //find non existing cultural site id
        given(culturalSiteService.findOneById(NON_EXISTING_CULTURAL_SITE_ID)).willReturn(null);

        //find existing news id
        given(newsRepository.findById(EXISTING_NEWS_ID)).willReturn(Optional.of(EXISTING_NEWS));

        //delete successful
        doNothing().when(newsRepository).delete(EXISTING_NEWS);

        //All subscribed news
        List<News> allSubscribedNews = new ArrayList<>();
        allSubscribedNews.add(NEWS_1);
        allSubscribedNews.add(NEWS_2);
        allSubscribedNews.add(NEWS_3);

        //Pageable
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<News> subscribedNewsPage = new PageImpl<>(allSubscribedNews, pageable, ALL_NEWS);

        //getAllSubscribedNews
        this.subscribedCulturalSites = new HashSet<>();
        subscribedCulturalSites.add(CULTURAL_SITE);
        EXISTING_AUTHENTICATED_USER.setSubscribedSites(subscribedCulturalSites);
        given(newsRepository.findAllByCulturalSiteInOrderByDateTimeDesc(subscribedCulturalSites, pageable)).
                willReturn(subscribedNewsPage);

        //find authenticated user
        given(userRepository.findById(EXISTING_USER_ID)).willReturn(Optional.of(EXISTING_AUTHENTICATED_USER));

        //non existing user id
        given(userRepository.findById(NON_EXISTING_USER_ID)).willReturn(Optional.empty());
    }

    @Test
    public void testCreateSuccessful() throws Exception {
       News news = newsService.create(EXISTING_CULTURAL_SITE_ID, NEW_NEWS);

        verify(culturalSiteService, times(1)).findOneById(EXISTING_CULTURAL_SITE_ID);
        verify(newsRepository, times(1)).save(NEW_NEWS);

        assertNotNull(news);
        assertEquals(EXISTING_CULTURAL_SITE_ID, news.getCulturalSite().getId());
    }

    @Test(expected = NonexistentIdException.class)
    public void testCreateNonExisting() throws Exception {
        News news = newsService.create(NON_EXISTING_CULTURAL_SITE_ID, NEW_NEWS);

        verify(culturalSiteService, times(1)).findOneById(EXISTING_CULTURAL_SITE_ID);
        verify(newsRepository, times(0)).save(NEW_NEWS);

        assertNull(news);
    }

    @Test
    public void testDeleteSuccessful() throws Exception {
        newsService.delete(EXISTING_NEWS_ID);

        verify(newsRepository, times(1)).findById(EXISTING_NEWS_ID);
        verify(newsRepository, times(1)).delete(EXISTING_NEWS);
    }

    @Test(expected = NonexistentIdException.class)
    public void testDeleteNonExisting() throws Exception {
        newsService.delete(NON_EXISTING_NEWS_ID);

        verify(newsRepository, times(1)).findById(NON_EXISTING_NEWS_ID);
        verify(newsRepository, times(0)).delete(EXISTING_NEWS);
    }

    @Test
    public void testUpdateSuccessful() throws Exception {
        News news = newsService.update(EXISTING_NEWS, EXISTING_NEWS_ID);

        verify(newsRepository, times(1)).findById(EXISTING_NEWS_ID);
        verify(newsRepository, times(1)).save(EXISTING_NEWS);
    }

    @Test(expected = NonexistentIdException.class)
    public void testUpdateNonExisting() throws Exception {
        News news = newsService.update(EXISTING_NEWS, NON_EXISTING_NEWS_ID);

        verify(newsRepository, times(1)).findById(NON_EXISTING_NEWS_ID);
        verify(newsRepository, times(0)).save(EXISTING_NEWS);
    }

    @Test
    @Transactional
    public void testGetAllSubscribedNewsSuccessful() throws Exception {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<News> subscribedNewsPageable = newsService.getAllSubscribedNews(pageable,EXISTING_USER_ID);

        verify(userRepository, times(1)).findById(EXISTING_USER_ID);
        verify(newsRepository, times(1)).findAllByCulturalSiteInOrderByDateTimeDesc(this.subscribedCulturalSites, pageable);
        assertEquals(NEWS_BY_CULTURAL_SITE_ID_1_ADD, subscribedNewsPageable.getContent().size());
    }

    @Test(expected = NonexistentIdException.class)
    @Transactional
    public void testGetAllSubscribedNewsNonExistentAuthenticatedUser() throws Exception {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<News> subscribedNewsPageable = newsService.getAllSubscribedNews(pageable,NON_EXISTING_USER_ID);

        verify(userRepository, times(1)).findById(NON_EXISTING_USER_ID);
        verify(newsRepository, times(0)).findAllByCulturalSiteInOrderByDateTimeDesc(this.subscribedCulturalSites, pageable);
        assertEquals(0, subscribedNewsPageable.getContent().size());

    }
}
