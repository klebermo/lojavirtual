package com.spring.webapp.lojavirtual.fornecedor.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.fornecedor.persistence.model.Fornecedor;

@Repository
public class FornecedorDao extends Dao<Fornecedor> {

	public FornecedorDao() {
		super(Fornecedor.class);
	}

}
