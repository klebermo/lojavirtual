package com.spring.webapp.lojavirtual.config.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.SavedRequest;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
		HttpSession session = request.getSession();
		SavedRequest savedReq = (SavedRequest) session.getAttribute(WebAttributes.ACCESS_DENIED_403);
		
		if (savedReq == null) {
			response.sendRedirect(request.getContextPath() + "/privado/dashboard.htm");
		}
		else {
		    response.sendRedirect(request.getContextPath() + "/acesso/login.htm?erro=no_permit");
		}
	}

}
