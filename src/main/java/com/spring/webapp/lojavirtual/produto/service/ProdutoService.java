package com.spring.webapp.lojavirtual.produto.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.common.persistence.CategoriaDao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.MateriaPrimaDao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.model.MateriaPrima;
import com.spring.webapp.lojavirtual.produto.persistence.ProdutoDao;
import com.spring.webapp.lojavirtual.produto.persistence.model.Produto;

@Service
public class ProdutoService {
	
	@Autowired
	private ProdutoDao produto;
	
	@Autowired
	private CategoriaDao categoria;
	
	@Autowired
	private MateriaPrimaDao materiaPrima;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		String category = request.getParameter("categoria");
		String[] materia_prima = request.getParameterValues("materia_prima[]");
		
		Produto novo = new Produto();
		novo.setNome(nome);
		novo.setDescricao(descricao);
		novo.setCategoria(categoria.findById(Integer.valueOf(category).intValue()));
		
		List<MateriaPrima> lista = new ArrayList<MateriaPrima>();
		for(int i=0; i<materia_prima.length; i++) {
			lista.add(materiaPrima.findById(Integer.valueOf(materia_prima[i]).intValue()));
		}
		novo.setMateriaPrima(lista);
		
		return produto.persist(novo);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		String category = request.getParameter("categoria");
		
		Produto novo = new Produto();
		novo.setNome(nome);
		novo.setDescricao(descricao);
		novo.setCategoria(categoria.findById(Integer.valueOf(category).intValue()));
				
		return produto.persist(novo);
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id_produto");
		int id_produto = Integer.valueOf(id).intValue();
		return produto.remove(produto.findById(id_produto));
	}
	
	public List<Produto> listagem() {
		return produto.findAll();
	}
	
	public Produto listagem(int id) {
		return produto.findById(id);
	}
}
