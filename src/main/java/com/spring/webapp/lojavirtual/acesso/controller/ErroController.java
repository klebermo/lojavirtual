package com.spring.webapp.lojavirtual.acesso.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="erro")
public class ErroController {
	
	@RequestMapping(value="login")
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("erro/publico/login");
		return mav;
	}
	
	@RequestMapping(value="no_permit")
	public ModelAndView no_permit() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("erro/privado/no_permit");
		return mav;
	}
}
