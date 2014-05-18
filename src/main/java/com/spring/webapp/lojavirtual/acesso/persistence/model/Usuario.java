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
@Table(name="usuario")
public class Usuario {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name = "login")
	private String login;
	
	@Column(name = "senha")
	private String senha;
	
	@Column(name="first_name")
	private String first_name;
	
	@Column(name="last_name")
	private String last_name;
	
	@Column(name="email")
	private String email;
	
	@ManyToMany
	@JoinTable(name="role_members", joinColumns={@JoinColumn(name="fk_usuario")}, inverseJoinColumns={@JoinColumn(name="fk_role")})
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<GrupoPermissao> Autorizacao = new ArrayList<GrupoPermissao>();

	public Usuario() {
	}

	public Usuario(String login, String senha, String email, String pnome, String unome) {
		this.login = login;
		this.senha = senha;
		this.email = email;
		this.first_name = pnome;
		this.last_name = unome;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getSenha() {
		return this.senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
	
	public String getFirst_name() {
		return this.first_name;
	}
	
	public void setFirst_name(String nome) {
		this.first_name = nome;
	}
	
	public String getLast_name() {
		return this.last_name;
	}
	
	public void setLast_name(String nome) {
		this.last_name = nome;
	}
	
	public String getEmail() {
		return this.email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}

	public List<GrupoPermissao> getAutorizacao() {
		return this.Autorizacao;
	}

	public void setAutorizacao(List<GrupoPermissao> autorizacao) {
		this.Autorizacao = autorizacao;
	}

	public boolean isEnabled() {
		return true;
	}
	
}
