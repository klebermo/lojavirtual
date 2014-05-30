package com.spring.webapp.lojavirtual.acesso.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.acesso.persistence.UsuarioHome;
import com.spring.webapp.lojavirtual.acesso.persistence.model.Usuario;

@Service
public class PrivadoService {
	
	@Autowired
	private UsuarioHome usuario;
	
	public Usuario loadUsuarioByUsername(String username) {
		return usuario.findByField("login", username).get(0);
	}
	
	public Usuario loadUsuarioById(int id) {
		return usuario.findById(id);
	}
}
