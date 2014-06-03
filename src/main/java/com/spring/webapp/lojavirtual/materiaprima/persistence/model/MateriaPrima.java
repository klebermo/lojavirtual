package com.spring.webapp.lojavirtual.materiaprima.persistence.model;

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
@Table(name="materia_prima")
public class MateriaPrima {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	@OneToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@JoinColumn(name="descricao")
	@Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
	private DescricaoMateriaPrima descricao;
	
	@OneToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@JoinColumn(name="quantidade")
	@Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
	private QuantidadeMateriaPrima quantidade;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public DescricaoMateriaPrima getDescricao() {
		return descricao;
	}

	public void setDescricao(DescricaoMateriaPrima descricao) {
		this.descricao = descricao;
	}

	public QuantidadeMateriaPrima getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(QuantidadeMateriaPrima quantidade) {
		this.quantidade = quantidade;
	}
	
}
