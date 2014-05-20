package com.spring.webapp.lojavirtual.acesso.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.webapp.lojavirtual.acesso.persistence.GrupoPermissaoHome;
import com.spring.webapp.lojavirtual.acesso.persistence.PermissaoHome;
import com.spring.webapp.lojavirtual.acesso.persistence.UsuarioHome;
import com.spring.webapp.lojavirtual.acesso.persistence.model.GrupoPermissao;
import com.spring.webapp.lojavirtual.acesso.persistence.model.Permissao;
import com.spring.webapp.lojavirtual.acesso.persistence.model.Usuario;

@Service
public class PermissaoService {
	
	@Autowired
	private UsuarioHome usuario;
	
	@Autowired
	private GrupoPermissaoHome grupo_permissao;
	
	@Autowired
	private PermissaoHome permissao;
	
	@PreAuthorize("hasPermission(#user, 'altera_usuario')")
	@Transactional
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String nome_grupo = request.getParameter("nome");
		String[] permissoes = request.getParameterValues("permissoes");
		
		GrupoPermissao grupo = new GrupoPermissao();
		grupo.setNome(nome_grupo);
		
		List<Permissao> lista = new ArrayList<Permissao>();
		for(int i=0; i<permissoes.length; i++) {
			Permissao p = new Permissao();
			int id = Integer.valueOf(permissoes[i]).intValue();
			p.setId(id);
			lista.add(p);
		}
		grupo.setPermissao(lista);
		
		return grupo_permissao.persist(grupo);
	}
	
	@PreAuthorize("hasPermission(#user, 'altera_usuario')")
	@Transactional
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		String id_usuario = request.getParameter("usuario");
		String id_permissao = request.getParameter("grupo");
		
		Usuario user = usuario.findById(Integer.valueOf(id_usuario).intValue());
		int id = Integer.valueOf(id_permissao).intValue();
		for(int i=0; i<user.getAutorizacao().size(); i++) {
			if(user.getAutorizacao().get(i).getId() == id) {
				user.getAutorizacao().remove(i);
				return usuario.merge(user);
			}
		}
		
		user.getAutorizacao().add(grupo_permissao.findById(id));
		return usuario.merge(user);
	}
	
	@Transactional
	public List<GrupoPermissao> lista_grupos() {
		return grupo_permissao.findAll();
	}
		
	@Transactional
	public List<Permissao> lista_permissoes() {
		return permissao.findAll();
	}
	
	@Transactional
	public List<Permissao> lista_permissoes_grupo(int id_grupo) {
		return grupo_permissao.findById(id_grupo).getPermissao();
	}
	
	@Transactional
	public Usuario findUserById(int id) {
		return usuario.findById(id);
	}
	
}
