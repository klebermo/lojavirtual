package com.spring.webapp.lojavirtual.acl.persistence;

import com.spring.webapp.lojavirtual.acl.persistence.model.ACL_OBJECT_IDENTITY;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

public class ACL_OBJECT_ENTITY_DAO extends Dao<ACL_OBJECT_IDENTITY> {

	public ACL_OBJECT_ENTITY_DAO() {
		super(ACL_OBJECT_IDENTITY.class);
	}

}
