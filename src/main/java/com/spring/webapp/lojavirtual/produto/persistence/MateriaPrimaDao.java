package com.spring.webapp.lojavirtual.produto.persistence;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.produto.persistence.model.MateriaPrima;

public class MateriaPrimaDao extends Dao<MateriaPrima> {

	public MateriaPrimaDao() {
		super(MateriaPrima.class);
	}

}
