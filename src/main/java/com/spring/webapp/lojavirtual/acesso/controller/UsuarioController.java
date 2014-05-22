package com.spring.webapp.lojavirtual.acesso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value="cadastra", method=RequestMethod.POST)
	@ResponseBody
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(usuario.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="cadastra")
	@PreAuthorize("hasPermission(#user, 'cadastra_usuario')")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/usuario/cadastra");
		return mav;
	}
	
	@RequestMapping(value="altera", method=RequestMethod.POST)
	@ResponseBody
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(usuario.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value = "altera/{theString}")
	@PreAuthorize("hasPermission(#user, 'altera_usuario')")
	public ModelAndView altera(@PathVariable String theString) {
		int id_usuario = Integer.valueOf(theString).intValue();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("usuario", usuario.listagem_usuario(id_usuario));
		mav.setViewName("privado/usuario/altera");
		return mav;
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	@ResponseBody
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(usuario.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove/{theString}")
	@PreAuthorize("hasPermission(#user, 'altera_usuario')")
	public ModelAndView remove(@PathVariable String theString) {
		int id_usuario = Integer.valueOf(theString).intValue();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("usuario", usuario.listagem_usuario(id_usuario));
		mav.setViewName("privado/usuario/remove");
		return mav;
	}
	
	@RequestMapping(value="listagem")
	public ModelAndView lista() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/usuario/listagem");
		return mav;
	}
	
	@RequestMapping(value="listagem.json")
	public ModelAndView usuarios() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", usuario.listagem_usuarios());
		mav.setViewName("listagem_usuarios");
		return mav;
	}
	
}
