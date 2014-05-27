package com.spring.webapp.lojavirtual.acesso.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="privado")
public class PrivadoController {
	
	@RequestMapping(value="dashboard")
	@PreAuthorize("hasPermission(#user, 'dashboard')")
	public ModelAndView dashboard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("acesso/dashboard");
		return mav;
	}
	
	@RequestMapping(value="blank")
	@PreAuthorize("hasPermission(#user, 'dashboard')")
	public ModelAndView blank() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("acesso/blank");
		return mav;
	}
		
}
