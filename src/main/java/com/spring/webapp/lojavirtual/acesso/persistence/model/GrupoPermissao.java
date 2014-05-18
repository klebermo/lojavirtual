package com.spring.webapp.lojavirtual.acesso.persistence.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="role")
public class GrupoPermissao {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name="nome")
	private String nome;
	
	@ManyToMany
	@JoinTable(name="role_permissions", joinColumns={@JoinColumn(name="fk_role")}, inverseJoinColumns={@JoinColumn(name="fk_permission")})
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Permissao> permissao = new ArrayList<Permissao>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Permissao> getPermissao() {
		return permissao;
	}

	public void setPermissao(List<Permissao> permissao) {
		this.permissao = permissao;
	}
	
}
