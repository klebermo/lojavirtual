package com.spring.webapp.lojavirtual.fornecedor.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.webapp.lojavirtual.fornecedor.service.FornecedorService;

@Controller
@RequestMapping(value="fornecedor")
public class FornecedorController {
	
	@Autowired
	private FornecedorService fornecedor;
	
	@RequestMapping(value="cadastra.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'cadastra_fornecedor')")
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(fornecedor.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'altera_fornecedor')")
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(fornecedor.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'remove_fornecedor')")
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(fornecedor.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
}
