package com.kts.nvt.serbioneer.repository;

import static com.kts.nvt.serbioneer.constants.CommentConstants.*;
import static org.junit.Assert.*;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.CulturalSite;
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

@RunWith(SpringRunner.class)
@DataJpaTest
@TestPropertySource("classpath:test.properties")
public class CommentRepositoryUnitTest {

    @Autowired
    private TestEntityManager entityManager;

    @Autowired
    private CommentRepository commentRepository;

    @Before
    public void setUp() {
        AuthenticatedUser user = entityManager.find(AuthenticatedUser.class, EXISTING_USER_ID);
        CulturalSite culturalSite = entityManager.find(CulturalSite.class, EXISTING_CULTURAL_SITE_ID);
        entityManager.persist(new Comment(NEW_COMMENT_TEXT_1, APPROVED, user, culturalSite));
    }

    @Test
    public void testFindAllByApproved() {
        List<Comment> allApprovedComments = commentRepository.findAllByApproved(APPROVED);

        assertEquals(APPROVED_COMMENTS_SIZE_AFTER_ADD, allApprovedComments.size());
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
        Page<Comment> allApprovedCommentsByPageOnCulturalSite = commentRepository.
                findAllByCulturalSiteIdAndApprovedOrderByIdAsc(pageable, EXISTING_CULTURAL_SITE_ID, APPROVED);

        assertEquals(APPROVED_COMMENTS_SIZE_AFTER_ADD_CULTURAL_SITE_2, allApprovedCommentsByPageOnCulturalSite.getContent().size());
    }
}
