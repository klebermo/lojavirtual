package com.spring.webapp.lojavirtual.produto.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.produto.persistence.model.Produto;

@Repository
public class ProdutoDao extends Dao<Produto> {

	public ProdutoDao() {
		super(Produto.class);
	}

}
