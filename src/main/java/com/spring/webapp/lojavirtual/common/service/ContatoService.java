package com.spring.webapp.lojavirtual.common.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.common.persistence.ContatoDao;
import com.spring.webapp.lojavirtual.common.persistence.model.Contato;

@Service
public class ContatoService {
	
	@Autowired
	private ContatoDao contato;
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'cadastra_contato')")
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String telefone = request.getParameter("telefone");
		
		Contato novo = new Contato();
		novo.setNome(nome);
		novo.setEmail(email);
		novo.setTelefone(telefone);
		
		return contato.persist(novo);
	}
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'altera_contato')")
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String telefone = request.getParameter("telefone");
		
		Contato novo = contato.findById(Integer.valueOf(id).intValue());
		novo.setNome(nome);
		novo.setEmail(email);
		novo.setTelefone(telefone);
		
		return contato.merge(novo);
	}
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'remove_contato')")
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		return contato.remove(contato.findById(Integer.valueOf(id).intValue()));
	}
	
	@Transactional
	public List<Contato> listagem() {
		return contato.findAll();
	}
	
	@Transactional
	public Contato listagem(int id) {
		return contato.findById(id);
	}
}
