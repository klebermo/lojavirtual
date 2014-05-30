package com.spring.webapp.lojavirtual.promocao.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.promocao.persistence.PromocaoDao;
import com.spring.webapp.lojavirtual.promocao.persistence.model.Promocao;

@Service
public class PromocaoService {
	
	@Autowired
	private PromocaoDao promocao;
	
	public boolean cadastra() {
		return false;
	}
	
	public boolean altera() {
		return false;
	}
	
	public boolean remove() {
		return false;
	}
	
	public List<Promocao> listagem(String id_categoria) {
		return null;
	}
	
	public Promocao listagem(int id) {
		return null;
	}
	
}
