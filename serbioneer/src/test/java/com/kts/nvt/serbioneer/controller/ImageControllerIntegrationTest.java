package com.kts.nvt.serbioneer.controller;

import static com.kts.nvt.serbioneer.constants.ImageConstants.ADMIN_PASSWORD;
import static com.kts.nvt.serbioneer.constants.ImageConstants.ADMIN_USERNAME;
import static com.kts.nvt.serbioneer.constants.ImageConstants.COMMENT_ID;
import static com.kts.nvt.serbioneer.constants.ImageConstants.CULTURAL_SITE_ID;
import static com.kts.nvt.serbioneer.constants.ImageConstants.NEWS_ID;
import static com.kts.nvt.serbioneer.constants.ImageConstants.PAGEABLE_PAGE;
import static com.kts.nvt.serbioneer.constants.ImageConstants.PAGEABLE_SIZE;
import static com.kts.nvt.serbioneer.constants.ImageConstants.USER_PASSWORD;
import static com.kts.nvt.serbioneer.constants.ImageConstants.USER_USERNAME;
import static com.kts.nvt.serbioneer.constants.ImageConstants.separator;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Objects;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.core.io.FileSystemResource;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;

import com.kts.nvt.serbioneer.dto.ImageDTO;
import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.helper.HelperPage;
import com.kts.nvt.serbioneer.jwt.JwtBasedAuthentication;
import com.kts.nvt.serbioneer.model.Image;
import com.kts.nvt.serbioneer.service.ImageService;
import com.kts.nvt.serbioneer.service.SecureUserDetailsService;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class ImageControllerIntegrationTest {

    @Autowired
    private ImageService imageService;

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private SecureUserDetailsService userDetailsService;

    private String accessToken;

    private MultipartFile file;

    public ImageControllerIntegrationTest(){
        try {
            this.file = new MockMultipartFile("file", "something", "multipart/form-data",
                    new FileInputStream( "src" + separator + "test" + separator
                            + "resources" + separator +"something.jpg"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void login(String username, String password) {
        //poziv REST servisa za logovanje
        ResponseEntity<UserLoginDTO> responseEntity = restTemplate.postForEntity("/login",
                new UserLoginDTO(username, password), UserLoginDTO.class);
        //postavljanje authorization tokena
        this.accessToken = Objects.requireNonNull(responseEntity.getHeaders().get("Authorization")).get(0);
    }


    @Test
    public void Test_get_all_images_for_news(){
        login(USER_USERNAME, USER_PASSWORD);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int size = imageService.findAllByNewsId(1L).size();

        ResponseEntity<List<ImageDTO>> responseEntity = restTemplate.exchange("/api/image/news/1",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<List<ImageDTO>>() {} );

        List<ImageDTO> images = Objects.requireNonNull(responseEntity.getBody());
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(size, images.size());
    }

    @Test
    public void Test_get_all_images_for_news_page(){
        login(USER_USERNAME, USER_PASSWORD);
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int size = imageService.findAllByNewsId(pageable, 1L).getNumberOfElements();

        ResponseEntity<HelperPage<ImageDTO>> responseEntity = restTemplate.exchange("/api/image/news/1/by-page?page=0&size=2",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<ImageDTO>>() {} );

        List<ImageDTO> images = Objects.requireNonNull(responseEntity.getBody()).toList();
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(size, images.size());
    }

    @Test
    public void Test_get_all_images_for_comment(){
        login(USER_USERNAME, USER_PASSWORD);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int size = imageService.findAllByCommentId(1L).size();

        ResponseEntity<List<ImageDTO>> responseEntity = restTemplate.exchange("/api/image/comment/1",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<List<ImageDTO>>() {} );

        List<ImageDTO> images = Objects.requireNonNull(responseEntity.getBody());
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(size, images.size());
    }

    @Test
    public void Test_get_all_images_for_comment_page(){
        login(USER_USERNAME, USER_PASSWORD);
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int size = imageService.findAllByCommentId(pageable, 1L).getNumberOfElements();

        ResponseEntity<HelperPage<ImageDTO>> responseEntity = restTemplate.exchange("/api/image/comment/1/by-page",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<ImageDTO>>() {} );

        List<ImageDTO> images = Objects.requireNonNull(responseEntity.getBody()).toList();
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(size, images.size());
    }

    @Test
    public void Test_get_all_images_for_cultural_site(){
        login(USER_USERNAME, USER_PASSWORD);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int size = imageService.findAllByCulturalSiteId(1L).size();

        ResponseEntity<List<ImageDTO>> responseEntity = restTemplate.exchange("/api/image/cultural-site/1",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<List<ImageDTO>>() {} );

        List<ImageDTO> images = Objects.requireNonNull(responseEntity.getBody());
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(size, images.size());
    }

    @Test
    public void Test_get_all_images_for_cultural_site_page(){
        login(USER_USERNAME, USER_PASSWORD);
        Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int size = imageService.findAllByCulturalSiteId(pageable, 1L).getNumberOfElements();

        ResponseEntity<HelperPage<ImageDTO>> responseEntity = restTemplate.exchange("/api/image/cultural-site/1/by-page",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<ImageDTO>>() {} );

        List<ImageDTO> images = Objects.requireNonNull(responseEntity.getBody()).toList();
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(size, images.size());
    }

    @Test
//    @Transactional
//    @Rollback
    public void Test_create_image_for_comment() throws Exception {
        login(USER_USERNAME, USER_PASSWORD);

        UserDetails userDetails = userDetailsService.loadUserByUsername(USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        FileSystemResource file = new FileSystemResource("src" + separator + "test" + separator
                + "resources" + separator +"something.jpg");

        MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
        parameters.add("file", file);


        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        HttpEntity<Object> httpEntity = new HttpEntity<>(parameters, headers);

        int size = imageService.findAll().size();

        ResponseEntity<ImageDTO> responseEntity = restTemplate.postForEntity("/api/image/comment/"+COMMENT_ID, httpEntity, ImageDTO.class);

        assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
        assertNotNull(responseEntity.getBody());
        assertEquals(size + 1, imageService.findAll().size());
        assertEquals(file.getFilename(), responseEntity.getBody().getName());

        imageService.delete(responseEntity.getBody().getId());

    }


    @Test
//    @Transactional
//    @Rollback
    public void Test_create_image_for_news() throws Exception {
        login(ADMIN_USERNAME, ADMIN_PASSWORD);

        UserDetails userDetails = userDetailsService.loadUserByUsername(USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        FileSystemResource file = new FileSystemResource("src" + separator + "test" + separator
                + "resources" + separator +"something.jpg");

        MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
        parameters.add("file", file);


        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        HttpEntity<Object> httpEntity = new HttpEntity<>(parameters, headers);

        int size = imageService.findAll().size();

        ResponseEntity<ImageDTO> responseEntity = restTemplate.postForEntity("/api/image/news/"+NEWS_ID, httpEntity, ImageDTO.class);

        assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
        assertNotNull(responseEntity.getBody());
        assertEquals(size + 1, imageService.findAll().size());
        assertEquals(file.getFilename(), responseEntity.getBody().getName());

        imageService.delete(responseEntity.getBody().getId());
    }


    @Test
//    @Transactional
//    @Rollback
    public void Test_create_image_for_cultural_site() throws Exception {
        login(ADMIN_USERNAME, ADMIN_PASSWORD);

        UserDetails userDetails = userDetailsService.loadUserByUsername(USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        FileSystemResource file = new FileSystemResource("src" + separator + "test" + separator
                + "resources" + separator +"something.jpg");

        MultiValueMap<String, Object> parameters = new LinkedMultiValueMap<String, Object>();
        parameters.add("file", file);


        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        headers.setContentType(MediaType.MULTIPART_FORM_DATA);

        HttpEntity<Object> httpEntity = new HttpEntity<>(parameters, headers);

        int size = imageService.findAll().size();

        ResponseEntity<ImageDTO> responseEntity = restTemplate.postForEntity("/api/image/cultural-site/"+
                CULTURAL_SITE_ID, httpEntity, ImageDTO.class);

        assertEquals(HttpStatus.CREATED, responseEntity.getStatusCode());
        assertNotNull(responseEntity.getBody());
        assertEquals(size + 1, imageService.findAll().size());
        assertEquals(file.getFilename(), responseEntity.getBody().getName());

        imageService.delete(responseEntity.getBody().getId());

    }


    @Test
    public void Test_delete_image() throws Exception {
        login(USER_USERNAME, USER_PASSWORD);

        UserDetails userDetails = userDetailsService.loadUserByUsername(USER_USERNAME);
        JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
        authentication.setToken(accessToken);
        SecurityContextHolder.getContext().setAuthentication(authentication);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        Image image = imageService.createForComment(COMMENT_ID, this.file);

        List<Image> images = imageService.findAll();

        int size = images.size();

        ResponseEntity<Void> responseEntity = restTemplate.exchange("/api/image/" + image.getId(),
                HttpMethod.DELETE, httpEntity, Void.class);

        // provera odgovora servera
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        // mora biti jedan manje slog sada nego pre
        assertEquals(size - 1, imageService.findAll().size());
    }

}
