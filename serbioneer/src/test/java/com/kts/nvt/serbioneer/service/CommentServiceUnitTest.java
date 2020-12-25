package com.kts.nvt.serbioneer.service;

import static com.kts.nvt.serbioneer.constants.CommentConstants.*;
import static org.junit.Assert.assertEquals;
import static org.mockito.BDDMockito.*;


import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.helper.exception.NonExistingAuthenticatedUser;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.helper.exception.UserViolationException;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepository;
import com.kts.nvt.serbioneer.repository.CommentRepository;
import org.checkerframework.checker.units.qual.C;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Optional;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CommentServiceUnitTest {

    @Autowired
    private CommentService commentService;

    @Autowired
    private TestRestTemplate restTemplate;

    @MockBean
    private CulturalSiteService culturalSiteService;

    @MockBean
    private CommentRepository commentRepository;

    @MockBean
    private AuthenticatedUserRepository userRepository;

    @Before
    public void setUp() {

        //testCreateSuccess
        given(culturalSiteService.findOneById(EXISTING_CULTURAL_SITE_ID)).willReturn(EXISTING_CULTURAL_SITE);
        given(userRepository.findById(EXISTING_USER_ID)).willReturn(Optional.of(EXISTING_AUTHENTICATED_USER));
        SAVED_COMMENT.setCulturalSite(EXISTING_CULTURAL_SITE);
        SAVED_COMMENT.setAuthenticatedUser(EXISTING_AUTHENTICATED_USER);
        SAVED_COMMENT.setApproved(false);
        Comment savedComment = SAVED_COMMENT;
        savedComment.setId(SAVED_COMMENT_ID);
        given(commentRepository.save(SAVED_COMMENT)).willReturn(savedComment);

        //testCreateNonExistingCulturalSiteId
        given(culturalSiteService.findOneById(NON_EXISTING_CULTURAL_SITE_ID)).willReturn(null);

        //non existent authenticated user id
        given(userRepository.findById(NON_EXISTING_USER_ID)).willReturn(Optional.empty());

        //delete
        EXISTING_APPROVED_COMMENT.setId(EXISTING_APPROVED_COMMENT_ID);
        given(commentRepository.findById(EXISTING_APPROVED_COMMENT_ID)).willReturn(Optional.of(EXISTING_APPROVED_COMMENT));
        doNothing().when(commentRepository).delete(EXISTING_APPROVED_COMMENT);

        //delete non existing comment id
        given(commentRepository.findById(NON_EXISTING_COMMENT_ID)).willReturn(Optional.empty());

        //delete unapproved comment
        EXISTING_UNAPPROVED_COMMENT.setId(EXISTING_UNAPPROVED_COMMENT_ID);
        EXISTING_UNAPPROVED_COMMENT_APPROVED.setId(EXISTING_UNAPPROVED_COMMENT_ID);

        //update successful
        COMMENT_TO_UPDATE.setId(COMMENT_TO_UPDATE_ID);
        COMMENT_TO_UPDATE.setText(UPDATED_TEXT);
        given(commentRepository.findById(COMMENT_TO_UPDATE_ID)).willReturn(Optional.of(COMMENT_TO_UPDATE));
        given(commentRepository.save(COMMENT_TO_UPDATE)).willReturn(COMMENT_TO_UPDATE);

        //approve comment successful
        given(commentRepository.findById(EXISTING_UNAPPROVED_COMMENT_ID)).willReturn(Optional.of(EXISTING_UNAPPROVED_COMMENT));
        given(commentRepository.save(EXISTING_UNAPPROVED_COMMENT)).willReturn(EXISTING_UNAPPROVED_COMMENT_APPROVED);

        //reject comment
        given(commentRepository.findById(EXISTING_UNAPPROVED_COMMENT_FOR_REJECT_ID)).willReturn(Optional.of(EXISTING_UNAPPROVED_COMMENT_FOR_REJECT));
        doNothing().when(commentRepository).delete(EXISTING_UNAPPROVED_COMMENT_FOR_REJECT);
    }

    @Test
    public void testCreateSuccessful() throws Exception {
        Comment savedComment = commentService.create(EXISTING_CULTURAL_SITE_ID, NEW_COMMENT, EXISTING_USER_ID);

        verify(culturalSiteService, times(1)).findOneById(EXISTING_CULTURAL_SITE_ID);
        verify(userRepository, times(1)).findById(EXISTING_USER_ID);
        verify(commentRepository, times(1)).save(SAVED_COMMENT);

        assertNotNull(savedComment);
        assertEquals(SAVED_COMMENT_ID, savedComment.getId());
    }

    @Test(expected = NonexistentIdException.class)
    public void testCreateNonExistingCulturalSiteId() throws Exception {
        Comment savedComment = commentService.create(NON_EXISTING_CULTURAL_SITE_ID, NEW_COMMENT, EXISTING_USER_ID);

        verify(culturalSiteService, times(1)).findOneById(NON_EXISTING_CULTURAL_SITE_ID);
        verify(userRepository, times(0)).findById(EXISTING_USER_ID);
        verify(commentRepository, times(0)).save(SAVED_COMMENT);

        assertNull(savedComment);
    }

    @Test(expected = NonExistingAuthenticatedUser.class)
    public void testCreateNonExistingAuthenticatedUser() throws Exception {
        Comment savedComment = commentService.create(EXISTING_CULTURAL_SITE_ID, NEW_COMMENT, NON_EXISTING_USER_ID);

        verify(culturalSiteService, times(1)).findOneById(EXISTING_CULTURAL_SITE_ID);
        verify(userRepository, times(1)).findById(NON_EXISTING_USER_ID);
        verify(commentRepository, times(0)).save(SAVED_COMMENT);

        assertNull(savedComment);
    }

    @Test
    public void testDelete() throws Exception {
        commentService.delete(EXISTING_APPROVED_COMMENT_ID, EXISTING_USER_ID);

        verify(commentRepository, times(1)).findById(EXISTING_APPROVED_COMMENT_ID);
        verify(commentRepository, times(1)).delete(EXISTING_APPROVED_COMMENT);
    }

    @Test(expected = NonexistentIdException.class)
    public void testDeleteNonExistent() throws Exception {
        commentService.delete(NON_EXISTING_COMMENT_ID, EXISTING_USER_ID);

        verify(commentRepository, times(1)).findById(NON_EXISTING_COMMENT_ID);
        verify(commentRepository, times(0)).delete(EXISTING_APPROVED_COMMENT);
    }

    @Test(expected = UserViolationException.class)
    public void testDeleteUserViolationException() throws Exception {
        commentService.delete(EXISTING_APPROVED_COMMENT_ID, NON_EXISTING_USER_ID);

        verify(commentRepository, times(1)).findById(EXISTING_APPROVED_COMMENT_ID);
        verify(commentRepository, times(0)).delete(EXISTING_APPROVED_COMMENT);
    }

    @Test(expected = Exception.class)
    public void testDeleteCommentNotApproved() throws Exception {
        commentService.delete(EXISTING_UNAPPROVED_COMMENT_FOR_DELETE_ID, EXISTING_USER_ID);

        verify(commentRepository, times(1)).findById(EXISTING_UNAPPROVED_COMMENT_FOR_DELETE_ID);
        verify(commentRepository, times(0)).delete(EXISTING_UNAPPROVED_COMMENT_FOR_DELETE);
    }

    @Test
    public void testUpdateSuccessful() throws Exception {
        Comment comment = commentService.update(COMMENT_TO_UPDATE, COMMENT_TO_UPDATE_ID, EXISTING_USER_ID);

        verify(commentRepository, times(1)).findById(COMMENT_TO_UPDATE_ID);
        verify(commentRepository, times(1)).save(COMMENT_TO_UPDATE);
        assertNotNull(comment);
        assertEquals(UPDATED_TEXT, comment.getText());
    }

    @Test(expected = NonexistentIdException.class)
    public void testUpdateNonExisting() throws Exception {
        Comment comment = commentService.update(COMMENT_TO_UPDATE, NON_EXISTING_COMMENT_ID, EXISTING_USER_ID);

        verify(commentRepository, times(1)).findById(NON_EXISTING_COMMENT_ID);
        verify(commentRepository, times(0)).save(COMMENT_TO_UPDATE);
        assertNull(comment);
    }

    @Test(expected = UserViolationException.class)
    public void testUpdateUserViolationException() throws Exception {
        Comment comment = commentService.update(COMMENT_TO_UPDATE, COMMENT_TO_UPDATE_ID, NON_EXISTING_USER_ID);

        verify(commentRepository, times(1)).findById(COMMENT_TO_UPDATE_ID);
        verify(commentRepository, times(0)).save(COMMENT_TO_UPDATE);
        assertNull(comment);
    }

    @Test(expected = Exception.class)
    public void testUpdateNotApproved() throws Exception {
        Comment comment = commentService.update(COMMENT_TO_UPDATE, EXISTING_UNAPPROVED_COMMENT_ID, EXISTING_USER_ID);

        verify(commentRepository, times(1)).findById(EXISTING_UNAPPROVED_COMMENT_ID);
        verify(commentRepository, times(0)).save(COMMENT_TO_UPDATE);
        assertNull(comment);
    }

    @Test
    public void testApproveSuccessful() throws Exception {
        Comment comment = commentService.approve(EXISTING_UNAPPROVED_COMMENT_ID);

        verify(commentRepository, times(1)).findById(EXISTING_UNAPPROVED_COMMENT_ID);
        verify(commentRepository, times(1)).save(EXISTING_UNAPPROVED_COMMENT);
        assertNotNull(comment);
        assertTrue(comment.isApproved());
    }

    @Test(expected = NonexistentIdException.class)
    public void testApproveNonExisting() throws Exception {
        Comment comment = commentService.approve(NON_EXISTING_COMMENT_ID);

        verify(commentRepository, times(1)).findById(NON_EXISTING_COMMENT_ID);
        verify(commentRepository, times(0)).save(EXISTING_UNAPPROVED_COMMENT);
        assertNull(comment);
    }

    @Test(expected = Exception.class)
    public void testApproveAlreadyApproved() throws Exception {
        Comment comment = commentService.approve(EXISTING_APPROVED_COMMENT_ID);

        verify(commentRepository, times(1)).findById(EXISTING_APPROVED_COMMENT_ID);
        verify(commentRepository, times(0)).save(EXISTING_APPROVED_COMMENT);
        assertNull(comment);
    }

    @Test
    public void testRejectSuccessful() throws Exception {
        commentService.reject(EXISTING_UNAPPROVED_COMMENT_FOR_REJECT_ID);

        verify(commentRepository, times(1)).findById(EXISTING_UNAPPROVED_COMMENT_FOR_REJECT_ID);
        verify(commentRepository, times(1)).delete(EXISTING_UNAPPROVED_COMMENT_FOR_REJECT);
    }

    @Test(expected = NonexistentIdException.class)
    public void testRejectNonExistent() throws Exception {
        commentService.reject(NON_EXISTING_COMMENT_ID);

        verify(commentRepository, times(1)).findById(NON_EXISTING_COMMENT_ID);
        verify(commentRepository, times(0)).delete(EXISTING_UNAPPROVED_COMMENT);
    }

    @Test(expected = Exception.class)
    public void testRejectAlreadyApproved() throws Exception {
        commentService.reject(EXISTING_APPROVED_COMMENT_ID);

        verify(commentRepository, times(1)).findById(EXISTING_APPROVED_COMMENT_ID);
        verify(commentRepository, times(0)).delete(EXISTING_APPROVED_COMMENT);
    }
}
