package com.kts.nvt.serbioneer.service;

import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.Image;
import com.kts.nvt.serbioneer.repository.ImageRepository;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentCaptor;
import org.mockito.Captor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import static com.kts.nvt.serbioneer.constants.ImageConstants.COMMENT_ID;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.given;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static com.kts.nvt.serbioneer.constants.ImageConstants.*;
import static org.mockito.Mockito.*;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class ImageServiceUnitTest {

    @Autowired
    private ImageService imageService;

    @MockBean
    private ImageRepository imageRepository;

    @MockBean
    private CommentService commentService;

    @MockBean
    private NewsService newsService;

    @MockBean
    private CulturalSiteService culturalSiteService;

    private MockMultipartFile file;
    public ImageServiceUnitTest(){
        try {
            this.file = new MockMultipartFile("file", "something", "multipart/form-data",
                                                new FileInputStream( "src" + separator + "test" + separator
                                                        + "resources" + separator +"something.jpg"));
        } catch (IOException e) {
            e.printStackTrace();
            this.file = null;
        }

    }

    @Before
    public void setup(){
        List<Image> images = new ArrayList<>();
        images.add(new Image(IMAGE_NAME_1, IMAGE_PATH_1));
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Image> imagePage = new PageImpl<>(images, pageable, PAGEABLE_TOTAL_ELEMENTS);

        given(imageRepository.findAll()).willReturn(images);
        given(imageRepository.findAll(pageable)).willReturn(imagePage);

        given(imageRepository.findAllByCommentId(COMMENT_ID)).willReturn(images);
        given(imageRepository.findAllByCommentId(pageable, COMMENT_ID)).willReturn(imagePage);

        given(imageRepository.findAllByNewsId(NEWS_ID)).willReturn(images);
        given(imageRepository.findAllByNewsId(pageable, NEWS_ID)).willReturn(imagePage);

        given(imageRepository.findAllByCulturalSiteId(CULTURAL_SITE_ID)).willReturn(images);
        given(imageRepository.findAllByCulturalSiteId(pageable, CULTURAL_SITE_ID)).willReturn(imagePage);


        Image savedImage = new Image(IMAGE_NAME_1, IMAGE_PATH_1);
        savedImage.setId(IMAGE_ID);

        given(imageRepository.findById(IMAGE_ID)).willReturn(Optional.of(savedImage));
        given(imageRepository.findById(IMAGE_ID_RANDOM)).willReturn(Optional.empty());
        given(imageRepository.save(any(Image.class))).willReturn(CREATED_IMAGE);

        doNothing().when(imageRepository).delete(savedImage);

        given(commentService.findOneById(COMMENT_ID)).willReturn(COMMENT);
        given(newsService.findOneById(NEWS_ID)).willReturn(NEWS);
        given(culturalSiteService.findOneById(CULTURAL_SITE_ID)).willReturn(CULTURAL_SITE);
    }

    @Test
    public void Test_find_all_page(){
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Image> found = imageService.findAll(pageable);

        verify(imageRepository, times(1)).findAll(pageable);
        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all_by_news_id(){
        List<Image> found = imageService.findAllByNewsId(NEWS_ID);

        verify(imageRepository, times(1)).findAllByNewsId(NEWS_ID);
        assertEquals(1, found.size());
    }

    @Test
    public void Test_find_all_by_news_id_page(){
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Image> found = imageService.findAllByNewsId(pageable, NEWS_ID);

        verify(imageRepository, times(1)).findAllByNewsId(pageable, NEWS_ID);
        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all_by_comment_id(){
        List<Image> found = imageService.findAllByCommentId(COMMENT_ID);

        verify(imageRepository, times(1)).findAllByCommentId(COMMENT_ID);
        assertEquals(1, found.size());
    }

    @Test
    public void Test_find_all_by_comment_id_page(){
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Image> found = imageService.findAllByCommentId(pageable, COMMENT_ID);

        verify(imageRepository, times(1)).findAllByCommentId(pageable, COMMENT_ID);
        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all_by_cultural_site_id(){
        List<Image> found = imageService.findAllByCulturalSiteId(CULTURAL_SITE_ID);

        verify(imageRepository, times(1)).findAllByCulturalSiteId(CULTURAL_SITE_ID);
        assertEquals(1, found.size());
    }

    @Test
    public void Test_find_all_by_cultural_site_id_page(){
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Image> found = imageService.findAllByCulturalSiteId(pageable, CULTURAL_SITE_ID);

        verify(imageRepository, times(1)).findAllByCulturalSiteId(pageable, CULTURAL_SITE_ID);
        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_one_by_id_found(){
        Image found = imageService.findOneById(IMAGE_ID);

        verify(imageRepository, times(1)).findById(IMAGE_ID);
        assertEquals(IMAGE_ID, found.getId());
    }

    @Test
    public void Test_find_one_by_id_not_found(){
        Image found = imageService.findOneById(IMAGE_ID_RANDOM);

        verify(imageRepository, times(1)).findById(IMAGE_ID_RANDOM);
        assertNull(found);
    }


    @Test
    public void Test_create_for_comment() throws Exception {
        Image created = imageService.createForComment(COMMENT_ID, file);

        verify(commentService, times(1)).findOneById(COMMENT_ID);
        verify(imageRepository, times(1)).save(any(Image.class));

        assertEquals(CREATED_IMAGE_NAME, created.getName());

    }

    @Test
    public void Test_create_for_news() throws Exception {
        Image created = imageService.createForNews(NEWS_ID, file);
        System.out.println(created);
        verify(newsService, times(1)).findOneById(NEWS_ID);
        verify(imageRepository, times(1)).save(any(Image.class));

        assertEquals(CREATED_IMAGE_NAME, created.getName());

    }

    @Test
    public void Test_create_for_cultural_site() throws Exception {
        Image created = imageService.createForCulturalSite(CULTURAL_SITE_ID, file);

        verify(culturalSiteService, times(1)).findOneById(CULTURAL_SITE_ID);
        verify(imageRepository, times(1)).save(any(Image.class));

        assertEquals(CREATED_IMAGE_NAME, created.getName());

    }

    @Test
    public  void Test_save_image_comment() throws IOException {
        String path = imageService.saveImage(this.file, "something", "comment", COMMENT_ID);

        assertEquals(EXPECTED_PATH_COMMENT, path);
    }

    @Test
    public void Test_delete() throws Exception {
        imageService.delete(IMAGE_ID);

        verify(imageRepository, times(1)).findById(IMAGE_ID);
    }




}
