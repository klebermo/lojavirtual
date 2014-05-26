package com.spring.webapp.lojavirtual.common.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.common.persistence.EnderecoDao;
import com.spring.webapp.lojavirtual.common.persistence.model.Endereco;

@Service
public class EnderecoService {
	
	@Autowired
	private EnderecoDao endereco;
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'cadastra_endereco')")
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String logradouro = request.getParameter("logradouro");
		String numero = request.getParameter("numero");
		String complemento = request.getParameter("complemento");
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String estado = request.getParameter("estado");
		String cep = request.getParameter("cep");
		
		Endereco novo = new Endereco();
		novo.setLogradouro(logradouro);
		novo.setNumero(numero);
		novo.setComplemento(complemento);
		novo.setBairro(bairro);
		novo.setCidade(cidade);
		novo.setEstado(estado);
		novo.setCep(cep);
		
		return endereco.persist(novo);
	}
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'altera_endereco')")
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String logradouro = request.getParameter("logradouro");
		String numero = request.getParameter("numero");
		String complemento = request.getParameter("complemento");
		String bairro = request.getParameter("bairro");
		String cidade = request.getParameter("cidade");
		String estado = request.getParameter("estado");
		String cep = request.getParameter("cep");
		
		Endereco novo = endereco.findById(Integer.valueOf(id).intValue());
		novo.setLogradouro(logradouro);
		novo.setNumero(numero);
		novo.setComplemento(complemento);
		novo.setBairro(bairro);
		novo.setCidade(cidade);
		novo.setEstado(estado);
		novo.setCep(cep);
		
		return endereco.persist(novo);
	}
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'remove_endereco')")
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		return endereco.remove(endereco.findById(Integer.valueOf(id).intValue()));
	}
	
	@Transactional
	public List<Endereco> listagem() {
		return endereco.findAll();
	}
	
	@Transactional
	public Endereco listagem(int id) {
		return endereco.findById(id);
	}
}
