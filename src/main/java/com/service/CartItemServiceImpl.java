package com.service;

import com.model.Cart;
import com.model.CartItem;
import com.repository.CartItemRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartItemServiceImpl implements CartItemService {
	private final CartItemRepository cartItemRepository;

	public CartItemServiceImpl(CartItemRepository cartItemRepository) {
		this.cartItemRepository = cartItemRepository;
	}

	public void addCartItem(CartItem cartItem) {
		cartItemRepository.save(cartItem);

	}

	public void removeCartItem(Long cartItemId) {
		CartItem cartItem = cartItemRepository.findById(cartItemId).orElseThrow();
		cartItemRepository.delete(cartItem);
		Cart cart = cartItem.getCart();
		List<CartItem> cartItems = cart.getCartItem();
		cartItems.remove(cartItem);
	}

	public void removeAllCartItems(Cart cart) {
		cart.getCartItem().forEach(cartItem -> removeCartItem(cartItem.getCartItemId()));
	}

}
