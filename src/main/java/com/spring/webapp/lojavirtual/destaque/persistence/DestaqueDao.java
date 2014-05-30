package com.spring.webapp.lojavirtual.destaque.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.destaque.persistence.model.Destaque;

@Repository
public class DestaqueDao extends Dao<Destaque> {

	public DestaqueDao() {
		super(Destaque.class);
	}

}
