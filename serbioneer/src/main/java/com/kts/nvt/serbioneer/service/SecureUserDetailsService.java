package com.kts.nvt.serbioneer.service;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.User;
import com.kts.nvt.serbioneer.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class SecureUserDetailsService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws  UsernameNotFoundException {
        User user = userRepository.findOneByEmail(username);

        if (user == null) {
            throw new UsernameNotFoundException(String.format("No user found with email %s.", username));
        }

        if (user.getClass() == AuthenticatedUser.class) {
            if(!((AuthenticatedUser) user).isActivated()) {
                throw new UsernameNotFoundException(String.format("The account: %s isnt activated. To activate your" +
                        "account please check your email.", username));
            }
        }

        return user;
    }
}
