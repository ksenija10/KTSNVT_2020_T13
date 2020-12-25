package com.kts.nvt.serbioneer.service;

import org.junit.Test;
import org.junit.jupiter.api.function.Executable;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import static com.kts.nvt.serbioneer.constants.SecureUserDetailsConstants.USER_USERNAME_ACTIVATED;
import static com.kts.nvt.serbioneer.constants.SecureUserDetailsConstants.USER_USERNAME_NOT_ACTIVATED;
import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment= SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class SecureUserDetailsServiceIntegrationTest {

    @Autowired
    SecureUserDetailsService userDetailsService;


    @Test
    public void testLoadUserByUsername(){
        UserDetails userDetails = userDetailsService.loadUserByUsername(USER_USERNAME_ACTIVATED);

        assertNotNull(userDetails);
    }

    @Test(expected = UsernameNotFoundException.class)
    public void testLoadUserByUsernameFail(){
        userDetailsService.loadUserByUsername(USER_USERNAME_NOT_ACTIVATED);

    }

}
