package com.spring.webapp.lojavirtual.produto.persistence.model;

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

import com.spring.webapp.lojavirtual.materiaprima.persistence.model.MateriaPrima;

@Entity
@Table(name="produto")
public class Produto {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@Column(name = "nome")
	private String nome;
	
	@ManyToMany
	@JoinTable(name="materia_prima_produto", joinColumns={@JoinColumn(name="fk_produto")}, inverseJoinColumns={@JoinColumn(name="fk_materia_prima")})
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<MateriaPrima> MateriaPrima;

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

	public List<MateriaPrima> getMateriaPrima() {
		return MateriaPrima;
	}

	public void setMateriaPrima(List<MateriaPrima> materiaPrima) {
		MateriaPrima = materiaPrima;
	}
	
}
