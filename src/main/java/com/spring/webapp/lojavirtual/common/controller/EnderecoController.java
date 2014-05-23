package com.spring.webapp.lojavirtual.common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.webapp.lojavirtual.common.service.EnderecoService;

@Controller
@RequestMapping(value="endereco")
public class EnderecoController {
	
	@Autowired
	private EnderecoService endereco;
	
	@RequestMapping(value="cadastra", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'cadastra_endereco')")
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(endereco.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'altera_endereco')")
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(endereco.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'remove_endereco')")
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(endereco.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
}
