package com.spring.webapp.lojavirtual.materiaprima.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.webapp.lojavirtual.fornecedor.persistence.FornecedorDao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.DescricaoMateriaPrimaDao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.MateriaPrimaDao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.QuantidadeMateriaPrimaDao;
import com.spring.webapp.lojavirtual.materiaprima.persistence.model.DescricaoMateriaPrima;
import com.spring.webapp.lojavirtual.materiaprima.persistence.model.MateriaPrima;
import com.spring.webapp.lojavirtual.materiaprima.persistence.model.QuantidadeMateriaPrima;

@Service
public class MateriaPrimaService {
	
	@Autowired
	private MateriaPrimaDao materiaPrima;
	
	@Autowired
	private DescricaoMateriaPrimaDao descMateriaPrima;
	
	@Autowired
	private QuantidadeMateriaPrimaDao quantMateriaPrima;
	
	@Autowired
	private FornecedorDao fornecedor;
	
	@Transactional
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		String id_fornecedor = request.getParameter("fornecedor");
		
		DescricaoMateriaPrima desc = new DescricaoMateriaPrima();
		desc.setNome(nome);
		desc.setDescricao(descricao);
		desc.setFornecedor(fornecedor.findById(Integer.valueOf(id_fornecedor).intValue()));
		
		String quantidade = request.getParameter("quantidade");
		String unidade = request.getParameter("unidade");
		String custo = request.getParameter("custo");
		
		QuantidadeMateriaPrima quant = new QuantidadeMateriaPrima();
		quant.setQuantidade(Float.valueOf(quantidade).floatValue());
		quant.setUnidade(unidade);
		quant.setCusto(Float.valueOf(custo).floatValue());
		
		MateriaPrima mat = new MateriaPrima();
		mat.setDescricao(desc);
		mat.setQuantidade(quant);
		
		return materiaPrima.persist(mat);
	}
	
	@Transactional
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		String id_desc = request.getParameter("id_descricao");
		String nome = request.getParameter("nome");
		String descricao = request.getParameter("descricao");
		String id_fornecedor = request.getParameter("fornecedor");
		
		DescricaoMateriaPrima desc = descMateriaPrima.findById(Integer.valueOf(id_desc).intValue());
		desc.setNome(nome);
		desc.setDescricao(descricao);
		desc.setFornecedor(fornecedor.findById(Integer.valueOf(id_fornecedor).intValue()));
		
		String id_quant = request.getParameter("id_quantidade");
		String quantidade = request.getParameter("quantidade");
		String unidade = request.getParameter("unidade");
		String custo = request.getParameter("custo");
		
		QuantidadeMateriaPrima quant = quantMateriaPrima.findById(Integer.valueOf(id_quant).intValue());
		quant.setQuantidade(Float.valueOf(quantidade).floatValue());
		quant.setUnidade(unidade);
		quant.setCusto(Float.valueOf(custo).floatValue());
		
		MateriaPrima mat = materiaPrima.findById(Integer.valueOf(id).intValue());
		mat.setDescricao(desc);
		mat.setQuantidade(quant);
		
		return materiaPrima.persist(mat);
	}
	
	@Transactional
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MateriaPrima mat = materiaPrima.findById(Integer.valueOf(id).intValue());
		return materiaPrima.remove(mat);
	}
	
	@Transactional
	public List<MateriaPrima> listagem() {
		return materiaPrima.findAll();
	}
	
	@Transactional
	public MateriaPrima listagem(int id) {
		return materiaPrima.findById(id);
	}
}
