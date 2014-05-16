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
	private int Id;
	
	@Column(name = "nome")
	private String Nome;
	
	@MapKey
	@MapKeyClass(MateriaPrima.class)
	@ManyToMany
	@JoinTable(name="materia_prima_produto", joinColumns={@JoinColumn(name="fk_produto")}, inverseJoinColumns={@JoinColumn(name="fk_materia_prima")})
	@LazyCollection(LazyCollectionOption.FALSE)
	private Map<MateriaPrima, Integer> MateriaPrima;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getNome() {
		return Nome;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public Map<com.spring.webapp.lojavirtual.produto.persistence.model.MateriaPrima, Integer> getMateriaPrima() {
		return MateriaPrima;
	}

	public void setMateriaPrima(Map<MateriaPrima, Integer> materiaPrima) {
		MateriaPrima = materiaPrima;
	}
	
}
