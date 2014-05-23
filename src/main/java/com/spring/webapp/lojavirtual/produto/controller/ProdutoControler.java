package com.spring.webapp.lojavirtual.produto.controller;

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

import com.spring.webapp.lojavirtual.produto.service.ProdutoService;

@Controller
@RequestMapping(value="produto")
public class ProdutoControler {
	
	@Autowired
	private ProdutoService produto;
	
	@RequestMapping(value="cadastra")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/produto/cadastra");
		return mav;
	}
	
	@RequestMapping(value="cadastra", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'cadastra_produto')")
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(produto.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera/{theString}")
	public ModelAndView altera(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("produto", produto.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/produto/altera");
		return mav;
	}
	
	@RequestMapping(value="altera", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'altera_produto')")
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(produto.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove/{theString}")
	public ModelAndView remove(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("produto", produto.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/produto/remove");
		return mav;
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'remove_produto')")
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(produto.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="listagem")
	public ModelAndView listagem() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/produto/listagem");
		return mav;
	}
	
	@RequestMapping(value="listagem.json")
	public ModelAndView listagem_json() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", produto.listagem());
		mav.setViewName("listagem_produto");
		return mav;
	}
	
}
