package com.spring.webapp.lojavirtual.promocao.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.promocao.persistence.model.Promocao;

@Repository
public class PromocaoDao extends Dao<Promocao> {

	public PromocaoDao() {
		super(Promocao.class);
	}

}
