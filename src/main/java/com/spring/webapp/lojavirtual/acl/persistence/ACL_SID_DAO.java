package com.spring.webapp.lojavirtual.acl.persistence;

import org.springframework.stereotype.Repository;

import com.spring.webapp.lojavirtual.acl.persistence.model.ACL_SID;
import com.spring.webapp.lojavirtual.config.hibernate.Dao;

@Repository
public class ACL_SID_DAO extends Dao<ACL_SID> {

	public ACL_SID_DAO() {
		super(ACL_SID.class);
	}

}
