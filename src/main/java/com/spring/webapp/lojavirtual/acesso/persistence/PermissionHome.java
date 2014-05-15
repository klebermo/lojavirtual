package com.spring.webapp.lojavirtual.acesso.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.acesso.persistence.model.Permission;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

@Repository
public class PermissionHome extends Dao<Permission> {
	
	public PermissionHome() {
		super(Permission.class);
	}

	public PermissionHome(Permission entity) {
		super(entity);
	}

}
