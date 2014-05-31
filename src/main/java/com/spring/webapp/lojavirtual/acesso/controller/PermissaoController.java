package com.spring.webapp.lojavirtual.acesso.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	@RequestMapping(value="cadastra", method=RequestMethod.POST)
	@ResponseBody
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(permissao.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="cadastra")
	@PreAuthorize("hasPermission(#user, 'cadastra_permissao')")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/permissao/cadastra");
		return mav;
	}
	
	@RequestMapping(value="altera", method=RequestMethod.POST)
	@ResponseBody
	public String alterna(HttpServletRequest request, HttpServletResponse response) {
		if(permissao.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera/{theString}")
	@PreAuthorize("hasPermission(#user, 'altera_permissao')")
	public ModelAndView alterna(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("id_usuario", theString);
		mav.setViewName("privado/permissao/altera");
		return mav;
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	@ResponseBody
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(permissao.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove/{theString}")
	@PreAuthorize("hasPermission(#user, 'remove_permissao')")
	public ModelAndView remove(@PathVariable String theString) {
		int id = Integer.valueOf(theString).intValue();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("permissao", permissao.findRoleById(id));
		mav.setViewName("privado/permissao/remove");
		return mav;
	}
	
	@RequestMapping(value="listagem/{theString}")
	public ModelAndView lista(@PathVariable String theString) {
		int id = Integer.valueOf(theString).intValue();
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("permissoes", permissao.lista_permissoes_grupo(id));
		mav.setViewName("privado/permissao/listagem");
		return mav;
	}
	
	@RequestMapping(value="grupos.json")
	public ModelAndView grupos() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", permissao.lista_grupos());
		mav.setViewName("listagem_grupos");
		return mav;
	}
	
	@RequestMapping(value="permissoes.json")
	public ModelAndView permissoes() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", permissao.lista_permissoes());
		mav.setViewName("listagem_permissoes");
		return mav;
	}
	
	@RequestMapping(value="permissoes_grupo.json", method=RequestMethod.GET)
	public ModelAndView permissoes_grupo(@RequestParam("id") String id_grupo) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", permissao.lista_permissoes_grupo(Integer.valueOf(id_grupo).intValue()));
		mav.setViewName("listagem_permissoes");
		return mav;
	}
	
	@RequestMapping(value="permissoes_usuario.json", method=RequestMethod.GET)
	public ModelAndView permissoes_usuario(@RequestParam("id") String id_usuario) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", permissao.lista_permissoes_usuario(Integer.valueOf(id_usuario).intValue()));
		mav.setViewName("listagem_grupos");
		return mav;
	}
	
}
