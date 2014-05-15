package com.spring.webapp.lojavirtual.privado.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="privado")
public class PrivadoController {
	
	@RequestMapping(value="dashboard.htm")
	@PreAuthorize("hasPermission(#user, 'dashboard')")
	public ModelAndView dashboard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/dashboard");
		return mav;
	}
		
}
