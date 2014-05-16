package com.spring.webapp.lojavirtual.acesso.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.acesso.persistence.UsuarioHome;

@Service
public class UsuarioService {
	
	@Autowired
	private UsuarioHome usuario;
	
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		return usuario.persist(null);
	}
	
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		return usuario.merge(null);
	}
	
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		return usuario.remove(null);
	}
}
