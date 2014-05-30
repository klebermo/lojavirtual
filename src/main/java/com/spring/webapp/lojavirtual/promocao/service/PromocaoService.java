package com.spring.webapp.lojavirtual.promocao.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.produto.persistence.ProdutoDao;
import com.spring.webapp.lojavirtual.promocao.persistence.PromocaoDao;
import com.spring.webapp.lojavirtual.promocao.persistence.model.Promocao;

@Service
public class PromocaoService {
	
	@Autowired
	private PromocaoDao promocao;
	
	@Autowired
	private ProdutoDao produto;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String id_produto = request.getParameter("produto");
		String desconto = request.getParameter("desconto");
		
		Promocao nova = new Promocao();
		
		if(id_produto != null)
			nova.setProduto(produto.findById(Integer.valueOf(id_produto).intValue()));
		else
			return false;
		
		if(desconto != null)
			nova.setDesconto(Float.valueOf(desconto).floatValue());
		else
			return false;
		
		return promocao.persist(nova);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		return false;
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		return false;
	}
		
	public List<Promocao> listagem() {
		return promocao.findAll();
	}
	
	public Promocao listagem(int id) {
		return promocao.findById(id);
	}
	
}
