package com.spring.webapp.lojavirtual.produto.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'cadastra_produto')")
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		String category = request.getParameter("categoria");
		String[] materia_prima = request.getParameterValues("materia_prima[]");
		
		Produto novo = new Produto();
		novo.setNome(nome);
		
		if(descricao != null)
			novo.setDescricao(descricao);
		
		if(category != null)
			novo.setCategoria(categoria.findById(Integer.valueOf(category).intValue()));
		
		if(materia_prima != null) {
			List<MateriaPrima> lista = new ArrayList<MateriaPrima>();
			for(int i=0; i<materia_prima.length; i++) {
				lista.add(materiaPrima.findById(Integer.valueOf(materia_prima[i]).intValue()));
			}
			novo.setMateriaPrima(lista);
		}
		
		return produto.persist(novo);
	}
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'altera_produto')")
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		String category = request.getParameter("categoria");
		
		Produto novo = produto.findById(Integer.valueOf(id).intValue());
		novo.setNome(nome);
		
		if(descricao != null)
			novo.setDescricao(descricao);
		
		if(category != null)
			novo.setCategoria(categoria.findById(Integer.valueOf(category).intValue()));
				
		return produto.persist(novo);
	}
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'remove_produto')")
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int id_produto = Integer.valueOf(id).intValue();
		
		Produto remover = produto.findById(id_produto);
		remover.setCategoria(null);
		remover.setMateriaPrima(null);
		
		return produto.remove(remover);
	}
	
	@Transactional
	public List<Produto> listagem() {
		return produto.findAll();
	}
	
	@Transactional
	public Produto listagem(int id) {
		return produto.findById(id);
	}
	
	@Transactional
	public List<Produto> listagem_por_categoria(String id_categoria) {
		return produto.findByField("categoria", id_categoria);
	}
}
