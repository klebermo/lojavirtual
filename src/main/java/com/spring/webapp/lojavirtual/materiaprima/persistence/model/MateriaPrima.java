package com.spring.webapp.lojavirtual.materiaprima.persistence.model;

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

import com.spring.webapp.lojavirtual.fornecedor.persistence.model.Fornecedor;

@Entity
@Table(name="materia_prima")
public class MateriaPrima {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name = "nome")
	private String nome;
	
	@ManyToMany
	@JoinTable(name="fornecedor_materia_prima", joinColumns={@JoinColumn(name="fk_materia_prima")}, inverseJoinColumns={@JoinColumn(name="fk_fornecedor")})
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Fornecedor> fornecedor;
	
	@Column(name = "preco")
	private float preco;

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

	public List<Fornecedor> getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(List<Fornecedor> fornecedor) {
		this.fornecedor = fornecedor;
	}

	public float getPreco() {
		return preco;
	}

	public void setPreco(float preco) {
		this.preco = preco;
	}
}
