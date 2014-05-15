package com.spring.webapp.lojavirtual.acesso.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.acesso.persistence.model.Usuario;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

@Repository
public class UsuarioHome extends Dao<Usuario> {
	
	public UsuarioHome() {
		super(Usuario.class);
	}

	public UsuarioHome(Usuario entity) {
		super(entity);
	}
	
}
