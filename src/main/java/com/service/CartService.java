package com.service;

import com.model.Cart;
import com.model.Customer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CartService {
	Cart getCartByCartId(Long cartId);
	void save(Cart cart);
	List<Cart> findAllCustomerOrderByCustomer(Customer customer);
	Page<Cart> getAllCustomerOrderByCustomer(Customer customer, Pageable pageable);
	List<Cart> findAll();
}
