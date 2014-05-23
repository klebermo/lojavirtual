package com.spring.webapp.lojavirtual.common.controller;

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

import com.spring.webapp.lojavirtual.common.service.CategoriaService;

@Controller
@RequestMapping(value="categoria")
public class CategoriaController {
	
	@Autowired
	private CategoriaService categoria;
	
	@RequestMapping(value="cadastra")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/categoria/cadastra");
		return mav;
	}
	
	@RequestMapping(value="cadastra", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'cadastra_categoria')")
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(categoria.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera/{theString}")
	public ModelAndView altera(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoria", categoria.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/categoria/altera");
		return mav;
	}
	
	@RequestMapping(value="altera", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'altera_categoria')")
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(categoria.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove/{theString}")
	public ModelAndView remove(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("categoria", categoria.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/categoria/remove");
		return mav;
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'remove_categoria')")
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(categoria.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="listagem")
	public ModelAndView listagem() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/categoria/listagem");
		return mav;
	}
	
	@RequestMapping(value="listagem.json")
	public ModelAndView listagem_json() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", categoria.listagem());
		mav.setViewName("listagem_categoria");
		return mav;
	}
	
}
