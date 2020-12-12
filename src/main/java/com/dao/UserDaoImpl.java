package com.dao;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.User;

import javax.persistence.EntityManager;

@Repository
@RequiredArgsConstructor
public class UserDaoImpl implements UserDao {

	private EntityManager entityManager;
	
	public List<User> getAllUsers() {
		List<User> users= entityManager.createQuery("select User from User ", User.class).getResultList();
		System.out.println(users);
		entityManager.close();
		return users;
	}

	public void deleteUser(String userId) {
		User user = entityManager.find(User.class, userId);
		entityManager.remove(user);
		entityManager.flush();
		entityManager.close();
	}

	public void addUser(User user) {
		entityManager.persist(user);
		entityManager.close();
	}

	public User getUserById(String userId) {

		User user = entityManager.find(User.class, userId);
		entityManager.close();
		return user;
	}
	
}
