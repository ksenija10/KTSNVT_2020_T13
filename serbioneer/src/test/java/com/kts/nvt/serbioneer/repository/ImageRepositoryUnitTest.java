package com.kts.nvt.serbioneer.repository;

import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.Image;
import com.kts.nvt.serbioneer.model.News;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static com.kts.nvt.serbioneer.constants.ImageConstants.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

@RunWith(SpringRunner.class)
@DataJpaTest
@TestPropertySource("classpath:test.properties")
public class ImageRepositoryUnitTest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private NewsRepository newsRepository;

    @Autowired
    private CulturalSiteRepository culturalSiteRepository;

    @Before
    public void setUp(){
        Comment comment = commentRepository.findById(COMMENT_ID).orElse(null);
        News news = newsRepository.findById(NEWS_ID).orElse(null);
        CulturalSite culturalSite = culturalSiteRepository.findById(CULTURAL_SITE_ID).orElse(null);
        entityManager.persist(new Image(IMAGE_NAME_1, IMAGE_PATH_1, comment));
        entityManager.persist(new Image(IMAGE_NAME_2, IMAGE_PATH_2, comment));
        entityManager.persist(new Image(IMAGE_NAME_3, IMAGE_PATH_3, news));
        entityManager.persist(new Image(IMAGE_NAME_4, IMAGE_PATH_4, culturalSite));
    }

    @Test
    public void Test_find_all_by_comment_id(){
        List<Image> found = imageRepository.findAllByCommentId(COMMENT_ID);
        assertEquals(3,found.size());
    }

    @Test
    public void Test_find_all_by_comment_page_id(){
        Page<Image> found = imageRepository.findAllByCommentId(PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE), COMMENT_ID);
        assertEquals(2, found.getContent().size());
    }

    @Test
    public void Test_find_all_by_news_id(){
        List<Image> found = imageRepository.findAllByNewsId(NEWS_ID);
        assertEquals(2,found.size());
    }

    @Test
    public void Test_find_all_by_news_page_id(){
        Page<Image> found = imageRepository.findAllByNewsId(PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE), NEWS_ID);
        assertEquals(2, found.getContent().size());
    }

    @Test
    public void Test_find_all_by_cultural_site_id(){
        List<Image> found = imageRepository.findAllByCulturalSiteId(CULTURAL_SITE_ID);
        assertEquals(2,found.size());
    }

    @Test
    public void Test_find_all_by_cultural_site_page_id(){
        Page<Image> found = imageRepository.findAllByCulturalSiteId(PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE), CULTURAL_SITE_ID);
        assertEquals(2, found.getContent().size());
    }

    @Test
    public void Test_fail_find_all_by_comment_id(){
        List<Image> found = imageRepository.findAllByCommentId(COMMENT_ID);
        assertNotEquals(-1,found.size());
    }

    @Test
    public void Test_fail_find_all_by_comment_page_id(){
        Page<Image> found = imageRepository.findAllByCommentId(PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE), COMMENT_ID);
        assertNotEquals(-1, found.getContent().size());
    }

    @Test
    public void Test_fail_find_all_by_news_id(){
        List<Image> found = imageRepository.findAllByNewsId(NEWS_ID);
        assertNotEquals(-1,found.size());
    }

    @Test
    public void Test_fail_find_all_by_news_page_id(){
        Page<Image> found = imageRepository.findAllByNewsId(PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE), NEWS_ID);
        assertNotEquals(-1, found.getContent().size());
    }

    @Test
    public void Test_fail_find_all_by_cultural_site_id(){
        List<Image> found = imageRepository.findAllByCulturalSiteId(CULTURAL_SITE_ID);
        assertNotEquals(-1,found.size());
    }

    @Test
    public void Test_fail_find_all_by_cultural_site_page_id(){
        Page<Image> found = imageRepository.findAllByCulturalSiteId(PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE), CULTURAL_SITE_ID);
        assertNotEquals(-1, found.getContent().size());
    }

}
