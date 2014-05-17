package com.spring.webapp.lojavirtual.materiaprima.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.materiaprima.persistence.MateriaPrimaDao;

@Service
public class MateriaPrimaService {
	
	@Autowired
	private MateriaPrimaDao materiaPrima;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		return materiaPrima.persist(null);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		return materiaPrima.merge(null);
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		return materiaPrima.remove(null);
	}
}
