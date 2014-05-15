package com.spring.webapp.lojavirtual.acesso.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.spring.webapp.lojavirtual.acesso.persistence.UsuarioHome;
import com.spring.webapp.lojavirtual.acesso.persistence.model.Permission;
import com.spring.webapp.lojavirtual.acesso.persistence.model.Usuario;

/**
Usernames/Passwords are
    rod/koala
    dianne/emu
    scott/wombat
    peter/opal
    kleber/kmo1982
**/

@Service
public class AuthenticationService implements UserDetailsService {

	@Autowired
	private UsuarioHome accountDao;

	@Override
	@Transactional(readOnly = true, propagation = Propagation.SUPPORTS)
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Usuario account = accountDao.findByField("login", username);
	
	    if(account==null) {
	    	System.out.println("No such user: " + username);
	    	throw new UsernameNotFoundException("No such user: " + username);
	    } else if (account.getAutorizacao().isEmpty()) {
	    	System.out.println("User " + username + " has no authorities");
	        throw new UsernameNotFoundException("User " + username + " has no authorities");
	    }
	    
	    List<Permission> lista = new ArrayList<Permission>();
	    int max = account.getAutorizacao().size();
	    for(int i=0; i<max; i++) {
	    	for(int j=0; j<max; j++) {
	    		lista.add(account.getAutorizacao().get(i).getPermissao().get(j));
	    	}
	    }
	
	    boolean accountIsEnabled = true;
	    boolean accountNonExpired = true;
	    boolean credentialsNonExpired = true;
	    boolean accountNonLocked = true;
	
	    return new User(account.getLogin(), account.getSenha(), accountIsEnabled, accountNonExpired, credentialsNonExpired, accountNonLocked, getAuthorities(lista));
	}
	
	public List<String> getRolesAsList(List<Permission> list) {
	    List <String> rolesAsList = new ArrayList<String>();
	    for(Permission role : list){
	        rolesAsList.add(role.getNome());
	    }
	    return rolesAsList;
	}
	
	public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
	    List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
	    for (String role : roles) {
	        authorities.add(new SimpleGrantedAuthority(role));
	    }
	    return authorities;
	}
	
	public Collection<? extends GrantedAuthority> getAuthorities(List<Permission> list) {
	    List<GrantedAuthority> authList = getGrantedAuthorities(getRolesAsList(list));
	    return authList;
	}

}