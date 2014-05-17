package com.spring.webapp.lojavirtual.common.persistence;

import com.spring.webapp.lojavirtual.common.persistence.model.Unidade;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

public class UnidadeDao extends Dao<Unidade> {

	public UnidadeDao() {
		super(Unidade.class);
	}

}
