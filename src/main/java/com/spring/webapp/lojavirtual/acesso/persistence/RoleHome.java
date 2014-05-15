package com.spring.webapp.lojavirtual.acesso.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.acesso.persistence.model.Role;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

@Repository
public class RoleHome extends Dao<Role> {
	
	public RoleHome() {
		super(Role.class);
	}

	public RoleHome(Role entity) {
		super(entity);
	}

}
