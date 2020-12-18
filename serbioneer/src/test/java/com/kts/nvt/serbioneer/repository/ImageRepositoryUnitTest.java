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
        Comment comment = commentRepository.findById(Long.parseLong("1")).orElse(null);
        News news = newsRepository.findById(Long.parseLong("1")).orElse(null);
        CulturalSite culturalSite = culturalSiteRepository.findById(Long.parseLong("1")).orElse(null);
        entityManager.persist(new Image(IMAGE_NAME_1, IMAGE_PATH_1, comment));
        entityManager.persist(new Image(IMAGE_NAME_2, IMAGE_PATH_2, comment));
        entityManager.persist(new Image(IMAGE_NAME_3, IMAGE_PATH_3, news));
        entityManager.persist(new Image(IMAGE_NAME_4, IMAGE_PATH_4, culturalSite));
    }

    @Test
    public void Test_find_all_by_comment_id(){
        List<Image> found = imageRepository.findAllByCommentId(Long.parseLong("1"));
        assertEquals(2,found.size());
    }

    @Test
    public void Test_find_all_by_comment_page_id(){
        Page<Image> found = imageRepository.findAllByCommentId(PageRequest.of(0,2), Long.parseLong("1"));
        assertEquals(2, found.getContent().size());
    }

    @Test
    public void Test_find_all_by_news_id(){
        List<Image> found = imageRepository.findAllByNewsId(Long.parseLong("1"));
        assertEquals(1,found.size());
    }

    @Test
    public void Test_find_all_by_news_page_id(){
        Page<Image> found = imageRepository.findAllByNewsId(PageRequest.of(0,2), Long.parseLong("1"));
        assertEquals(1, found.getContent().size());
    }

    @Test
    public void Test_find_all_by_cultural_site_id(){
        List<Image> found = imageRepository.findAllByCulturalSiteId(Long.parseLong("1"));
        assertEquals(1,found.size());
    }

    @Test
    public void Test_find_all_by_cultural_site_page_id(){
        Page<Image> found = imageRepository.findAllByCulturalSiteId(PageRequest.of(0,2), Long.parseLong("1"));
        assertEquals(1, found.getContent().size());
    }

    @Test
    public void Test_fail_find_all_by_comment_id(){
        List<Image> found = imageRepository.findAllByCommentId(Long.parseLong("1"));
        assertNotEquals(-1,found.size());
    }

    @Test
    public void Test_fail_find_all_by_comment_page_id(){
        Page<Image> found = imageRepository.findAllByCommentId(PageRequest.of(0,2), Long.parseLong("1"));
        assertNotEquals(-1, found.getContent().size());
    }

    @Test
    public void Test_fail_find_all_by_news_id(){
        List<Image> found = imageRepository.findAllByNewsId(Long.parseLong("1"));
        assertNotEquals(-1,found.size());
    }

    @Test
    public void Test_fail_find_all_by_news_page_id(){
        Page<Image> found = imageRepository.findAllByNewsId(PageRequest.of(0,2), Long.parseLong("1"));
        assertNotEquals(-1, found.getContent().size());
    }

    @Test
    public void Test_fail_find_all_by_cultural_site_id(){
        List<Image> found = imageRepository.findAllByCulturalSiteId(Long.parseLong("1"));
        assertNotEquals(-1,found.size());
    }

    @Test
    public void Test_fail_find_all_by_cultural_site_page_id(){
        Page<Image> found = imageRepository.findAllByCulturalSiteId(PageRequest.of(0,2), Long.parseLong("1"));
        assertNotEquals(-1, found.getContent().size());
    }

}
