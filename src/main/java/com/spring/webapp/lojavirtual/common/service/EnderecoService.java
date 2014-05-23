package com.spring.webapp.lojavirtual.common.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.common.persistence.EnderecoDao;
import com.spring.webapp.lojavirtual.common.persistence.model.Endereco;
import com.spring.webapp.lojavirtual.fornecedor.persistence.FornecedorDao;
import com.spring.webapp.lojavirtual.fornecedor.persistence.model.Fornecedor;

@Service
public class EnderecoService {
	
	@Autowired
	private FornecedorDao fornecedor;
	
	@Autowired
	private EnderecoDao endereco;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		return endereco.persist(null);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		return endereco.merge(null);
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		return endereco.remove(null);
	}
	
	public List<Endereco> listagem(int id_fornecedor) {
		Fornecedor f = fornecedor.findById(id_fornecedor); 
		return f.getEndereco();
	}
	
	public Endereco getEndereco(int id) {
		return endereco.findById(id);
	}
}
