package com.service;

import com.model.Cart;
import com.model.Customer;
import com.repository.CartRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {
	private final CartRepository cartRepository;

	public CartServiceImpl(CartRepository cartRepository) {
		this.cartRepository = cartRepository;
	}

	public Cart getCartByCartId(Long cartId) {
		return cartRepository.findById(cartId).orElseThrow();
	}

	@Override
	public void save(Cart cart) {
		cartRepository.save(cart);
	}

	@Override
	public List<Cart> findAllCustomerOrderByCustomer(Customer customer) {
		return cartRepository.findAllByCustomer(customer);
	}


}
