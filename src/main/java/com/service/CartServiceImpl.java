package com.service;

import com.model.Cart;
import com.repository.CartRepository;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
	private final CartRepository cartRepository;
	private final CartItemService cartItemService;

	public CartServiceImpl(CartRepository cartRepository, CartItemService cartItemService) {
		this.cartRepository = cartRepository;
		this.cartItemService = cartItemService;
	}

	public Cart getCartByCartId(Long cartId) {
		return cartRepository.findById(cartId).orElseThrow();
	}

	@Override
	public void addNewCart(Cart cart) {
		cartRepository.save(cart);
	}


}
