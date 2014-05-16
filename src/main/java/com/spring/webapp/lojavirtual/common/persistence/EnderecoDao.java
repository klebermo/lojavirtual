package com.spring.webapp.lojavirtual.common.persistence;

import com.spring.webapp.lojavirtual.common.persistence.model.Endereco;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

public class EnderecoDao extends Dao<Endereco> {

	public EnderecoDao() {
		super(Endereco.class);
	}

}
