package com.dao;

import com.model.Authorities;
import com.model.Cart;
import com.model.Customer;
import com.model.User;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.Query;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class CustomerDaoImpl implements CustomerDao {

	private EntityManager entityManager;

	public void addCustomer(Customer customer) {
		System.out.println("Adding customer in dao");
		//customer - has users,shippingaddress
		//insert the users,billingaddress
		customer.getUsers().setEnabled(true);
		
		Authorities authorities = new Authorities();
		authorities.setAuthorities("ROLE_USER");
		authorities.setEmailId(customer.getUsers().getEmailId());
		
		Cart cart = new Cart();
		//it is to set CartId for customer table
		customer.setCart(cart);//set the cart to the customer
		//if we omit this statement, hen it will insert null for customerid in cart
		//to set the customerid in cart table
		cart.setCustomer(customer);
		entityManager.persist(customer);
		entityManager.persist(authorities);
		entityManager.flush();
		entityManager.close();
	}

	public List<Customer> getAllCustomers() {
		return entityManager.createQuery("select Customer from Customer", Customer.class).getResultList();
	}

	public Customer getCustomerByEmailId(String emailId) {
		Query query = entityManager.createQuery("select User from User where emailId=?1");
		query.setParameter(1, emailId);
		User users = (User)query.getSingleResult();
		return users.getCustomer();
	}
	
	
}
