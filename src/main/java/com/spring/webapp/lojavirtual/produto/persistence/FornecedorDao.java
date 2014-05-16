package com.spring.webapp.lojavirtual.produto.persistence;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.produto.persistence.model.Fornecedor;

public class FornecedorDao extends Dao<Fornecedor> {

	public FornecedorDao() {
		super(Fornecedor.class);
	}

}
