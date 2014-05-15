package com.spring.webapp.lojavirtual.config.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.*;

@Configuration
@ComponentScan(value="com.spring.webapp.lojavirtual")
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return new CustomAuthenticationManager();
    }
	
    protected void configure(HttpSecurity http) throws Exception {
    	http
    		.csrf()
    			.disable()
    		.authorizeRequests()
    			.antMatchers("/erro/login").permitAll()
    			.antMatchers("/bootstrap/**", "/jquery/**", "/extra/**", "/publico/**", "/erro/publico/**").permitAll()
    			.anyRequest().authenticated()
    			.and()
			.formLogin()
				.loginPage("/acesso/login").permitAll()
				.loginProcessingUrl("/login").permitAll()
				.usernameParameter("login")
				.passwordParameter("senha")
				.successHandler(new CustomAuthenticationSuccessHandler())
				.failureHandler(new CustomAuthenticationFailureHandler())
				.and()
			.rememberMe()
				.key("lembrete")
				.useSecureCookie(true)
				.and()
			.logout()
				.logoutUrl("/logout")
				.logoutSuccessUrl("/acesso/login").permitAll();
    }
    
}
