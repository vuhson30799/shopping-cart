package com.service;

import com.model.Cart;
import com.model.CartItem;

public interface CartItemService {

	void addCartItem(CartItem cartItem);
	void removeCartItem(Long cartItemId);
	void removeAllCartItems(Cart cart);
}
