package com.spring.webapp.lojavirtual.materiaprima.persistence;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.model.DescricaoMateriaPrima;

public class DescricaoMateriaPrimaDao extends Dao<DescricaoMateriaPrima> {

	public DescricaoMateriaPrimaDao() {
		super(DescricaoMateriaPrima.class);
	}

}
