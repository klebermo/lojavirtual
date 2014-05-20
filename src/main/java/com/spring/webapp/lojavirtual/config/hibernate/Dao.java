package com.spring.webapp.lojavirtual.config.hibernate;

import java.util.List;
import java.util.StringTokenizer;

import org.hibernate.Criteria;
import org.hibernate.Query;
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
	
	/*public Dao(E entity) {  
	    this.entity = entity;
	}*/
	 
	public Dao(Class<E> classe) {
		this.entity = classe;
	}

	/*public E getEntity() {
	    return this.entity;
	}*/
	
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
	
	@Transactional
	public E findById(int id) {
		E instance = (E) sessionFactory.getCurrentSession().get(entity.getClass(), id);
		return instance;
	}
	
	@Transactional
	public E findByField(String field, String value) {
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
	}
	
	@Transactional
	public List<E> findAll() {
		return (List<E>) sessionFactory.getCurrentSession().createCriteria(entity).setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
	}
	
}
