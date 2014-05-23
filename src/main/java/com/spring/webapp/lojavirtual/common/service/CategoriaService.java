package com.spring.webapp.lojavirtual.common.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.common.persistence.CategoriaDao;
import com.spring.webapp.lojavirtual.common.persistence.model.Categoria;

@Service
public class CategoriaService {
	
	@Autowired
	private CategoriaDao categoria;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String nome = request.getParameter("nome");
		
		Categoria novo = new Categoria();
		novo.setNome(nome);
		
		return categoria.persist(novo);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		String nome = request.getParameter("nome");
		
		Categoria novo = new Categoria();
		novo.setNome(nome);
		
		return categoria.merge(novo);
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int id_categoria = Integer.valueOf(id).intValue();
		return categoria.remove(categoria.findById(id_categoria));
	}
	
	public List<Categoria> listagem() {
		return categoria.findAll();
	}
	
	public Categoria listagem(int id) {
		return categoria.findById(id);
	}
}
