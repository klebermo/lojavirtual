package com.spring.webapp.lojavirtual.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

public class CustomAuthenticationManager implements AuthenticationManager {
	
	@Autowired
	private CustomAuthenticationProvider authenticationProvider;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		return authenticationProvider.authenticate(authentication);
	}
    
}
