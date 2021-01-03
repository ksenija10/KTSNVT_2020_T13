package com.kts.nvt.serbioneer.controller;

import static com.kts.nvt.serbioneer.constants.AdminConstants.FIND_PAGEABLE_ADMINS;
import static com.kts.nvt.serbioneer.constants.NewsConstants.*;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import com.kts.nvt.serbioneer.dto.AdminDTO;
import com.kts.nvt.serbioneer.dto.NewsDTO;
import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.helper.HelperPage;
import com.kts.nvt.serbioneer.model.News;
import com.kts.nvt.serbioneer.service.AdminService;
import com.kts.nvt.serbioneer.service.NewsService;
import net.minidev.json.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.*;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class NewsControllerIntegrationTest {

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private NewsService newsService;

    private String accessToken;

    private final String baseURL = "/api/news";

    public void login(String username, String password) {
        //poziv REST servisa za logovanje
        ResponseEntity<UserLoginDTO> responseEntity = restTemplate.postForEntity("/login",
                new UserLoginDTO(username, password), UserLoginDTO.class);
        //postavljanje authorization tokena
        this.accessToken = responseEntity.getHeaders().get("Authorization").get(0);
    }

    public String dateToString(Date date) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(date);
    }

    @Test
    public void testGetAllNewsPageable() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        //exchange radi da bi poslali header
        ResponseEntity<HelperPage<NewsDTO>> responseEntity = restTemplate.exchange(baseURL +"/by-page?page=0&size=4",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<NewsDTO>>() {} );

        //statusni kod
        List<NewsDTO> news = responseEntity.getBody().toList();
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(ALL_NEWS, news.size());
    }

    @Test
    public void testGetNewsSuccessful() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        // poziv REST servisa za dobavljanje news
        ResponseEntity<NewsDTO> responseEntity = restTemplate.exchange(
                baseURL + "/" + EXISTING_NEWS_ID,
                HttpMethod.GET, httpEntity, NewsDTO.class );

        //provera statusnog koda
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(EXISTING_NEWS_ID, responseEntity.getBody().getId());
        assertEquals("Neke novosti za bibl", responseEntity.getBody().getInformation());
        assertEquals("2020-11-12", dateToString(responseEntity.getBody().getDateTime()));
    }

    @Test
    public void testGetNewsNonExisting() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        // poziv REST servisa za dobavljanje news
        ResponseEntity<NewsDTO> responseEntity = restTemplate.exchange(
                baseURL + "/" + NON_EXISTING_NEWS_ID,
                HttpMethod.GET, httpEntity, NewsDTO.class );

        //provera statusnog koda
        assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
    }

    @Test
    public void testUpdateNewsSuccessful() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        //neophodno postaviti consumes
        headers.setContentType(MediaType.APPLICATION_JSON);

        //pravljenje dto objekta
        JSONObject updatedNewsDTO = new JSONObject();
        updatedNewsDTO.put("information", UPDATED_NEWS_INFORMATION );

        HttpEntity<Object> httpEntity = new HttpEntity<Object>(updatedNewsDTO.toString(), headers);

        // poziv REST servisa za update news
        ResponseEntity<NewsDTO> responseEntity = restTemplate.exchange(
                baseURL + "/" + EXISTING_NEWS_ID,
                HttpMethod.PUT, httpEntity, NewsDTO.class );

        NewsDTO updatedNews = responseEntity.getBody();

        //provera statusnog koda
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());

        assertEquals(UPDATED_NEWS_INFORMATION, updatedNews.getInformation());

        //vratiti sve na staro
        updatedNewsDTO.put("information", OLD_NEWS_INFORMATION);
        httpEntity = new HttpEntity<Object>(updatedNewsDTO.toString(), headers);
        responseEntity = restTemplate.exchange(baseURL + "/" + EXISTING_NEWS_ID,
                HttpMethod.PUT, httpEntity, NewsDTO.class);
    }

    @Test
    public void testUpdateNewsNonExisting() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        //neophodno postaviti consumes
        headers.setContentType(MediaType.APPLICATION_JSON);

        //pravljenje dto objekta
        JSONObject updatedNewsDTO = new JSONObject();
        updatedNewsDTO.put("information", UPDATED_NEWS_INFORMATION );

        HttpEntity<Object> httpEntity = new HttpEntity<Object>(updatedNewsDTO.toString(), headers);

        // poziv REST servisa za update news
        ResponseEntity<NewsDTO> responseEntity = restTemplate.exchange(
                baseURL + "/" + NON_EXISTING_NEWS_ID,
                HttpMethod.PUT, httpEntity, NewsDTO.class );

        NewsDTO updatedNews = responseEntity.getBody();

        //provera statusnog koda
        assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
    }

    @Test
    public void testDeleteNewsSuccessful() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        //ubacujemo news koji cemo da brisemo
        News forDelete = newsService.create(EXISTING_CULTURAL_SITE_ID, new News("Novosti za brisanje"));

        int dbSizeBeforeDelete = newsService.findAll().size();

        // poziv REST servisa za brisanje
        ResponseEntity<Void> responseEntity = restTemplate.exchange(baseURL +"/"+ forDelete.getId(),
                HttpMethod.DELETE, httpEntity, Void.class);

        // provera odgovora servera
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        // mora biti jedan manje slog sada nego pre
        assertEquals(dbSizeBeforeDelete - 1, newsService.findAll().size());
    }

    @Test
    public void testDeleteNewsNonExisting() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int dbSizeBeforeDelete = newsService.findAll().size();

        // poziv REST servisa za brisanje
        ResponseEntity<Void> responseEntity = restTemplate.exchange(baseURL +"/"+ NON_EXISTING_NEWS_ID,
                HttpMethod.DELETE, httpEntity, Void.class);

        // provera odgovora servera
        assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
        // mora biti jedan manje slog sada nego pre
        assertEquals(dbSizeBeforeDelete, newsService.findAll().size());
    }

    @Test
    public void testGetAllSubscribedNewsPageable() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_USER_USERNAME, DB_USER_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        //exchange radi da bi poslali header
        ResponseEntity<HelperPage<NewsDTO>> responseEntity = restTemplate.exchange(baseURL +"/subscribed/by-page?page=0&size=4",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<NewsDTO>>() {} );

        //statusni kod
        List<NewsDTO> news = responseEntity.getBody().toList();
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        assertEquals(SUBSCRIBED_NEWS_USER_ID_2, news.size());
        //provera da li su dobro poredjani
        assertTrue(news.get(0).getDateTime().after(news.get(1).getDateTime()));
        assertTrue(news.get(1).getDateTime().after(news.get(2).getDateTime()));
    }
}
