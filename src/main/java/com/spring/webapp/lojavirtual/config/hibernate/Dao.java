package com.spring.webapp.lojavirtual.config.hibernate;

import java.util.List;
import java.util.StringTokenizer;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

public class Dao<E> {
	
	private final Class<E> entity;
	
	@Autowired
	protected SessionFactory sessionFactory;
	
	protected Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}
		 
	public Dao(Class<E> classe) {
		this.entity = classe;
	}

	@Transactional
	public boolean persist(E transientInstance) {
		sessionFactory.getCurrentSession().persist(transientInstance);
		return true;
	}
	
	@Transactional
	public boolean remove(E transientInstance) {
		sessionFactory.getCurrentSession().delete(transientInstance);
		return true;
	}
	
	@Transactional
	public boolean merge(E detachedInstance) {
		sessionFactory.getCurrentSession().merge(detachedInstance);
		return true;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public E findById(int id) {
		E instance = (E) sessionFactory.getCurrentSession().get(entity, id);
		return instance;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<E> findByStringField(String field, String value) {
		String expressao = entity.toString();
		String nome_classe = new String();
		StringTokenizer st = new StringTokenizer(expressao);
		while (st.hasMoreTokens()) {
			nome_classe = st.nextToken();
		}
		String query = "from "+nome_classe+" where "+field+" = :data";
		List<E> instance = sessionFactory.getCurrentSession().createQuery(query).setString("data", value).list();
		return instance;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<E> findByIntegerField(String field, Integer value) {
		String expressao = entity.toString();
		String nome_classe = new String();
		StringTokenizer st = new StringTokenizer(expressao);
		while (st.hasMoreTokens()) {
			nome_classe = st.nextToken();
		}
		String query = "from "+nome_classe+" where "+field+" = :data";
		List<E> instance = sessionFactory.getCurrentSession().createQuery(query).setInteger("data", value).list();
		return instance;
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<E> findAll() {
		return (List<E>) sessionFactory.getCurrentSession().createCriteria(entity).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
	}
	
}
