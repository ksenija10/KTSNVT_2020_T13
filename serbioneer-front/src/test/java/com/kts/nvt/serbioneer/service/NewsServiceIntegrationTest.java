package com.kts.nvt.serbioneer.service;

import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.News;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import javax.transaction.Transactional;
import java.util.List;

import static com.kts.nvt.serbioneer.constants.NewsConstants.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertNotNull;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class NewsServiceIntegrationTest {

    @Autowired
    private NewsService newsService;

    @Test
    public void testFindAll() {
        List<News> allNews = newsService.findAll();

        assertEquals(ALL_NEWS, allNews.size());
    }

    @Test
    public void testFindAllPageable() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<News> allNews = newsService.findAll(pageable);

        assertEquals(ALL_NEWS, allNews.getContent().size());
    }

    @Test
    public void testFindAllByCulturalSiteId() {
        List<News> allNewsByCulturalSiteId = newsService.findAllByCulturalSiteId(EXISTING_CULTURAL_SITE_ID);

        assertEquals(NEWS_CULTURAL_SITE_ID_1, allNewsByCulturalSiteId.size());
    }

    @Test
    public void testFindAllByCulturalSiteIdPageable() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<News> allNewsByCulturalSiteId = newsService.findAllByCulturalSiteId(pageable, EXISTING_CULTURAL_SITE_ID);

        assertEquals(NEWS_CULTURAL_SITE_ID_1, allNewsByCulturalSiteId.getContent().size());
    }

    @Test
    public void testFindOneById() {
        News news = newsService.findOneById(EXISTING_NEWS_ID);

        assertNotNull(news);
        assertEquals(EXISTING_NEWS_ID, news.getId());
    }

    @Test
    @Transactional
    public void testCreateSuccessful() throws Exception {
        News news = new News();
        news.setInformation(NEWS_INFORMATION);

        int dbSizeBeforeAdd = newsService.findAll().size();

        news = newsService.create(EXISTING_CULTURAL_SITE_ID, news);
        assertNotNull(news);

        List<News> newss = newsService.findAll();
        assertEquals(newss.size(), dbSizeBeforeAdd + 1);

        news = newss.get(newss.size() - 1);

        assertEquals(NEWS_INFORMATION, news.getInformation());
    }

    @Test(expected = NonexistentIdException.class)
    public void testCreateNonExistentCulturalSite() throws Exception {
        News news = new News();
        news.setInformation(NEWS_INFORMATION);

        int dbSizeBeforeAdd = newsService.findAll().size();

        news = newsService.create(NON_EXISTING_CULTURAL_SITE_ID, news);
        assertNull(news);

        List<News> newss = newsService.findAll();
        assertEquals(newss.size(), dbSizeBeforeAdd);
    }

    @Test
    @Transactional
    public void testDeleteSuccesful() throws Exception {
        int dbSizeBeforeDelete = newsService.findAll().size();
        newsService.delete(EXISTING_NEWS_ID);

        List<News> newss = newsService.findAll();
        assertEquals(newss.size(), dbSizeBeforeDelete - 1);

        News news = newsService.findOneById(EXISTING_NEWS_ID);
        assertNull(news);
    }

    @Test(expected = NonexistentIdException.class)
    public void testDeleteNonExisting() throws Exception {
        int dbSizeBeforeDelete = newsService.findAll().size();
        newsService.delete(NON_EXISTING_NEWS_ID);

        List<News> newss = newsService.findAll();
        assertEquals(dbSizeBeforeDelete, newss.size());
    }

    @Test
    public void testUpdateSuccessful() throws Exception {
        News news = newsService.findOneById(EXISTING_NEWS_ID);
        news.setInformation(UPDATED_NEWS_INFORMATION);

        news = newsService.update(news, EXISTING_NEWS_ID);

        assertNotNull(news);
        assertEquals(UPDATED_NEWS_INFORMATION, news.getInformation());
    }

    @Test(expected = NonexistentIdException.class)
    public void testUpdateNonExisting() throws Exception {
        News news = newsService.findOneById(NON_EXISTING_NEWS_ID);
        assertNull(news);

        news = newsService.update(news, NON_EXISTING_NEWS_ID);
        assertNotNull(news);
    }

    @Test
    @Transactional
    public void testGetAllSubscribedNews() throws Exception {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<News> subscribedNews = newsService.getAllSubscribedNews(pageable, EXISTING_USER_ID);

        assertEquals(SUBSCRIBED_NEWS_USER_ID_2, subscribedNews.getContent().size());
    }

    @Test(expected = NonexistentIdException.class )
    @Transactional
    public void testGetAllSubscribedNewsNonExisting() throws Exception {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<News> subscribedNews = newsService.getAllSubscribedNews(pageable, NON_EXISTING_USER_ID);
    }
}
