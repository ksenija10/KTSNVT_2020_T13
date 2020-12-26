package com.kts.nvt.serbioneer.controller;

import static com.kts.nvt.serbioneer.constants.AdminConstants.*;
import static com.kts.nvt.serbioneer.constants.AdminConstants.UPDATE_SURNAME;
import static com.kts.nvt.serbioneer.constants.CommentConstants.*;
import static org.junit.jupiter.api.Assertions.assertEquals;

import com.kts.nvt.serbioneer.dto.AdminDTO;
import com.kts.nvt.serbioneer.dto.CommentDTO;
import com.kts.nvt.serbioneer.dto.UserLoginDTO;
import com.kts.nvt.serbioneer.dto.UserUpdateDTO;
import com.kts.nvt.serbioneer.helper.HelperPage;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.CulturalCategoryType;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.service.AuthenticatedUserService;
import com.kts.nvt.serbioneer.service.CommentService;
import com.kts.nvt.serbioneer.service.CulturalSiteService;
import lombok.NonNull;
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

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CommentControllerIntegrationTest {

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private CommentService commentService;

    @Autowired
    private AuthenticatedUserService authenticatedUserService;

    @Autowired
    private CulturalSiteService culturalSiteService;

    private final String baseURL = "/api/comment";

    private String accessToken;

    public void login(String username, String password) {
        //poziv REST servisa za logovanje
        ResponseEntity<UserLoginDTO> responseEntity = restTemplate.postForEntity("/login",
                new UserLoginDTO(username, password), UserLoginDTO.class);
        //postavljanje authorization tokena
        this.accessToken = responseEntity.getHeaders().get("Authorization").get(0);
    }

    @Test
    public void testGetAllCommentsPageable() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        //exchange radi da bi poslali header
        //pa mozete procitati sve u com.kts.nvt.serbioneer.helper.HelperPage klasi!
        ResponseEntity<HelperPage<CommentDTO>> responseEntity = restTemplate.exchange(
                baseURL + "/by-page?page=0&size=4",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<CommentDTO>>() {} );

        //statusni kod
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());

        List<CommentDTO> comments = responseEntity.getBody().getContent();
        assertEquals(ALL_COMMENTS_SIZE, comments.size());
    }

    @Test
    public void testGetAllUnapprovedCommentsPageable() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        //exchange radi da bi poslali header
        //pa mozete procitati sve u com.kts.nvt.serbioneer.helper.HelperPage klasi!
        ResponseEntity<HelperPage<CommentDTO>> responseEntity = restTemplate.exchange(
                baseURL + "/unapproved/by-page?page=0&size=4",
                HttpMethod.GET, httpEntity, new ParameterizedTypeReference<HelperPage<CommentDTO>>() {} );

        //statusni kod
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());

        List<CommentDTO> comments = responseEntity.getBody().getContent();
        assertEquals(UNAPPROVED_COMMENTS_SIZE, comments.size());
    }

    @Test
    public void testGetCommentSuccessful() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        // poziv REST servisa za dobavljanje komentara
        ResponseEntity<CommentDTO> responseEntity = restTemplate.exchange(
                baseURL + "/" + FIRST_EXISTING_COMMENT_ID,
                HttpMethod.GET, httpEntity, CommentDTO.class );

        //provera statusnog koda
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        //('Bas je super biblioteka', false, 2, 1, true);
        assertEquals(1, responseEntity.getBody().getId());
        assertEquals("Bas je super biblioteka", responseEntity.getBody().getText());
        assertEquals(false, responseEntity.getBody().isApproved());
        assertEquals("prvi@user.com", responseEntity.getBody().getUsername());
        assertEquals("Biblioteka šabačka", responseEntity.getBody().getCulturalSiteName());
    }

    @Test
    public void testGetCommentNonExistentId() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        // poziv REST servisa za dobavljanje komentara
        ResponseEntity<Void> responseEntity = restTemplate.exchange(
                baseURL + "/" + NON_EXISTING_COMMENT_ID,
                HttpMethod.GET, httpEntity, Void.class );

        //provera statusnog koda
        assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
    }

    @Test
    public void testUpdateComment() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_USER_USERNAME, DB_USER_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        //neophodno postaviti consumes
        headers.setContentType(MediaType.APPLICATION_JSON);

        //pravljenje dto objekta
        JSONObject updateCommentDTO = new JSONObject();
        updateCommentDTO.put("text", UPDATED_TEXT );

        HttpEntity<Object> httpEntity = new HttpEntity<Object>(updateCommentDTO.toString(), headers);

        // poziv REST servisa za update komentara
        ResponseEntity<CommentDTO> responseEntity = restTemplate.exchange(
                baseURL + "/" + EXISTING_APPROVED_COMMENT_ID,
                HttpMethod.PUT, httpEntity, CommentDTO.class );

        CommentDTO updatedComment = responseEntity.getBody();

        //provera statusnog koda
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());

        assertEquals(UPDATED_TEXT, updatedComment.getText());

        //vratiti sve na staro
        updateCommentDTO.put("text", OLD_TEXT_APPROVED);
        httpEntity = new HttpEntity<Object>(updateCommentDTO.toString(), headers);
        responseEntity = restTemplate.exchange(baseURL + "/" + EXISTING_APPROVED_COMMENT_ID,
                HttpMethod.PUT, httpEntity, CommentDTO.class);
    }

    @Test
    public void testUpdateCommentNonExisting() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_USER_USERNAME, DB_USER_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        //neophodno postaviti consumes
        headers.setContentType(MediaType.APPLICATION_JSON);

        //pravljenje dto objekta
        JSONObject updateCommentDTO = new JSONObject();
        updateCommentDTO.put("text", UPDATED_TEXT );

        HttpEntity<Object> httpEntity = new HttpEntity<Object>(updateCommentDTO.toString(), headers);

        // poziv REST servisa za update komentara
        ResponseEntity<CommentDTO> responseEntity = restTemplate.exchange(
                baseURL + "/" + NON_EXISTING_COMMENT_ID,
                HttpMethod.PUT, httpEntity, CommentDTO.class );

        CommentDTO updatedComment = responseEntity.getBody();

        //provera statusnog koda
        assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
    }

    @Test
    public void testUpdateCommentUserViolationException() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_USER_USERNAME_2, DB_USER_PASSWORD_2);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        //neophodno postaviti consumes
        headers.setContentType(MediaType.APPLICATION_JSON);

        //pravljenje dto objekta
        JSONObject updateCommentDTO = new JSONObject();
        updateCommentDTO.put("text", UPDATED_TEXT );

        HttpEntity<Object> httpEntity = new HttpEntity<Object>(updateCommentDTO.toString(), headers);

        // poziv REST servisa za update komentara
        ResponseEntity<CommentDTO> responseEntity = restTemplate.exchange(
                baseURL + "/" + EXISTING_APPROVED_COMMENT,
                HttpMethod.PUT, httpEntity, CommentDTO.class );

        CommentDTO updatedComment = responseEntity.getBody();

        //provera statusnog koda
        assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
    }

    @Test
    public void testUpdateCommentNotRevised() {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_USER_USERNAME, DB_USER_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        //neophodno postaviti consumes
        headers.setContentType(MediaType.APPLICATION_JSON);

        //pravljenje dto objekta
        JSONObject updateCommentDTO = new JSONObject();
        updateCommentDTO.put("text", UPDATED_TEXT );

        HttpEntity<Object> httpEntity = new HttpEntity<Object>(updateCommentDTO.toString(), headers);

        // poziv REST servisa za update komentara
        ResponseEntity<CommentDTO> responseEntity = restTemplate.exchange(
                baseURL + "/" + EXISTING_UNAPPROVED_COMMENT_ID,
                HttpMethod.PUT, httpEntity, CommentDTO.class );

        CommentDTO updatedComment = responseEntity.getBody();

        //provera statusnog koda
        assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());
    }

    @Test
    public void testDeleteCommentSuccessful() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_USER_USERNAME, DB_USER_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        //ubacujemo komentar koji cemo da brisemo
        Comment forDelete = commentService.create(EXISTING_CULTURAL_SITE_ID, new Comment("Komentar za brisanje"), EXISTING_USER_ID);
        //da bi komentar mogao da se obrise on mora da se approve prvo
        commentService.approve(forDelete.getId());

        int dbSizeBeforeAdd = commentService.findAll().size();

        // poziv REST servisa za brisanje
        ResponseEntity<Void> responseEntity = restTemplate.exchange(baseURL +"/"+ forDelete.getId(),
                HttpMethod.DELETE, httpEntity, Void.class);

        // provera odgovora servera
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());
        // mora biti jedan manje slog sada nego pre
        assertEquals(dbSizeBeforeAdd - 1, commentService.findAll().size());
    }

    @Test
    public void testDeleteCommentNonExistent() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_USER_USERNAME, DB_USER_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int dbSizeBeforeAdd = commentService.findAll().size();

        // poziv REST servisa za brisanje
        ResponseEntity<Void> responseEntity = restTemplate.exchange(baseURL +"/"+ NON_EXISTING_COMMENT_ID,
                HttpMethod.DELETE, httpEntity, Void.class);

        // provera odgovora servera
        assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
        // isti broj slogova jer nista nije obrisano
        assertEquals(dbSizeBeforeAdd , commentService.findAll().size());
    }

    @Test
    public void testDeleteCommentUserViolationException() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_USER_USERNAME_2, DB_USER_PASSWORD_2);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int dbSizeBeforeAdd = commentService.findAll().size();

        // poziv REST servisa za brisanje
        ResponseEntity<Void> responseEntity = restTemplate.exchange(baseURL +"/"+ EXISTING_APPROVED_COMMENT_ID,
                HttpMethod.DELETE, httpEntity, Void.class);

        // provera odgovora servera
        assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
        // isti broj slogova jer nista nije obrisano
        assertEquals(dbSizeBeforeAdd , commentService.findAll().size());
    }

    @Test
    public void testDeleteCommentNotRevised() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_USER_USERNAME, DB_USER_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int dbSizeBeforeAdd = commentService.findAll().size();

        // poziv REST servisa za brisanje
        ResponseEntity<Void> responseEntity = restTemplate.exchange(baseURL +"/"+ EXISTING_UNAPPROVED_COMMENT_ID,
                HttpMethod.DELETE, httpEntity, Void.class);

        // provera odgovora servera
        assertEquals(HttpStatus.NOT_FOUND, responseEntity.getStatusCode());
        // isti broj slogova jer nista nije obrisano
        assertEquals(dbSizeBeforeAdd , commentService.findAll().size());
    }

    @Test
    public void testApproveCommentSuccessful() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        //ubacujemo komentar koji cemo da odobrimo
        Comment forApprove = commentService.create(EXISTING_CULTURAL_SITE_ID, new Comment("Komentar za odobravanje"), EXISTING_USER_ID);

        int dbApprovedSizeBeforeApprove = commentService.findAllByApproved(APPROVED).size();
        int dbUnapprovedSizeBeforeApprove = commentService.findAllByApproved(UNAPPROVED).size();

        // poziv REST servisa za brisanje
        ResponseEntity<CommentDTO> responseEntity = restTemplate.exchange(baseURL +"/"+ forApprove.getId()
                + "/approval", HttpMethod.PUT, httpEntity, CommentDTO.class);

        CommentDTO approvedComment = responseEntity.getBody();

        //provera statusnog koda
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());

        //provera da li je sada approved
        assertEquals(APPROVED, approvedComment.isApproved());

        // broj unapproved tj pedning zahteva se smanjio za jedan a broj approved se povecao za jedan
        assertEquals(dbApprovedSizeBeforeApprove + 1 , commentService.findAllByApproved(APPROVED).size());
        assertEquals(dbUnapprovedSizeBeforeApprove - 1 , commentService.findAllByApproved(UNAPPROVED).size());

        //brisanje komentara zbog konzistentnosti u bazi
        commentService.delete(forApprove.getId(), EXISTING_USER_ID);
    }

    @Test
    public void testApproveCommentNonExisting() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int dbApprovedSizeBeforeApprove = commentService.findAllByApproved(APPROVED).size();
        int dbUnapprovedSizeBeforeApprove = commentService.findAllByApproved(UNAPPROVED).size();

        // poziv REST servisa za brisanje
        ResponseEntity<CommentDTO> responseEntity = restTemplate.exchange(baseURL +"/"+ NON_EXISTING_COMMENT_ID
                + "/approval", HttpMethod.PUT, httpEntity, CommentDTO.class);

        CommentDTO approvedComment = responseEntity.getBody();

        //provera statusnog koda
        assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());

        // nije doslo do promene jer zahtev nije odobren
        assertEquals(dbApprovedSizeBeforeApprove , commentService.findAllByApproved(APPROVED).size());
        assertEquals(dbUnapprovedSizeBeforeApprove, commentService.findAllByApproved(UNAPPROVED).size());
    }

    @Test
    public void testApproveCommentAlreadyApproved() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int dbApprovedSizeBeforeApprove = commentService.findAllByApproved(APPROVED).size();
        int dbUnapprovedSizeBeforeApprove = commentService.findAllByApproved(UNAPPROVED).size();

        // poziv REST servisa za brisanje
        ResponseEntity<CommentDTO> responseEntity = restTemplate.exchange(baseURL +"/"+ EXISTING_APPROVED_COMMENT_ID
                + "/approval", HttpMethod.PUT, httpEntity, CommentDTO.class);

        CommentDTO approvedComment = responseEntity.getBody();

        //provera statusnog koda
        assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());

        // nije doslo do promene jer zahtev nije odobren
        assertEquals(dbApprovedSizeBeforeApprove , commentService.findAllByApproved(APPROVED).size());
        assertEquals(dbUnapprovedSizeBeforeApprove, commentService.findAllByApproved(UNAPPROVED).size());
    }

    @Test
    public void testRejectCommentSuccessful() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        //ubacujemo komentar koji cemo da odobrimo
        Comment forReject = commentService.create(EXISTING_CULTURAL_SITE_ID, new Comment("Komentar za odbijanje"), EXISTING_USER_ID);

        int dbSizeBeforeApprove = commentService.findAll().size();
        int dbUnapprovedSizeBeforeReject = commentService.findAllByApproved(UNAPPROVED).size();

        // poziv REST servisa za brisanje
        ResponseEntity<Void> responseEntity = restTemplate.exchange(baseURL +"/"+ forReject.getId()
                + "/approval", HttpMethod.DELETE, httpEntity, Void.class);

        //provera statusnog koda
        assertEquals(HttpStatus.OK, responseEntity.getStatusCode());

        // broj unapproved tj pedning komentara i broj svih komentara se smanjio za jedan
        assertEquals(dbSizeBeforeApprove - 1 , commentService.findAll().size());
        assertEquals(dbUnapprovedSizeBeforeReject - 1 , commentService.findAllByApproved(UNAPPROVED).size());
    }

    @Test
    public void testRejectCommentNonExisting() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int dbSizeBeforeApprove = commentService.findAll().size();
        int dbUnapprovedSizeBeforeReject = commentService.findAllByApproved(UNAPPROVED).size();

        // poziv REST servisa za brisanje
        ResponseEntity<Void> responseEntity = restTemplate.exchange(baseURL +"/"+ NON_EXISTING_COMMENT_ID
                + "/approval", HttpMethod.DELETE, httpEntity, Void.class);

        //provera statusnog koda
        assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());

        // nije doslo do promene
        assertEquals(dbSizeBeforeApprove, commentService.findAll().size());
        assertEquals(dbUnapprovedSizeBeforeReject, commentService.findAllByApproved(UNAPPROVED).size());
    }

    @Test
    public void testRejectCommentAlreadyApproved() throws Exception {
        //u svakoj testnoj metodi koja zahteva autorizaciju, neophodno je da imamo login
        login(DB_ADMIN_USERNAME, DB_ADMIN_PASSWORD);

        //postavljanje autorizacije u header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", this.accessToken);
        HttpEntity<Object> httpEntity = new HttpEntity<Object>(headers);

        int dbSizeBeforeApprove = commentService.findAll().size();
        int dbUnapprovedSizeBeforeReject = commentService.findAllByApproved(UNAPPROVED).size();

        // poziv REST servisa za brisanje
        ResponseEntity<Void> responseEntity = restTemplate.exchange(baseURL +"/"+ EXISTING_APPROVED_COMMENT_ID
                + "/approval", HttpMethod.DELETE, httpEntity, Void.class);

        //provera statusnog koda
        assertEquals(HttpStatus.BAD_REQUEST, responseEntity.getStatusCode());

        // nije doslo do promene
        assertEquals(dbSizeBeforeApprove, commentService.findAll().size());
        assertEquals(dbUnapprovedSizeBeforeReject, commentService.findAllByApproved(UNAPPROVED).size());
    }
}
