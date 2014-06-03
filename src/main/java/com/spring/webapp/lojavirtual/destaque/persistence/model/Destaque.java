package com.spring.webapp.lojavirtual.destaque.persistence.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import com.spring.webapp.lojavirtual.common.persistence.model.Categoria;
import com.spring.webapp.lojavirtual.produto.persistence.model.Produto;

@Entity
@Table(name="destaque")
public class Destaque {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	
	@OneToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE} )
	@JoinColumn(name="categoria")
	@Cascade(org.hibernate.annotations.CascadeType.SAVE_UPDATE)
	private Categoria categoria;
	
	@ManyToMany
	@JoinTable(name="produto_em_destaque", joinColumns={@JoinColumn(name="fk_destaque")}, inverseJoinColumns={@JoinColumn(name="fk_produto")})
	@LazyCollection(LazyCollectionOption.FALSE)
	private List<Produto> produtos;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public List<Produto> getProdutos() {
		return produtos;
	}

	public void setProdutos(List<Produto> produtos) {
		this.produtos = produtos;
	}
}
