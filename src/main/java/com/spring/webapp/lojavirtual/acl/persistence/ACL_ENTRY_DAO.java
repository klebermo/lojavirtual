package com.spring.webapp.lojavirtual.acl.persistence;

import com.spring.webapp.lojavirtual.acl.persistence.model.ACL_ENTRY;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

public class ACL_ENTRY_DAO extends Dao<ACL_ENTRY> {

	public ACL_ENTRY_DAO() {
		super(ACL_ENTRY.class);
	}

}
