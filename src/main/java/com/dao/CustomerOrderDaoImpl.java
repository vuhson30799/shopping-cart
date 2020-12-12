package com.dao;

import com.model.CustomerOrder;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;

@Repository
@Transactional
@RequiredArgsConstructor
public class CustomerOrderDaoImpl implements CustomerOrderDao {

	private EntityManager entityManager;

	public void addCustomerOrder(CustomerOrder customerOrder) {
		CustomerOrder customerOrderFromDb = entityManager.find(customerOrder.getClass(), customerOrder.getCustomerOrderId());
		if (customerOrderFromDb == null) {
			entityManager.persist(customerOrder);
		} else {
			entityManager.refresh(customerOrder);
		}
		entityManager.flush();
		entityManager.close();
	}

}
