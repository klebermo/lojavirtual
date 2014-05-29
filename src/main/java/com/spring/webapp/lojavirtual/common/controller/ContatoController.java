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

import com.spring.webapp.lojavirtual.common.service.ContatoService;

@Controller
@RequestMapping(value="contato")
public class ContatoController {
	
	@Autowired
	private ContatoService contato;
	
	@RequestMapping(value="cadastra", method=RequestMethod.POST)
	@ResponseBody
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(contato.cadastra(request, response))
			return "done";
		else
			return "fail";
	}
	
	@RequestMapping(value="cadastra")
	@PreAuthorize("hasPermission(#user, 'cadastra_contato')")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/contato/cadastra");
		return mav;
	}
	
	@RequestMapping(value="altera", method=RequestMethod.POST)
	@ResponseBody
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(contato.altera(request, response))
			return "done";
		else
			return "fail";
	}
	
	@RequestMapping(value="altera/{theString}")
	@PreAuthorize("hasPermission(#user, 'altera_contato')")
	public ModelAndView altera(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contato", contato.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/contato/altera");
		return mav;
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	@ResponseBody
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(contato.remove(request, response))
			return "done";
		else
			return "fail";
	}
	
	@RequestMapping(value="remove/{theString}")
	@PreAuthorize("hasPermission(#user, 'remove_contato')")
	public ModelAndView remove(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contato", contato.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/contato/remove");
		return mav;
	}
	
	@RequestMapping(value="listagem")
	public ModelAndView listagem() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/contato/listagem");
		return mav;
	}
	
	@RequestMapping(value="listagem.json")
	public ModelAndView listagem_json() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("contato", contato.listagem());
		mav.setViewName("listagem_contato");
		return mav;
	}
	
}
