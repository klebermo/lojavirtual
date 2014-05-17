package com.spring.webapp.lojavirtual.acesso.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.acesso.persistence.model.Permissao;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

@Repository
public class PermissaoHome extends Dao<Permissao> {
	
	public PermissaoHome() {
		super(Permissao.class);
	}

}
