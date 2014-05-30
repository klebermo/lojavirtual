package com.spring.webapp.lojavirtual.destaque.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.common.persistence.CategoriaDao;
import com.spring.webapp.lojavirtual.destaque.persistence.DestaqueDao;
import com.spring.webapp.lojavirtual.destaque.persistence.model.Destaque;
import com.spring.webapp.lojavirtual.produto.persistence.ProdutoDao;

@Service
public class DestaqueService {
	
	@Autowired
	private DestaqueDao destaque;
	
	@Autowired
	private CategoriaDao categoria;
	
	@Autowired
	private ProdutoDao produto;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String id_categoria = request.getParameter("categoria");
		String produtos[] = request.getParameterValues("produtos[]");
		
		Destaque novo = new Destaque();
		
		if(id_categoria != null)
			novo.setCategoria(categoria.findById(Integer.valueOf(id_categoria).intValue()));
		
		if(produtos != null) {
			int max = produtos.length;
			for(int i=0; i<max; i++)
				novo.getProdutos().add(produto.findById(Integer.valueOf(produtos[i]).intValue()));
		}
		else {
			return false;
		}
			
		return destaque.persist(novo);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String id_categoria = request.getParameter("categoria");
		String produtos[] = request.getParameterValues("produtos[]");
		
		Destaque novo = destaque.findById(Integer.valueOf(id).intValue());
		
		if(id_categoria != null)
			novo.setCategoria(categoria.findById(Integer.valueOf(id_categoria).intValue()));
		
		if(produtos != null) {
			int max = produtos.length;
			for(int i=0; i<max; i++)
				novo.getProdutos().add(produto.findById(Integer.valueOf(produtos[i]).intValue()));
		}
			
		return destaque.merge(novo);
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		return destaque.remove(destaque.findById(Integer.valueOf(id).intValue()));
	}
	
	public List<Destaque> listagem() {
		return destaque.findAll();
	}
	
	public Destaque listagem(int id) {
		return destaque.findById(id);
	}
	
}
