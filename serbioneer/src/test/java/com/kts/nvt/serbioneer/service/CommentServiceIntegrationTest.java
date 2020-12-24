package com.kts.nvt.serbioneer.service;

import com.kts.nvt.serbioneer.helper.exception.NonExistingAuthenticatedUser;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.helper.exception.UserViolationException;
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

import javax.transaction.Transactional;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertNotNull;
import static org.assertj.core.api.Assertions.assertThat;
import static com.kts.nvt.serbioneer.constants.CommentConstants.*;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CommentServiceIntegrationTest {

    @Autowired
    private CommentService commentService;

    @Autowired
    private CulturalSiteService culturalSiteService;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @Test
    public void testFindAll() {
        List<Comment> allComments = commentService.findAll();

        assertEquals(ALL_COMMENTS_SIZE, allComments.size());
    }

    @Test
    public void testFindAllPageable() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Comment> allComments = commentService.findAll(pageable);

        assertEquals(ALL_COMMENTS_SIZE, allComments.getContent().size());
    }

    @Test
    public void testFindAllByApprovedPageable() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Comment> allCommentsByApproved = commentService.findAllByApproved(pageable, APPROVED);

        assertEquals(APPROVED_COMMENTS_SIZE, allCommentsByApproved.getContent().size());
    }

    @Test
    public void testFindAllByCulturalSiteIdAndApprovedPageable() {
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Comment> allCommentsByCulturalSiteIdAndApproved = commentService.
                findAllByCulturalSiteIdAndApproved(pageable, EXISTING_CULTURAL_SITE_ID, APPROVED);

        assertEquals(APPROVED_COMMENTS_NUM_CULTURAL_SITE_2, allCommentsByCulturalSiteIdAndApproved.getContent().size());
    }

    @Test
    public void testFindOneById() {
        Comment comment = commentService.findOneById(EXISTING_APPROVED_COMMENT_ID);

        assertNotNull(comment);
        assertEquals(EXISTING_APPROVED_COMMENT_ID, comment.getId());
    }

    @Test
    @Transactional
    public void testCreateSuccessful() throws Exception{
        Comment comment = new Comment();
        comment.setText(NEW_COMMENT_TEXT_1);

        int dbSizeBeforeAdd = commentService.findAll().size();

        comment = commentService.create(EXISTING_CULTURAL_SITE_ID, comment, EXISTING_USER_ID);
        assertThat(comment).isNotNull();

        List<Comment> comments = commentService.findAll();
        assertThat(comments).hasSize(dbSizeBeforeAdd + 1);

        comment = comments.get(comments.size() - 1);

        assertEquals(EXISTING_CULTURAL_SITE_ID, comment.getCulturalSite().getId());
        assertEquals(NEW_COMMENT_TEXT_1, comment.getText());
        assertEquals(EXISTING_USER_ID, comment.getAuthenticatedUser().getId());
    }

    @Test(expected = NonexistentIdException.class)
    @Transactional
    public void testCreateNonExistentCulturalSite() throws Exception {
        Comment comment = new Comment(NEW_COMMENT_TEXT_1);

        int dbSizeBeforeAdd = commentService.findAll().size();

        Comment created = commentService.create(NON_EXISTING_CULTURAL_SITE_ID, comment, NON_EXISTING_USER_ID);
        assertNull(created);

        List<Comment> comments = commentService.findAll();
        assertThat(comments).hasSize(dbSizeBeforeAdd);
    }

    @Test(expected = NonExistingAuthenticatedUser.class)
    @Transactional
    public void testCreateNonExistingAuthenticatedUser() throws Exception {
        Comment comment = new Comment(NEW_COMMENT_TEXT_1);

        int dbSizeBeforeAdd = commentService.findAll().size();

        Comment created = commentService.create(EXISTING_CULTURAL_SITE_ID, comment, NON_EXISTING_USER_ID);
        assertNull(created);

        List<Comment> comments = commentService.findAll();
        assertThat(comments).hasSize(dbSizeBeforeAdd);
    }

    @Test
    @Transactional
    public void testDeleteSuccessful() throws Exception {
        int dbSizeBeforeRemove = commentService.findAll().size();
        commentService.delete(EXISTING_APPROVED_COMMENT_ID, EXISTING_USER_ID);

        List<Comment> comments = commentService.findAll();
        assertThat(comments).hasSize(dbSizeBeforeRemove-1);

        Comment comment = commentService.findOneById(EXISTING_APPROVED_COMMENT_ID);
        assertThat(comment).isNull();

    }

    @Test(expected = NonexistentIdException.class)
    @Transactional
    public void testDeleteCommentNonExistent() throws Exception {
        int dbSizeBeforeRemove = commentService.findAll().size();
        commentService.delete(NON_EXISTING_COMMENT_ID, EXISTING_USER_ID);

        List<Comment> comments = commentService.findAll();
        assertThat(comments).hasSize(dbSizeBeforeRemove);
    }

    @Test(expected = UserViolationException.class)
    @Transactional
    public void testDeleteCommentUserViolationException() throws Exception {
        int dbSizeBeforeRemove = commentService.findAll().size();
        commentService.delete(EXISTING_APPROVED_COMMENT_ID, NON_EXISTING_USER_ID);

        List<Comment> comments = commentService.findAll();
        assertThat(comments).hasSize(dbSizeBeforeRemove);
    }

    @Test(expected = Exception.class)
    @Transactional
    public void testDeleteCommentNotRevised() throws Exception {
        int dbSizeBeforeRemove = commentService.findAll().size();
        commentService.delete(EXISTING_UNAPPROVED_COMMENT_ID, EXISTING_USER_ID);

        List<Comment> comments = commentService.findAll();
        assertThat(comments).hasSize(dbSizeBeforeRemove);
    }

    @Test
    @Transactional
    public void testUpdateSuccessful() throws Exception {
        Comment comment = commentService.findOneById(EXISTING_APPROVED_COMMENT_ID);
        comment.setText(UPDATED_TEXT);

        comment = commentService.update(comment, EXISTING_APPROVED_COMMENT_ID,EXISTING_USER_ID );

        assertNotNull(comment);

        comment = commentService.findOneById(EXISTING_APPROVED_COMMENT_ID);
        assertEquals(UPDATED_TEXT, comment.getText());
    }

    @Test(expected = NonexistentIdException.class)
    @Transactional
    public void testUpdateNonExistent() throws Exception {
        Comment comment = commentService.findOneById(NON_EXISTING_COMMENT_ID);
        assertNull(comment);

        comment = commentService.update(comment, NON_EXISTING_COMMENT_ID, EXISTING_USER_ID);
        assertNull(comment);

        comment = commentService.findOneById(EXISTING_APPROVED_COMMENT_ID);
        assertEquals(OLD_TEXT_APPROVED, comment.getText());
    }

    @Test(expected = UserViolationException.class)
    @Transactional
    public void testUpdateUserViolationException() throws Exception {
        Comment comment = commentService.findOneById(EXISTING_APPROVED_COMMENT_ID);
        comment.setText(UPDATED_TEXT);

        comment = commentService.update(comment, EXISTING_APPROVED_COMMENT_ID, NON_EXISTING_USER_ID );

        assertNotNull(comment);

        comment = commentService.findOneById(EXISTING_APPROVED_COMMENT_ID);
        assertEquals(OLD_TEXT_APPROVED, comment.getText());
    }

    @Test(expected = Exception.class)
    @Transactional
    public void testUpdateCommentNotRevised() throws Exception {
        Comment comment = commentService.findOneById(EXISTING_UNAPPROVED_COMMENT_ID);
        comment.setText(UPDATED_TEXT);

        comment = commentService.update(comment, EXISTING_UNAPPROVED_COMMENT_ID, EXISTING_USER_ID );

        assertNotNull(comment);

        comment = commentService.findOneById(EXISTING_UNAPPROVED_COMMENT_ID);
        assertEquals(OLD_TEXT_UNAPPROVED, comment.getText());
    }

    @Test
    @Transactional
    public void testApproveSuccessful() throws Exception {
        int dbApprovedSizeBeforeApprove = commentService.findAllByApproved(APPROVED).size();

        Comment comment = commentService.findOneById(EXISTING_UNAPPROVED_COMMENT_ID);
        assertEquals(UNAPPROVED, comment.isApproved());

        comment = commentService.approve(EXISTING_UNAPPROVED_COMMENT_ID);

        List<Comment> comments = commentService.findAllByApproved(APPROVED);
        assertThat(comments).hasSize(dbApprovedSizeBeforeApprove + 1);

        comment = commentService.findOneById(EXISTING_UNAPPROVED_COMMENT_ID);
        assertEquals(APPROVED, comment.isApproved());
    }

    @Test(expected = NonexistentIdException.class)
    @Transactional
    public void testApproveNonExistent() throws Exception {
        int dbApprovedSizeBeforeApprove = commentService.findAllByApproved(APPROVED).size();

        Comment comment = commentService.approve(NON_EXISTING_COMMENT_ID);
        assertNull(comment);

        List<Comment> comments = commentService.findAllByApproved(APPROVED);
        assertThat(comments).hasSize(dbApprovedSizeBeforeApprove);
    }

    @Test(expected = Exception.class)
    @Transactional
    public void testApproveAlreadyApproved() throws Exception {
        int dbApprovedSizeBeforeApprove = commentService.findAllByApproved(APPROVED).size();

        Comment comment = commentService.findOneById(EXISTING_APPROVED_COMMENT_ID);
        assertEquals(APPROVED, comment.isApproved());

        comment = commentService.approve(EXISTING_APPROVED_COMMENT_ID);
        assertNull(comment);

        List<Comment> comments = commentService.findAllByApproved(APPROVED);
        assertThat(comments).hasSize(dbApprovedSizeBeforeApprove);
    }

    @Test
    @Transactional
    public void testRejectSuccessful() throws Exception {
        int dbUnapprovedSizeBeforeReject = commentService.findAllByApproved(UNAPPROVED).size();
        int dbSizeBeforeReject = commentService.findAll().size();

        Comment comment = commentService.findOneById(EXISTING_UNAPPROVED_COMMENT_ID);
        assertEquals(UNAPPROVED, comment.isApproved());

        commentService.reject(EXISTING_UNAPPROVED_COMMENT_ID);

        //check if comment is removed from pending
        List<Comment> unapprovedComments = commentService.findAllByApproved(UNAPPROVED);
        assertThat(unapprovedComments).hasSize(dbUnapprovedSizeBeforeReject - 1);

        //check if comment is removed from active
        List<Comment> allComments = commentService.findAll();
        assertThat(allComments).hasSize(dbSizeBeforeReject - 1);

        comment = commentService.findOneById(EXISTING_UNAPPROVED_COMMENT_ID);
        assertNull(comment);
    }

    @Test(expected = NonexistentIdException.class)
    @Transactional
    public void testRejectNonExistent() throws Exception {
        int dbUnapprovedSizeBeforeReject = commentService.findAllByApproved(UNAPPROVED).size();
        int dbSizeBeforeReject = commentService.findAll().size();

        Comment comment = commentService.approve(NON_EXISTING_COMMENT_ID);
        assertNull(comment);

        commentService.reject(NON_EXISTING_COMMENT_ID);

        //check if comment is not removed from pending
        List<Comment> unapprovedComments = commentService.findAllByApproved(UNAPPROVED);
        assertThat(unapprovedComments).hasSize(dbUnapprovedSizeBeforeReject);

        //check if comment is not removed from active
        List<Comment> allComments = commentService.findAll();
        assertThat(allComments).hasSize(dbSizeBeforeReject);
    }

    @Test(expected = Exception.class)
    @Transactional
    public void testRejectAlreadyApproved() throws Exception {
        int dbUnapprovedSizeBeforeReject = commentService.findAllByApproved(UNAPPROVED).size();
        int dbSizeBeforeReject = commentService.findAll().size();

        Comment comment = commentService.findOneById(EXISTING_APPROVED_COMMENT_ID);
        assertEquals(APPROVED, comment.isApproved());

        commentService.reject(EXISTING_APPROVED_COMMENT_ID);

        //check if comment is not removed from pending
        List<Comment> unapprovedComments = commentService.findAllByApproved(UNAPPROVED);
        assertThat(unapprovedComments).hasSize(dbUnapprovedSizeBeforeReject);

        //check if comment is not removed from active
        List<Comment> allComments = commentService.findAll();
        assertThat(allComments).hasSize(dbSizeBeforeReject);;
    }
}
