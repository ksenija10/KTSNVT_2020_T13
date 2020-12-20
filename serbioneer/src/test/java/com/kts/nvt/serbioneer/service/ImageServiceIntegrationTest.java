package com.kts.nvt.serbioneer.service;

import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.jwt.JwtBasedAuthentication;
import com.kts.nvt.serbioneer.model.Image;
import com.kts.nvt.serbioneer.repository.ImageRepository;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import static com.kts.nvt.serbioneer.constants.ImageConstants.*;
import static com.kts.nvt.serbioneer.constants.ImageConstants.IMAGE_ID;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class ImageServiceIntegrationTest {

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private ImageService imageService;

    @Autowired
    private ImageRepository imageRepository;

    @Autowired
    private CommentService commentService;

    @Autowired
    private NewsService newsService;

    @Autowired
    private CulturalSiteService culturalSiteService;

    @Autowired
    private SecureUserDetailsService userDetailsService;

    private String accessToken;

    public void login(String username, String password) {
        ResponseEntity<UserLoginDTO> responseEntity = restTemplate.postForEntity("/login",
                new UserLoginDTO(username, password), UserLoginDTO.class);

        this.accessToken = Objects.requireNonNull(responseEntity.getHeaders().get("Authorization")).get(0);
    }

    private MultipartFile file;

    public ImageServiceIntegrationTest() {
        try {
            this.file = new MockMultipartFile("file", "something", "multipart/form-data",
                    new FileInputStream( "src" + separator + "test" + separator
                            + "resources" + separator +"something.jpg"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void Test_find_all_page(){
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Image> found = imageService.findAll(pageable);


        assertEquals(2, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all_by_news_id(){
        List<Image> found = imageService.findAllByNewsId(NEWS_ID);

        assertEquals(1, found.size());
    }

    @Test
    public void Test_find_all_by_news_id_page(){
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Image> found = imageService.findAllByNewsId(pageable, NEWS_ID);

        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all_by_comment_id(){
        List<Image> all = imageRepository.findAll();
        for(Image im: all){
            System.out.println(im);
        }

        List<Image> found = imageService.findAllByCommentId(COMMENT_ID);
        for(Image im: found){
            System.out.println(im);
        }

        assertEquals(1, found.size());
    }

    @Test
    public void Test_find_all_by_comment_id_page(){
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Image> found = imageService.findAllByCommentId(pageable, COMMENT_ID);

        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_all_by_cultural_site_id(){
        List<Image> found = imageService.findAllByCulturalSiteId(CULTURAL_SITE_ID);

        assertEquals(1, found.size());
    }

    @Test
    public void Test_find_all_by_cultural_site_id_page(){
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
        Page<Image> found = imageService.findAllByCulturalSiteId(pageable, CULTURAL_SITE_ID);

        assertEquals(1, found.getNumberOfElements());
    }

    @Test
    public void Test_find_one_by_id_found(){
        Image found = imageService.findOneById(IMAGE_ID);

        assertEquals(IMAGE_ID, found.getId());
    }

    @Test
    public void Test_find_one_by_id_not_found(){
        Image found = imageService.findOneById(IMAGE_ID_RANDOM);

        assertNull(found);
    }

    @Test
    public void Test_create_for_comment() throws Exception {
        Image created = imageService.createForComment(COMMENT_ID_NEW, file);

        assertEquals("something", created.getName());

    }

    @Test
    public void Test_create_for_news() throws Exception {
        Image created = imageService.createForNews(NEWS_ID_NEW, file);

        assertEquals("something", created.getName());

    }

    @Test
    public void Test_create_for_cultural_site() throws Exception {
        Image created = imageService.createForCulturalSite(CULTURAL_SITE_ID_NEW, file);

        assertEquals("something", created.getName());

    }

    @Test
    public  void Test_save_image_comment() throws IOException {
        String path = imageService.saveImage(this.file, "something", "comment", COMMENT_ID);

        assertEquals(EXPECTED_PATH_COMMENT, path);
    }

    @Test
    public void Test_delete() throws Exception {
        login(USER_USERNAME, USER_PASSWORD);

        UserDetails userDetails = userDetailsService.loadUserByUsername(USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        imageService.delete(IMAGE_ID_DELETE);
    }
}
