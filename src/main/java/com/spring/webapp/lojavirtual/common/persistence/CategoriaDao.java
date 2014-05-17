package com.spring.webapp.lojavirtual.common.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.common.persistence.model.Categoria;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

@Repository
public class CategoriaDao extends Dao<Categoria> {

	public CategoriaDao() {
		super(Categoria.class);
	}

}
