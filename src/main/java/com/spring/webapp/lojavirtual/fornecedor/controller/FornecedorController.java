package com.spring.webapp.lojavirtual.fornecedor.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.webapp.lojavirtual.fornecedor.service.FornecedorService;

@Controller
@RequestMapping(value="fornecedor")
public class FornecedorController {
	
	@Autowired
	private FornecedorService fornecedor;
	
	@RequestMapping(value="cadastra", method=RequestMethod.POST)
	@ResponseBody
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(fornecedor.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="cadastra")
	@PreAuthorize("hasPermission(#user, 'cadastra_fornecedor')")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/fornecedor/cadastra");
		return mav;
	}
	
	@RequestMapping(value="altera", method=RequestMethod.POST)
	@ResponseBody
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(fornecedor.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera")
	@PreAuthorize("hasPermission(#user, 'altera_fornecedor')")
	public ModelAndView altera() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/fornecedor/altera");
		return mav;
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'remove_fornecedor')")
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(fornecedor.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove")
	@PreAuthorize("hasPermission(#user, 'remove_fornecedor')")
	public ModelAndView remove() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/fornecedor/cadastra");
		return mav;
	}
	
	@RequestMapping(value="cadastra")
	public ModelAndView listagem() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/fornecedor/cadastra");
		return mav;
	}
	
	@RequestMapping(value="listagem.json")
	public ModelAndView listagem_json() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("listagem_fornecedor");
		return mav;
	}
	
	@RequestMapping(value="endereco.json")
	public ModelAndView listagem_endereco_json() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("listagem_endereco");
		return mav;
	}
	
	@RequestMapping(value="contato.json")
	public ModelAndView listagem_contato_json() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("listagem_contato");
		return mav;
	}
	
}
