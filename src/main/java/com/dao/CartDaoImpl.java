package com.dao;

import com.model.Cart;
import com.service.CustomerOrderService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.io.IOException;

@Repository
@Transactional
@RequiredArgsConstructor
public class CartDaoImpl implements CartDao {

	private EntityManager entityManager;
	private CustomerOrderService customerOrderService;

	public Cart getCartByCartId(String cartId) {
		Cart cart = entityManager.find(Cart.class, cartId);
		// System.out.println(cart.getCartId() + " " + cart.getCartItem());
		System.out.println(cart);
		entityManager.close();
		return cart;

	}

	public Cart validate(String cartId) throws IOException {
		Cart cart = getCartByCartId(cartId);
		if (cart == null || cart.getCartItem().isEmpty()) {
			throw new IOException(cartId + "");
		}
		update(cart);
		return cart;
	}

	public void update(Cart cart) {

		String cartId = cart.getCartId();
		double grandTotal = customerOrderService.getCustomerOrderGrandTotal(cartId);
		cart.setTotalPrice(grandTotal);

		entityManager.refresh(cart);
		entityManager.flush();
		entityManager.close();
	}

}
