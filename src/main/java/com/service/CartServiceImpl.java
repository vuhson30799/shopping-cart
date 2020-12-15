package com.service;

import com.model.Cart;
import com.repository.CartRepository;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
	private final CartRepository cartRepository;

	public CartServiceImpl(CartRepository cartRepository) {
		this.cartRepository = cartRepository;
	}

	public Cart getCartByCartId(Long cartId) {
		return cartRepository.findById(cartId).orElseThrow();
	}

}
