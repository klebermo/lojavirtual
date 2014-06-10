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
	
	@PreAuthorize("hasPermission(#user, 'cadastra_permissao')")
	@Transactional
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String nome_grupo = request.getParameter("nome");
		String[] permissoes = request.getParameterValues("permissoes");
		
		if(nome_grupo == null) {
			return false;
		}
		
		GrupoPermissao grupo = new GrupoPermissao();
		grupo.setNome(nome_grupo);
		
		if(permissoes != null) {
			List<Permissao> lista = new ArrayList<Permissao>();
			for(int i=0; i<permissoes.length; i++)
				lista.add(permissao.findById(Integer.valueOf(permissoes[i]).intValue()));
			grupo.setPermissao(lista);
		}
		
		return grupo_permissao.persist(grupo);
	}
	
	@PreAuthorize("hasPermission(#user, 'altera_permissao')")
	@Transactional
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		String id_usuario = request.getParameter("usuario");
		String id_permissao = request.getParameter("grupo");
		String possui = request.getParameter("possui");
		
		if(possui.equals("not")) {
			Usuario user = usuario.findById(Integer.valueOf(id_usuario).intValue());
			user.getAutorizacao().add(grupo_permissao.findById(Integer.valueOf(id_permissao).intValue()));
			return usuario.merge(user);
		}
		else {
			Usuario user = usuario.findById(Integer.valueOf(id_usuario).intValue());
			int max = user.getAutorizacao().size();
			int index[] = new int[max];
			for(int i=0; i<max; i++)
				index[i] = -1;
			for(int i=0; i<max; i++) {
				String p_user = user.getAutorizacao().get(i).getNome();
				String p_comp = grupo_permissao.findById(Integer.valueOf(id_permissao).intValue()).getNome();
				System.out.println(i+"->"+p_user+"=="+p_comp);
				if(p_user.equals(p_comp)) {
					index[i] = i;
				}
			}
			for(int i=0; i<max; i++)
				if(index[i] >= 0)
					user.getAutorizacao().remove(i);
			return usuario.merge(user);
		}
	}
	
	@PreAuthorize("hasPermission(#user, 'remove_permissao')")
	@Transactional
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		GrupoPermissao novo = grupo_permissao.findById(Integer.valueOf(id).intValue());
		novo.setPermissao(null);
		grupo_permissao.merge(novo);
		return grupo_permissao.remove(novo);
	}
	
	@Transactional
	public List<GrupoPermissao> lista_grupos() {
		return grupo_permissao.findAll();
	}
	
	@Transactional
	public List<GrupoPermissao> lista_permissoes_usuario(int id_usuario) {
		return usuario.findById(id_usuario).getAutorizacao();
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
	public GrupoPermissao findRoleById(int id) {
		return grupo_permissao.findById(id);
	}
	
	@Transactional
	public Permissao findPermissionById(int id) {
		return permissao.findById(id);
	}
	
	@Transactional
	public Usuario findUsuarioByID(int id) {
		return usuario.findById(id);
	}
	
}
