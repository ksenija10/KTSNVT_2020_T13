package com.kts.nvt.serbioneer.service;

import static com.kts.nvt.serbioneer.constants.CommentConstants.*;
import static org.junit.Assert.assertEquals;
import static org.mockito.BDDMockito.*;


import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.CulturalSite;
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

    /*@Before
    public void setUp() {

        //testCreateSuccess
        CulturalSite culturalSite = new CulturalSite();
        given(culturalSiteService.findOneById(CULTURAL_SITE_ID)).willReturn(culturalSite);
        Comment savedComment = SAVED_COMMENT;
        savedComment.setId(SAVED_COMMENT_ID);
        given(commentRepository.save(COMMENT)).willReturn(savedComment);

        //testCreateNonExistingCulturalSiteId
        given(culturalSiteService.findOneById(BAD_CULTURAL_SITE_ID)).willReturn(null);


    }

    @Test
    public void testCreateSuccess() throws Exception {
        Comment savedComment = commentService.create(CULTURAL_SITE_ID, COMMENT, USER);

        verify(culturalSiteService, times(1)).findOneById(CULTURAL_SITE_ID);
        verify(commentRepository, times(1)).save(COMMENT);
        assertEquals(SAVED_COMMENT_ID, savedComment.getId());
    }

    @Test(expected = NonexistentIdException.class)
    public void testCreateNonExistingCulturalSiteId() throws Exception {
        Comment comment = new Comment(COMMENT_TEXT_1);
        commentService.create(BAD_CULTURAL_SITE_ID, comment, USER);

        verify(culturalSiteService, times(1)).findOneById(BAD_CULTURAL_SITE_ID);
        verify(commentRepository, times(0)).save(comment);
    }

    @Test
    public void testDelete() {

    }

    @Test
    public void testUpdate() {

    }

    @Test
    public void testApprove() {

    }

    @Test
    public void testReject() {

    }*/
}
