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
@Table(name="acl_object_identity")
public class ACL_OBJECT_IDENTITY {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	@OneToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@JoinColumn(name="fk_acl_class")
	@Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
	private ACL_CLASS fk_acl_class;
	
	@Column(name = "id_acl_class")
	private Integer id_acl_class;
	
	@OneToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@JoinColumn(name="parent")
	@Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
	private ACL_OBJECT_IDENTITY parent;
	
	@OneToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@JoinColumn(name="owner")
	@Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
	private ACL_SID owner;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public ACL_CLASS getFk_acl_class() {
		return fk_acl_class;
	}

	public void setFk_acl_class(ACL_CLASS fk_acl_class) {
		this.fk_acl_class = fk_acl_class;
	}

	public Integer getId_acl_class() {
		return id_acl_class;
	}

	public void setId_acl_class(Integer id_acl_class) {
		this.id_acl_class = id_acl_class;
	}

	public ACL_OBJECT_IDENTITY getParent() {
		return parent;
	}

	public void setParent(ACL_OBJECT_IDENTITY parent) {
		this.parent = parent;
	}

	public ACL_SID getOwner() {
		return owner;
	}

	public void setOwner(ACL_SID owner) {
		this.owner = owner;
	}
	
}
