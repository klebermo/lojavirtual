package com.spring.webapp.lojavirtual.common.persistence;

import com.spring.webapp.lojavirtual.common.persistence.model.Contato;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

public class ContatoDao extends Dao<Contato> {

	public ContatoDao() {
		super(Contato.class);
	}

}
