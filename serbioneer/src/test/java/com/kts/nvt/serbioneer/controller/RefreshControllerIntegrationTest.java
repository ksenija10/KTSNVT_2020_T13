package com.kts.nvt.serbioneer.controller;

import static com.kts.nvt.serbioneer.constants.RefreshConstants.ADMIN_PASSWORD;
import static com.kts.nvt.serbioneer.constants.RefreshConstants.ADMIN_USERNAME;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.dto.UserLoginDTO;


@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class RefreshControllerIntegrationTest {

    @Autowired
    private TestRestTemplate restTemplate;

    private String accessToken;

    public void login(String username, String password) {
        //poziv REST servisa za logovanje
        ResponseEntity<UserLoginDTO> responseEntity = restTemplate.postForEntity("/login",
                new UserLoginDTO(username, password), UserLoginDTO.class);
        //postavljanje authorization tokena
        this.accessToken = responseEntity.getHeaders().get("Authorization").get(0);
    }

    @Test
    public void testRefreshAuthenticationToken(){
        login(ADMIN_USERNAME, ADMIN_PASSWORD);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        ResponseEntity<Void> responseEntity = restTemplate.exchange(
                "/api/refresh", HttpMethod.POST, httpEntity,
                new ParameterizedTypeReference<Void>() {});

        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
    }


    @Test
    public void testRefreshAuthenticationTokenUnauthorized(){
        login(ADMIN_USERNAME, ADMIN_PASSWORD);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "this.accessToken");
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        ResponseEntity<Void> responseEntity = restTemplate.exchange(
                "/api/refresh", HttpMethod.POST, httpEntity,
                new ParameterizedTypeReference<Void>() {});

        assertEquals(HttpStatus.UNAUTHORIZED, responseEntity.getStatusCode());
    }
}
