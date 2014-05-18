package com.spring.webapp.lojavirtual.acesso.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.webapp.lojavirtual.acesso.service.UsuarioService;

@Controller
@RequestMapping(value="usuario")
public class UsuarioController {
	
	@Autowired
	private UsuarioService usuario;
	
	@RequestMapping(value="cadastra.htm")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/usuario/cadastra");
		return mav;
	}
	
	@RequestMapping(value="altera.htm")
	public ModelAndView altera() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("usuario/altera");
		return mav;
	}
	
	@RequestMapping(value="listagem.htm")
	public ModelAndView lista() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("usuario/listagem");
		return mav;
	}
	
	@RequestMapping(value="pesquisa.htm")
	public ModelAndView pesquisa() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("usuario/pesquisa");
		return mav;
	}
	
	@RequestMapping(value="cadastra.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'cadastra_usuario')")
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(usuario.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'altera_usuario')")
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(usuario.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'remove_usuario')")
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(usuario.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="listagem.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'remove_usuario')")
	public List<?> listagem(HttpServletRequest request, HttpServletResponse response) {
		return usuario.listagem();
	}
	
}
