package com.spring.webapp.lojavirtual.materiaprima.persistence;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.model.QuantidadeMateriaPrima;

public class QuantidadeMateriaPrimaDao extends Dao<QuantidadeMateriaPrima> {

	public QuantidadeMateriaPrimaDao() {
		super(QuantidadeMateriaPrima.class);
	}

}
