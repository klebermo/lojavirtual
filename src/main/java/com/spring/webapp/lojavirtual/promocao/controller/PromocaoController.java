package com.spring.webapp.lojavirtual.promocao.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.webapp.lojavirtual.promocao.service.PromocaoService;

@Controller
@RequestMapping(value="promocao")
public class PromocaoController {
	
	@Autowired
	private PromocaoService promocao;
	
	@RequestMapping(value="cadastra", method=RequestMethod.POST)
	@ResponseBody
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		return "";
	}
	
	@RequestMapping(value="cadastra")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/promocao/cadastra");
		return mav;
	}
	
	@RequestMapping(value="altera", method=RequestMethod.POST)
	@ResponseBody
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		return "";
	}
	
	@RequestMapping(value="altera/{theString}")
	public ModelAndView altera(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("promocao", promocao.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/promocao/altera");
		return mav;
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	@ResponseBody
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		return "";
	}
	
	@RequestMapping(value="remove/{theString}")
	public ModelAndView remove(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("promocao", promocao.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/Promocao/remove");
		return mav;
	}
	
	@RequestMapping(value="listagem")
	public ModelAndView listagem() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/promocao/cadastra");
		return mav;
	}
	
	@RequestMapping(value="listagem.json", method=RequestMethod.GET)
	public ModelAndView listagem_Promocao(@RequestParam("id") String id_categoria) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", promocao.listagem(id_categoria));
		mav.setViewName("listagem_promocao.json");
		return mav;
	}
	
}
