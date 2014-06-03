package com.spring.webapp.lojavirtual.fornecedor.persistence.model;

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

import com.spring.webapp.lojavirtual.common.persistence.model.Contato;
import com.spring.webapp.lojavirtual.common.persistence.model.Endereco;

@Entity
@Table(name="fornecedor")
public class Fornecedor {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer Id;
	
	@Column(name = "razao_social")
	private String razao_social;
	
	@Column(name = "cnpj")
	private String cnpj;
	
	@Column(name = "cpf")
	private String cpf;
	
	@ManyToMany
	@JoinTable(name="endereco_fornecedor", joinColumns={@JoinColumn(name="fk_fornecedor")}, inverseJoinColumns={@JoinColumn(name="fk_endereco")})
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Endereco> endereco;
	
	@Column(name = "website")
	private String website;
	
	@ManyToMany
	@JoinTable(name="contato_fornecedor", joinColumns={@JoinColumn(name="fk_fornecedor")}, inverseJoinColumns={@JoinColumn(name="fk_contato")})
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Contato> contato;

	public Integer getId() {
		return Id;
	}

	public void setId(Integer id) {
		Id = id;
	}

	public String getRazao_social() {
		return razao_social;
	}

	public void setRazao_social(String razao_social) {
		this.razao_social = razao_social;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public List<Endereco> getEndereco() {
		return endereco;
	}

	public void setEndereco(List<Endereco> endereco) {
		this.endereco = endereco;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public List<Contato> getContato() {
		return contato;
	}

	public void setContato(List<Contato> contato) {
		this.contato = contato;
	}
}
