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

import com.spring.webapp.lojavirtual.acesso.service.PermissaoService;

@Controller
@RequestMapping(value="permissao")
public class PermissaoController {
	
	@Autowired
	private PermissaoService permissao;
	
	@RequestMapping(value="cadastra.htm", method=RequestMethod.POST)
	@ResponseBody
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(permissao.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="cadastra.htm")
	@PreAuthorize("hasPermission(#user, 'altera_usuario')")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/permissao/cadastra");
		return mav;
	}
	
	@RequestMapping(value="alterna.htm", method=RequestMethod.POST)
	@ResponseBody
	public String alterna(HttpServletRequest request, HttpServletResponse response) {
		if(permissao.alterna(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="alterna.htm")
	@PreAuthorize("hasPermission(#user, 'altera_usuario')")
	public ModelAndView alterna(@RequestParam("id") String id) {
		int id_usuario = Integer.valueOf(id).intValue();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("permissao", permissao.lista_permissoes(id_usuario));
		mav.setViewName("privado/pemissao/alterna");
		return mav;
	}
	
	@RequestMapping(value="listagem.htm")
	@PreAuthorize("hasPermission(#user, 'altera_usuario')")
	public ModelAndView listagem() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", permissao.lista_grupo_permissoes());
		mav.setViewName("privado/permissao/listagem");
		return mav;
	}
	
	@RequestMapping(value="grupos.json", method=RequestMethod.GET)
	public ModelAndView grupos(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", permissao.lista_grupo_permissoes());
		mav.setViewName("listagem_grupos");
		return mav;
	}
	
	@RequestMapping(value="permissoes.json", method=RequestMethod.GET)
	public ModelAndView permissoes(HttpServletRequest request, HttpServletResponse response) {
		int id_permissao = Integer.valueOf(request.getParameter("id")).intValue();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", permissao.lista_permissoes(id_permissao));
		mav.setViewName("listagem_permissoes");
		return mav;
	}
	
}
