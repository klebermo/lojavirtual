package com.spring.webapp.lojavirtual.common.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.common.persistence.ContatoDao;

@Service
public class ContatoService {
	
	@Autowired
	private ContatoDao contato;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		return contato.persist(null);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		return contato.merge(null);
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		return contato.remove(null);
	}
}
