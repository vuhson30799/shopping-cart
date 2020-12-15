package com.service;

import java.util.List;

import com.repository.CustomerOrderRepository;
import org.springframework.stereotype.Service;

import com.model.Cart;
import com.model.CartItem;
import com.model.CustomerOrder;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderService {
	private final CustomerOrderRepository customerOrderRepository;
	private final CartService cartService;

	public CustomerOrderServiceImpl(CustomerOrderRepository customerOrderRepository, CartService cartService) {
		this.customerOrderRepository = customerOrderRepository;
		this.cartService = cartService;
	}

	public void addCustomerOrder(CustomerOrder customerOrder) {
		customerOrderRepository.save(customerOrder);
	}

	public double getCustomerOrderGrandTotal(Long cartId) {
		double grandTotal=0;
		Cart cart = cartService.getCartByCartId(cartId);
		List<CartItem> cartItems = cart.getCartItem();
		
		for(CartItem item: cartItems){
			grandTotal += item.getPrice();
		}
		return grandTotal;
	}

}
