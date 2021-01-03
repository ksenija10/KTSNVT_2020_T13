package com.kts.nvt.serbioneer.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.kts.nvt.serbioneer.jwt.TokenUtils;
import com.kts.nvt.serbioneer.model.User;
import com.kts.nvt.serbioneer.service.SecureUserDetailsService;

@RestController
@RequestMapping(value = "api/refresh", produces = MediaType.APPLICATION_JSON_VALUE)
public class RefreshController {

	@Autowired
    private TokenUtils tokenUtils;

	@Autowired
	private SecureUserDetailsService userDetailsService;
	
	/*
	 * url: POST localhost:8080/api/refresh
	 * HTTP Request for getting a refreshed token
	 * NOTE: token must be valid at this time
	*/
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
    @PostMapping
    public ResponseEntity<Void> refreshAuthenticationToken(HttpServletRequest request,
    														HttpServletResponse response) {

        String token = tokenUtils.getToken(request);
        String username = this.tokenUtils.getUsernameFromToken(token);
        User user = (User) this.userDetailsService.loadUserByUsername(username);

        if (this.tokenUtils.canTokenBeRefreshed(token, user.getLastPasswordResetDate())) {
            String refreshedToken = tokenUtils.refreshToken(token);
            int expiresIn = tokenUtils.getExpiresIn();
            
            // postavljanje headera
            response.addHeader(tokenUtils.getAuthHeader(), "Bearer " + refreshedToken);
            response.addHeader(tokenUtils.getExpHeader(), String.valueOf(expiresIn));
            return new ResponseEntity<>(HttpStatus.OK);
        } else {
        	// ako je nevalidan, bice zaustavljen vec u filteru za validaciju tokena
        	// token istekao -> nevalidan -> 401 Unauthorized
        	// sifra promenjena -> nevalidan -> 401 Unauthorized
        	// nece se pozvati nikada
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST,
            		"Token already expired, cannot be refreshed.");
        }
    }
}
