package com.spring.webapp.lojavirtual.fornecedor.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.fornecedor.persistence.FornecedorDao;

@Service
public class FornecedorService {
	
	@Autowired
	private FornecedorDao fornecedor;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		return fornecedor.persist(null);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		return fornecedor.merge(null);
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		return fornecedor.remove(null);
	}
}
