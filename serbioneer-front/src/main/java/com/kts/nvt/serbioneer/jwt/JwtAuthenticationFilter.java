package com.kts.nvt.serbioneer.jwt;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.filter.OncePerRequestFilter;

import com.kts.nvt.serbioneer.service.SecureUserDetailsService;

public class JwtAuthenticationFilter extends OncePerRequestFilter {

	private TokenUtils tokenUtils;
	
	private SecureUserDetailsService userDetailsService;
	
	public JwtAuthenticationFilter(TokenUtils tokenUtils, SecureUserDetailsService userDetailsService) {
		super();
		this.tokenUtils = tokenUtils;
		this.userDetailsService = userDetailsService;
	}
	

	@Override
	protected void doFilterInternal(HttpServletRequest request, 
									HttpServletResponse response, 
									FilterChain filterChain)
							throws ServletException, IOException {
		String username;
        String authToken = tokenUtils.getToken(request);

        if (authToken != null) {
            // uzmi username iz tokena
            username = tokenUtils.getUsernameFromToken(authToken);

            if (username != null) {
                // uzmi user-a na osnovu username-a
                UserDetails userDetails = userDetailsService.loadUserByUsername(username);

                // proveri da li je prosledjeni token validan
                if (tokenUtils.validateToken(authToken, userDetails)) {
                    // kreiraj autentifikaciju
                	JwtBasedAuthentication authentication = new JwtBasedAuthentication(userDetails);
                    authentication.setToken(authToken);
                    SecurityContextHolder.getContext().setAuthentication(authentication);
                }
            }
        }

        // prosledi request dalje u sledeci filter
        filterChain.doFilter(request, response);
	}

}
