package com.spring.webapp.lojavirtual.acl.persistence.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="acl_class")
public class ACL_CLASS {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	@Column(name = "nome_classe")
	private String nome_classe;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome_classe() {
		return nome_classe;
	}

	public void setNome_classe(String nome_classe) {
		this.nome_classe = nome_classe;
	}
	
}
