package com.spring.webapp.lojavirtual.fornecedor.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.common.persistence.ContatoDao;
import com.spring.webapp.lojavirtual.common.persistence.EnderecoDao;
import com.spring.webapp.lojavirtual.common.persistence.model.Contato;
import com.spring.webapp.lojavirtual.common.persistence.model.Endereco;
import com.spring.webapp.lojavirtual.fornecedor.persistence.FornecedorDao;
import com.spring.webapp.lojavirtual.fornecedor.persistence.model.Fornecedor;

@Service
public class FornecedorService {
	
	@Autowired
	private FornecedorDao fornecedor;
	
	@Autowired
	private EnderecoDao endereco;
	
	@Autowired
	private ContatoDao contato;
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'cadastra_fornecedor')")
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String identificador = request.getParameter("identificador");
		String nome = request.getParameter("nome");
		String website = request.getParameter("website");
		String[] endereco2 = request.getParameterValues("endereco[]");
		String[] contato2 = request.getParameterValues("contato[]");
		
		Fornecedor f = new Fornecedor();
		f.setRazao_social(nome);
		f.setWebsite(website);
		if(identificador.length() == 14)
			f.setCnpj(identificador);
		else if(identificador.length() == 11)
			f.setCpf(identificador);
		else
			return false;
		
		List<Endereco> lista_endereco = new ArrayList<Endereco>();
		if(endereco2 != null) {
			int max = endereco2.length;
			for(int i=0; i<max; i++) {
				int id = Integer.valueOf(endereco2[i]).intValue();
				lista_endereco.add(endereco.findById(id));
			}
			f.setEndereco(lista_endereco);
		}
		
		
		List<Contato> lista_contato = new ArrayList<Contato>();
		if(contato2 != null) {
			int max = contato2.length;
			for(int i=0; i<max; i++) {
				int id = Integer.valueOf(contato2[i]).intValue();
				lista_contato.add(contato.findById(id));
			}
			f.setContato(lista_contato);
		}
		
		return fornecedor.persist(f);
	}
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'altera_fornecedor')")
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String identificador = request.getParameter("identificador");
		String nome = request.getParameter("nome");
		String website = request.getParameter("website");
		String[] endereco2 = request.getParameterValues("endereco[]");
		String[] contato2 = request.getParameterValues("contato[]");
		
		Fornecedor f = fornecedor.findById(Integer.valueOf(id).intValue());
		f.setId(Integer.valueOf(id).intValue());
		f.setRazao_social(nome);
		f.setWebsite(website);
		if(identificador.length() == 14)
			f.setCnpj(identificador);
		else if(identificador.length() == 11)
			f.setCpf(identificador);
		else
			return false;
		
		List<Endereco> lista_endereco = new ArrayList<Endereco>();
		if(endereco2 != null) {
			int max = endereco2.length;
			for(int i=0; i<max; i++) {
				lista_endereco.add(endereco.findById(Integer.valueOf(endereco2[i]).intValue()));
			}
			f.setEndereco(lista_endereco);
		}
		
		
		List<Contato> lista_contato = new ArrayList<Contato>();
		if(contato2 != null) {
			int max = contato2.length;
			for(int i=0; i<max; i++) {
				lista_contato.add(contato.findById(Integer.valueOf(contato2[i]).intValue()));
			}
			f.setContato(lista_contato);
		}
		
		return fornecedor.merge(f);
	}
	
	@Transactional
	@PreAuthorize("hasPermission(#user, 'remove_fornecedor')")
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		int id_fornecedor = Integer.valueOf(id).intValue();
		return fornecedor.remove(fornecedor.findById(id_fornecedor));
	}
	
	@Transactional
	public List<Fornecedor> listagem() {
		return fornecedor.findAll();
	}
	
	@Transactional
	public Fornecedor listagem(int id) {
		return fornecedor.findById(id);
	}
}
