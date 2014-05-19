package com.spring.webapp.lojavirtual.acesso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.webapp.lojavirtual.acesso.service.UsuarioService;

@Controller
@RequestMapping(value="usuario")
public class UsuarioController {
	
	@Autowired
	private UsuarioService usuario;
	
	@RequestMapping(value="cadastra.htm")
	@PreAuthorize("hasPermission(#user, 'cadastra_usuario')")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/usuario/cadastra");
		return mav;
	}
	
	@RequestMapping(value="altera.htm")
	@PreAuthorize("hasPermission(#user, 'altera_usuario')")
	public ModelAndView altera(@RequestParam("id") String id) {
		int id_usuario = Integer.valueOf(id).intValue();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("usuario", usuario.listagem_usuario(id_usuario));
		mav.setViewName("privado/usuario/altera");
		return mav;
	}
	
	@RequestMapping(value="remove.htm")
	@PreAuthorize("hasPermission(#user, 'remove_usuario')")
	public ModelAndView remove() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/usuario/altera");
		return mav;
	}
	
	@RequestMapping(value="listagem.htm")
	public ModelAndView lista() {
		System.out.println("listagem_usuarios.htm");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/usuario/listagem");
		return mav;
	}
	
	@RequestMapping(value="permissoes.htm")
	@PreAuthorize("hasPermission(#user, 'altera_usuario')")
	public ModelAndView permissoes() {
		System.out.println("listagem_usuarios.htm");
		ModelAndView mav = new ModelAndView();
		mav.addObject("permissoes", usuario.lista_grupo_permissoes());
		mav.setViewName("privado/usuario/permissoes");
		return mav;
	}
	
	@RequestMapping(value="cadastra.htm", method=RequestMethod.POST)
	@ResponseBody
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(usuario.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera.htm", method=RequestMethod.POST)
	@ResponseBody
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(usuario.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove.htm", method=RequestMethod.POST)
	@ResponseBody
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(usuario.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="usuarios.json")
	public ModelAndView usuarios() {
		System.out.println("usuarios.json");
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", usuario.listagem_usuarios());
		mav.setViewName("listagem_usuarios");
		return mav;
	}
	
	@RequestMapping(value="permissoes.json", method=RequestMethod.GET)
	public ModelAndView permissoes(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("permissoes.json");
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", usuario.lista_permissoes(request, response));
		mav.setViewName("listagem_permissoes");
		return mav;
	}
	
}
