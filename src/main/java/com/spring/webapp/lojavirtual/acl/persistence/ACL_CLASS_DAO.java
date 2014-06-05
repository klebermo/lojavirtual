package com.spring.webapp.lojavirtual.acl.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.acl.persistence.model.ACL_CLASS;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

@Repository
public class ACL_CLASS_DAO extends Dao<ACL_CLASS> {

	public ACL_CLASS_DAO() {
		super(ACL_CLASS.class);
	}

}
