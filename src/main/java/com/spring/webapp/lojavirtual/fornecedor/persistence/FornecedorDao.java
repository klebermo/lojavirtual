package com.spring.webapp.lojavirtual.fornecedor.persistence;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.fornecedor.persistence.model.Fornecedor;

public class FornecedorDao extends Dao<Fornecedor> {

	public FornecedorDao() {
		super(Fornecedor.class);
	}

}
