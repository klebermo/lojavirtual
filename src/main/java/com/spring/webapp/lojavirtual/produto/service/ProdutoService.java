package com.spring.webapp.lojavirtual.produto.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.produto.persistence.ProdutoDao;

@Service
public class ProdutoService {
	
	@Autowired
	private ProdutoDao produto;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		return produto.persist(null);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		return produto.merge(null);
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		return produto.remove(null);
	}
}
