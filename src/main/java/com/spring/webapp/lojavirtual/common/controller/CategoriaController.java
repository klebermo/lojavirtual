package com.spring.webapp.lojavirtual.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.webapp.lojavirtual.common.service.CategoriaService;

@Controller
@RequestMapping(value="categoria")
public class CategoriaController {
	
	@Autowired
	private CategoriaService categoria;
	
	@RequestMapping(value="cadastra.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'cadastra_categoria')")
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(categoria.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'altera_categoria')")
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(categoria.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'remove_categoria')")
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(categoria.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
}
