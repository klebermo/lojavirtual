package com.spring.webapp.lojavirtual.materiaprima.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.webapp.lojavirtual.materiaprima.service.MateriaPrimaService;

@Controller
@RequestMapping(value="materia_prima")
public class MateriaPrimaController {
	
	@Autowired
	private MateriaPrimaService materiaPrima;
	
	@RequestMapping(value="cadastra", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'cadastra_materia_prima')")
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(materiaPrima.cadastra(request, response))
			return "yes";
		else
			return "not";
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
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'remove_materia_prima')")
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(materiaPrima.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
}
