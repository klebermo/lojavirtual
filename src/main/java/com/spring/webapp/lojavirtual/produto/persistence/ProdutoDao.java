package com.spring.webapp.lojavirtual.produto.persistence;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.produto.persistence.model.Produto;

public class ProdutoDao extends Dao<Produto> {

	public ProdutoDao() {
		super(Produto.class);
	}

}
