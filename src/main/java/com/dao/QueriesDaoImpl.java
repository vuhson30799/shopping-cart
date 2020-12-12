package com.dao;

import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Queries;

import javax.persistence.EntityManager;

@Repository
@RequiredArgsConstructor
public class QueriesDaoImpl implements QueriesDao  {

	private EntityManager entityManager;
	
	public void addQuery(Queries queries) {
		entityManager.persist(queries);
		entityManager.close();
	}

}
