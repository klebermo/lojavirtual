package com.spring.webapp.lojavirtual.common.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.common.persistence.ContatoDao;
import com.spring.webapp.lojavirtual.common.persistence.model.Contato;
import com.spring.webapp.lojavirtual.fornecedor.persistence.FornecedorDao;
import com.spring.webapp.lojavirtual.fornecedor.persistence.model.Fornecedor;

@Service
public class ContatoService {
	
	@Autowired
	private FornecedorDao fornecedor;
	
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
	
	public List<Contato> listagem(int id_fornecedor) {
		Fornecedor f = fornecedor.findById(id_fornecedor);
		return f.getContato();
	}
	
	public Contato getContato(int id) {
		return contato.findById(id);
	}
}
