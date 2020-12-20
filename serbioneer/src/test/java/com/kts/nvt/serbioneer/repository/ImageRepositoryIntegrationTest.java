package com.kts.nvt.serbioneer.repository;

import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.Image;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static com.kts.nvt.serbioneer.constants.ImageConstants.*;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class ImageRepositoryIntegrationTest {

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private CommentRepository commentRepository;

    @Test
    public void Test_find_all_by_comment_id(){
        List<Image> found = imageRepository.findAllByCommentId(COMMENT_ID);
        assertEquals(1,found.size());
    }

    @Test
    public void Test_find_all_by_comment_page_id(){
        Page<Image> found = imageRepository.findAllByCommentId(PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE), COMMENT_ID);
        assertEquals(1, found.getContent().size());
    }

    @Test
    public void Test_find_all_by_news_id(){
        List<Image> found = imageRepository.findAllByNewsId(NEWS_ID);
        assertEquals(1,found.size());
    }

    @Test
    public void Test_find_all_by_news_page_id(){
        Page<Image> found = imageRepository.findAllByNewsId(PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE), NEWS_ID);
        assertEquals(1, found.getContent().size());
    }

    @Test
    public void Test_find_all_by_cultural_site_id(){
        List<Image> found = imageRepository.findAllByCulturalSiteId(CULTURAL_SITE_ID);
        assertEquals(1,found.size());
    }

    @Test
    public void Test_find_all_by_cultural_site_page_id(){
        Page<Image> found = imageRepository.findAllByCulturalSiteId(PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE), CULTURAL_SITE_ID);
        assertEquals(1, found.getContent().size());
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
