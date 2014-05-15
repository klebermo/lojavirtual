package com.spring.webapp.lojavirtual.erro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="erro")
public class ErroController {
	
	@RequestMapping(value="{theString}")
	public ModelAndView erro(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("erro/"+theString);
		return mav;
	}
	
}
