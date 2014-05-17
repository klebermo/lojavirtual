package com.spring.webapp.lojavirtual.common.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.common.persistence.EnderecoDao;

@Service
public class EnderecoService {
	
	@Autowired
	private EnderecoDao endereco;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		return endereco.persist(null);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		return endereco.merge(null);
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		return endereco.remove(null);
	}
}
