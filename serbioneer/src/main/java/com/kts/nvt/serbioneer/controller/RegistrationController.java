package com.kts.nvt.serbioneer.controller;

import java.util.HashSet;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.view.RedirectView;

import com.kts.nvt.serbioneer.dto.AuthenticatedUserDTO;
import com.kts.nvt.serbioneer.helper.AuthenticatedUserMapper;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.registration.VerificationToken;
import com.kts.nvt.serbioneer.service.AuthenticatedUserService;
import com.kts.nvt.serbioneer.service.AuthorityService;

@RestController
@RequestMapping(value = "api", produces = MediaType.APPLICATION_JSON_VALUE)
public class RegistrationController {

    @Autowired
    AuthorityService authorityService;

    @Autowired
    AuthenticatedUserService authenticatedUserService;

    @Autowired
    ApplicationEventPublisher eventPublisher;

    private final AuthenticatedUserMapper authenticatedUserMapper;

    public RegistrationController() {
        this.authenticatedUserMapper = new AuthenticatedUserMapper();
    }

    /*
     * url: POST localhost:8080/api/register
     * HTTP Request for registering
     */
    @PostMapping(value = "/register", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<AuthenticatedUserDTO> registerAuthenticatedUser(@Valid @RequestBody AuthenticatedUserDTO
                                                                                  authenticatedUserDto, HttpServletRequest request) {
        authenticatedUserDto.setActivated(false);
        AuthenticatedUser authenticatedUser = authenticatedUserMapper.toEntity(authenticatedUserDto);
        try {
            authenticatedUser.setAuthorities(new HashSet<>(authorityService.findByName("ROLE_USER")));
            authenticatedUser = authenticatedUserService.create(authenticatedUser);
            authenticatedUserService.confirmRegistration(authenticatedUser);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }
        // dekriptovanu sifru saljemo na front
        authenticatedUser.setPassword(authenticatedUserDto.getPassword());
        return new ResponseEntity<>(authenticatedUserMapper.toDto(authenticatedUser),
                HttpStatus.CREATED);
    }

    /*
     * url: POST localhost:8080/api/registrationConfirm
     * HTTP Request for confirming registration
     */
    @GetMapping("/registrationConfirm")
    public RedirectView confirmRegistration
            (WebRequest request, @RequestParam("token") String token) {

        VerificationToken verificationToken = authenticatedUserService.getVerificationToken(token);
        if (verificationToken == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Verification token does not exist!");
        }

        AuthenticatedUser user = verificationToken.getUser();

        if (verificationToken.isExpired()) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Verification token has expired! Please register again");
        }

        user.setActivated(true);
        authenticatedUserService.saveRegisteredUser(user);
        return new RedirectView("https://localhost:4200/login-register/login");
    }
}
