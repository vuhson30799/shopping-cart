package com.service;

import com.model.Cart;
import com.model.CartItem;
import com.model.Customer;

import java.util.List;

public interface CartItemService {
	List<CartItem> getCartItemByCart(Cart cart);
	void addCartItem(Long productId, Customer customer);
	void removeCartItem(Long cartItemId);
	void removeAllCartItems(Cart cart);
}
