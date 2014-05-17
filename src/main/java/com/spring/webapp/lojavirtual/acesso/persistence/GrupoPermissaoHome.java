package com.spring.webapp.lojavirtual.acesso.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.acesso.persistence.model.GrupoPermissao;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

@Repository
public class GrupoPermissaoHome extends Dao<GrupoPermissao> {
	
	public GrupoPermissaoHome() {
		super(GrupoPermissao.class);
	}

}
