package com.dao;

import com.model.Cart;
import com.model.CartItem;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@Repository
@Transactional
@RequiredArgsConstructor
public class CartItemDaoImpl implements CartItemDao {

	private EntityManager entityManager;

	public void addCartItem(CartItem cartItem) {
		CartItem cartItemFromDb = entityManager.find(CartItem.class, cartItem.getCartItemId());
		if (cartItemFromDb == null) {
			entityManager.persist(cartItem);
		}else {
			entityManager.refresh(cartItem);
		}
		entityManager.flush();
		entityManager.close();
	}

	public void removeCartItem(String cartItemId) {
		CartItem cartItem = entityManager.find(CartItem.class, cartItemId);
		entityManager.remove(cartItem);
		Cart cart = cartItem.getCart();
		List<CartItem> cartItems = cart.getCartItem();
		cartItems.remove(cartItem);
		entityManager.flush();
		entityManager.close();
	}

	public void removeAllCartItems(Cart cart) {
		List<CartItem> cartItems = cart.getCartItem();
		for (CartItem cartItem : cartItems) {
			removeCartItem(cartItem.getCartItemId());
		}
	}

}
