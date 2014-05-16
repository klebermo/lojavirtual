package com.spring.webapp.lojavirtual.produto.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.webapp.lojavirtual.produto.service.ProdutoService;

@Controller
@RequestMapping(value="produto")
public class ProdutoControler {
	
	@Autowired
	private ProdutoService produto;
	
	@RequestMapping(value="cadastra.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'cadastra_produto')")
	public String cadastra(HttpServletRequest request, HttpServletResponse response) {
		if(produto.cadastra(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="altera.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'altera_produto')")
	public String altera(HttpServletRequest request, HttpServletResponse response) {
		if(produto.altera(request, response))
			return "yes";
		else
			return "not";
	}
	
	@RequestMapping(value="remove.htm", method=RequestMethod.POST)
	@ResponseBody
	@PreAuthorize("hasPermission(#user, 'remove_produto')")
	public String remove(HttpServletRequest request, HttpServletResponse response) {
		if(produto.remove(request, response))
			return "yes";
		else
			return "not";
	}
	
}
