package com.spring.webapp.lojavirtual.acl.persistence.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name="acl_entry")
public class ACL_ENTRY {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	@OneToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@JoinColumn(name="fk_acl_identity")
	@Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
	private ACL_OBJECT_IDENTITY acl_object_identity;
	
	@OneToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@JoinColumn(name="fk_acl_sid")
	@Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
	private ACL_SID recipient;
	
	@Column(name = "audit")
	private boolean audit;
	
	@Column(name = "bitmask")
	private int bitmask;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ACL_OBJECT_IDENTITY getAcl_object_identity() {
		return acl_object_identity;
	}

	public void setAcl_object_identity(ACL_OBJECT_IDENTITY acl_object_identity) {
		this.acl_object_identity = acl_object_identity;
	}

	public ACL_SID getRecipient() {
		return recipient;
	}

	public void setRecipient(ACL_SID recipient) {
		this.recipient = recipient;
	}

	public int getBitmask() {
		return bitmask;
	}

	public void setBitmask(int bitmask) {
		this.bitmask = bitmask;
	}

	public boolean isAudit() {
		return audit;
	}

	public void setAudit(boolean audit) {
		this.audit = audit;
	}
	
}
