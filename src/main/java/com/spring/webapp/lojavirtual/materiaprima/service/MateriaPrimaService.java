package com.spring.webapp.lojavirtual.materiaprima.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.materiaprima.persistence.MateriaPrimaDao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.model.MateriaPrima;

@Service
public class MateriaPrimaService {
	
	@Autowired
	private MateriaPrimaDao materiaPrima;
	
	@Transactional
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		return materiaPrima.persist(null);
	}
	
	@Transactional
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		return materiaPrima.merge(null);
	}
	
	@Transactional
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		return materiaPrima.remove(null);
	}
	
	@Transactional
	public List<MateriaPrima> listagem() {
		return materiaPrima.findAll();
	}
	
	@Transactional
	public MateriaPrima listagem(int id) {
		return materiaPrima.findById(id);
	}
}
