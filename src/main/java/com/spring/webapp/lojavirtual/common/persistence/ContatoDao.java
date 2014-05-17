package com.spring.webapp.lojavirtual.common.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.common.persistence.model.Contato;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

@Repository
public class ContatoDao extends Dao<Contato> {

	public ContatoDao() {
		super(Contato.class);
	}

}
