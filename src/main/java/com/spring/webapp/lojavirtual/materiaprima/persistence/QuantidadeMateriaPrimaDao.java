package com.spring.webapp.lojavirtual.materiaprima.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.model.QuantidadeMateriaPrima;

@Repository
public class QuantidadeMateriaPrimaDao extends Dao<QuantidadeMateriaPrima> {

	public QuantidadeMateriaPrimaDao() {
		super(QuantidadeMateriaPrima.class);
	}

}
