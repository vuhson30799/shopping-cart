package com.utils;

import com.model.User;
import com.repository.UserRepository;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Arrays;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    private static final String ADMIN_EMAIL = "admin@gmail.com";
    private final UserRepository userRepository;

    public UserDetailsServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String emailId) {
        User user = userRepository.findByEmailId(emailId);
        if (user == null) {
            throw new UsernameNotFoundException("User is not exist " + emailId);
        }
        GrantedAuthority grantedAuthority;
        if (ADMIN_EMAIL.equals(user.getEmailId())) {
            grantedAuthority = new SimpleGrantedAuthority("ADMIN");
        } else {
            grantedAuthority = new SimpleGrantedAuthority("USER");
        }
        return  new org.springframework.security.core.userdetails.User(user.getEmailId(), user.getPassword(), Arrays.asList(grantedAuthority));
    }
}
