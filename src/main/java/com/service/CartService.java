package com.service;

import com.model.Cart;
import com.model.Customer;

import java.util.List;

public interface CartService {
	Cart getCartByCartId(Long cartId);
	void save(Cart cart);
	List<Cart> findAllCustomerOrderByCustomer(Customer customer);
	List<Cart> findAll();
}
