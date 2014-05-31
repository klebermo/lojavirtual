package com.spring.webapp.lojavirtual.destaque.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.webapp.lojavirtual.destaque.service.DestaqueService;
import com.spring.webapp.lojavirtual.produto.service.ProdutoService;

@Controller
@RequestMapping(value="destaque")
public class DestaqueController {
	
	@Autowired
	private DestaqueService destaque;
	
	@Autowired
	private ProdutoService produto;
	
	@RequestMapping(value="cadastra", method=RequestMethod.POST)
	@ResponseBody
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(destaque.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="cadastra")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/destaque/cadastra");
		return mav;
	}
	
	@RequestMapping(value="altera", method=RequestMethod.POST)
	@ResponseBody
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(destaque.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera/{theString}")
	public ModelAndView altera(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("destaque", destaque.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/destaque/altera");
		return mav;
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	@ResponseBody
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(destaque.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove/{theString}")
	public ModelAndView remove(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("destaque", destaque.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/destaque/remove");
		return mav;
	}
	
	@RequestMapping(value="listagem")
	public ModelAndView listagem() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/destaque/listagem");
		return mav;
	}
	
	@RequestMapping(value="listagem.json", method=RequestMethod.GET)
	public ModelAndView listagem_destaque(HttpServletRequest request, HttpServletResponse response) {
		String id_categoria = request.getParameter("id");
		ModelAndView mav = new ModelAndView();
		
		if(id_categoria == null) {
			mav.addObject("lista", destaque.listagem());
			mav.setViewName("listagem_destaque");
		}
		else {
			mav.addObject("lista", produto.listagem_por_categoria(Integer.valueOf(id_categoria)));
			mav.setViewName("listagem_produto");
		}
		
		return mav;
	}
	
}
