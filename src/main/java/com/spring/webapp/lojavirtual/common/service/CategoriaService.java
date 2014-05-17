package com.spring.webapp.lojavirtual.common.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.common.persistence.CategoriaDao;

@Service
public class CategoriaService {
	
	@Autowired
	private CategoriaDao categoria;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		return categoria.persist(null);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		return categoria.merge(null);
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		return categoria.remove(null);
	}
}
