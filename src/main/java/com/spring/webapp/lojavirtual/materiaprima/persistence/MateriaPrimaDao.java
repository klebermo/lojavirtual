package com.spring.webapp.lojavirtual.materiaprima.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.model.MateriaPrima;

@Repository
public class MateriaPrimaDao extends Dao<MateriaPrima> {

	public MateriaPrimaDao() {
		super(MateriaPrima.class);
	}

}
