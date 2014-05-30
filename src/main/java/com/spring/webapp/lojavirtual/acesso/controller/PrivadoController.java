package com.spring.webapp.lojavirtual.acesso.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.spring.webapp.lojavirtual.acesso.service.PrivadoService;

@Controller
@SessionAttributes({"username"})
@RequestMapping(value="privado")
public class PrivadoController {
	
	@Autowired
	private PrivadoService privado;
	
	@RequestMapping(value="dashboard")
	@PreAuthorize("hasPermission(#user, 'dashboard')")
	public ModelAndView dashboard(@ModelAttribute("username") String username) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("usuario", privado.loadUsuarioByUsername(username));
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
	
	@RequestMapping(value="perfil")
	@PreAuthorize("hasPermission(#user, 'dashboard')")
	public ModelAndView perfil(@ModelAttribute("username") String username) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("usuario", privado.loadUsuarioByUsername(username));
		mav.setViewName("acesso/perfil");
		return mav;
	}
		
}
