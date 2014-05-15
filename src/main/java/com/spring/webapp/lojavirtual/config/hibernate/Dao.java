package com.spring.webapp.lojavirtual.config.hibernate;

import java.util.List;
import java.util.StringTokenizer;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class Dao<E> {
	
	private final E entity;
	
	@Autowired
	SessionFactory sessionFactory;
	
	protected Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public Dao(E entity) {  
	    this.entity = entity;
	}
	 
	@SuppressWarnings("unchecked")
	public Dao(Class<?> classe) {
		this.entity = (E) classe;
	}

	public E getEntity() {
	    return this.entity;
	}
	
	@Transactional
	public boolean persist(E transientInstance) {
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			return true;
		} catch (RuntimeException re) {
			return false;
		}
	}
	
	@Transactional
	public boolean remove(E transientInstance) {
		try {
			sessionFactory.getCurrentSession().delete(transientInstance);
			return true;
		} catch (RuntimeException re) {
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public E merge(E detachedInstance) {
		try {
			E result = (E) sessionFactory.getCurrentSession().merge(detachedInstance);
			return result;
		} catch (RuntimeException re) {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public E findById(int id) {
		try {
			E instance = (E) sessionFactory.getCurrentSession().get(entity.getClass(), id);
			return instance;
		} catch (RuntimeException re) {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public E findByField(String field, String value) {
		try {
			String expressao = entity.toString();
			String nome_classe = new String();
			StringTokenizer st = new StringTokenizer(expressao);
			while (st.hasMoreTokens()) {
				nome_classe = st.nextToken();
			}
			String query = "from "+nome_classe+" where "+field+" = :data";
			
			Query q = sessionFactory.getCurrentSession().createQuery(query);
			q.setParameter("data", value);
			E instance = (E) q.uniqueResult();
			return instance;
		} catch (RuntimeException re) {
			return null;
		}
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<E> findAll() {
		try {
			List<E> instance = sessionFactory.getCurrentSession().createCriteria(entity.getClass()).list();
			return instance;
		} catch (RuntimeException re) {
			return null;
		}
	}
	
}
