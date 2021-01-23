package com.kts.nvt.serbioneer.repository;

import com.kts.nvt.serbioneer.model.Comment;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import static com.kts.nvt.serbioneer.constants.CommentConstants.*;
import static org.junit.Assert.assertEquals;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CommentRepositoryIntegrationTest {

    @Autowired
    private CommentRepository commentRepository;

    @Test
    public void testFindAllByApproved() {
        List<Comment> allApprovedComments = commentRepository.findAllByApproved(UNAPPROVED);

        assertEquals(UNAPPROVED_COMMENTS_SIZE, allApprovedComments.size());
    }

    @Test
    public void testFindAllByApprovedPageable() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Comment> allApprovedCommentsByPage = commentRepository.findAllByApprovedOrderByIdAsc(pageable, UNAPPROVED);

        assertEquals(UNAPPROVED_COMMENTS_SIZE, allApprovedCommentsByPage.getContent().size());
    }

    @Test
    public void testFindAllByCulturalSiteIdAndApprovedPageable() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Comment> allUnapprovedCommentsByPageOnCulturalSite = commentRepository.findAllByCulturalSiteIdAndApprovedOrderByIdAsc(pageable, EXISTING_CULTURAL_SITE_ID, APPROVED);

        assertEquals(APPROVED_COMMENTS_NUM_CULTURAL_SITE_2, allUnapprovedCommentsByPageOnCulturalSite.getContent().size());
    }
}
