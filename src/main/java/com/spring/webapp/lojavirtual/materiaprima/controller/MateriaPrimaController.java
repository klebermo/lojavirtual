package com.spring.webapp.lojavirtual.materiaprima.controller;

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

import com.spring.webapp.lojavirtual.materiaprima.service.MateriaPrimaService;

@Controller
@RequestMapping(value="materia_prima")
public class MateriaPrimaController {
	
	@Autowired
	private MateriaPrimaService materiaPrima;
	
	@RequestMapping(value="cadastra")
	@PreAuthorize("hasPermission(#user, 'cadastra_materia_prima')")
	public ModelAndView cadastra() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/materia_prima/cadastra");
		return mav;
	}
	
	@RequestMapping(value="cadastra", method=RequestMethod.POST)
	@ResponseBody
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(materiaPrima.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera/{theString}")
	@PreAuthorize("hasPermission(#user, 'altera_materia_prima')")
	public ModelAndView altera(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("materia_prima", materiaPrima.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/materia_prima/altera");
		return mav;
	}
	
	@RequestMapping(value="altera", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'altera_materia_prima')")
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(materiaPrima.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove/{theString}")
	@PreAuthorize("hasPermission(#user, 'altera_materia_prima')")
	public ModelAndView remove(@PathVariable String theString) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("materia_prima", materiaPrima.listagem(Integer.valueOf(theString).intValue()));
		mav.setViewName("privado/materia_prima/remove");
		return mav;
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'remove_materia_prima')")
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(materiaPrima.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="listagem")
	public ModelAndView listagem() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("privado/materia_prima/listagem");
		return mav;
	}
	
	@RequestMapping(value="listagem.json")
	public ModelAndView listagem_json() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("lista", materiaPrima.listagem());
		mav.setViewName("listagem_materia_prima");
		return mav;
	}
	
}
