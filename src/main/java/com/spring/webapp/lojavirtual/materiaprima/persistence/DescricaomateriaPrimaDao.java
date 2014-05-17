package com.spring.webapp.lojavirtual.materiaprima.persistence;

import com.spring.webapp.lojavirtual.config.hibernate.Dao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.model.DescricaoMateriaPrima;

public class DescricaomateriaPrimaDao extends Dao<DescricaoMateriaPrima> {

	public DescricaomateriaPrimaDao() {
		super(DescricaoMateriaPrima.class);
	}

}
