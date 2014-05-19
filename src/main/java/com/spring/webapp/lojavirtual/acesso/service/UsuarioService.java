package com.spring.webapp.lojavirtual.acesso.service;

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
public class UsuarioService {
	
	@Autowired
	private UsuarioHome usuario;
	
	@Autowired
	private GrupoPermissaoHome grupo_permissao;
	
	@Autowired
	private PermissaoHome permissao;
	
	@PreAuthorize("hasPermission(#user, 'cadastra_usuario')")
	@Transactional
	public boolean cadastra(HttpServletRequest request, HttpServletResponse response) {
		String email = request.getParameter("email");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String pnome = request.getParameter("pnome");
		String unome = request.getParameter("unome");
		
		return usuario.persist(new Usuario(login, senha,email, pnome, unome));
	}
	
	@PreAuthorize("hasPermission(#user, 'altera_usuario')")
	@Transactional
	public boolean altera(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id")).intValue();
		Usuario merge = usuario.findById(id);
		
		String email = request.getParameter("email");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		String pnome = request.getParameter("pnome");
		String unome = request.getParameter("unome");
		
		if(!email.isEmpty())
			merge.setEmail(email);
		if(!pnome.isEmpty())
			merge.setFirst_name(pnome);
		if(!unome.isEmpty())
			merge.setLast_name(unome);
		if(!login.isEmpty())
			merge.setLogin(login);
		if(!senha.isEmpty())
			merge.setSenha(senha);
		
		return usuario.merge(merge);
	}
	
	@PreAuthorize("hasPermission(#user, 'remove_usuario')")
	@Transactional
	public boolean remove(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.valueOf(request.getParameter("id")).intValue();
		Usuario remove = usuario.findById(id);
		
		return usuario.remove(remove);
	}
	
	@Transactional
	public List<GrupoPermissao> lista_grupo_permissoes() {
		System.out.println("listagem_grupo_usuario");
		return grupo_permissao.findAll();
	}
	
	@Transactional
	public List<Permissao> lista_permissoes(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("listagem_permissoes(req, res)");
		int id_grupo = Integer.valueOf(request.getParameter("id")).intValue();
		return grupo_permissao.findById(id_grupo).getPermissao();
	}
	
	@Transactional
	public List<Permissao> lista_permissoes() {
		System.out.println("listagem_permissoes");
		return permissao.findAll();
	}
	
	@Transactional
	public List<Usuario> listagem_usuarios() {
		System.out.println("listagem_usuarios");
		return usuario.findAll();
	}
	
	@Transactional
	public Usuario listagem_usuario(int id) {
		System.out.println("listagem_usuario");
		return usuario.findById(id);
	}
}
