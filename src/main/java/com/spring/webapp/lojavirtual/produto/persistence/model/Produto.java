package com.spring.webapp.lojavirtual.produto.persistence.model;

import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MapKey;
import javax.persistence.MapKeyClass;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="produto")
public class Produto {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name = "nome")
	private String nome;
	
	@MapKey
	@MapKeyClass(MateriaPrima.class)
	@ManyToMany
	@JoinTable(name="materia_prima_produto", joinColumns={@JoinColumn(name="fk_produto")}, inverseJoinColumns={@JoinColumn(name="fk_materia_prima")})
	@LazyCollection(LazyCollectionOption.FALSE)
	private Map<MateriaPrima, Integer> MateriaPrima;

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

	public Map<MateriaPrima, Integer> getMateriaPrima() {
		return MateriaPrima;
	}

	public void setMateriaPrima(Map<MateriaPrima, Integer> materiaPrima) {
		MateriaPrima = materiaPrima;
	}
	
}
