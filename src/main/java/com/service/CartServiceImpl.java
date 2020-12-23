package com.service;

import com.model.Cart;
import com.model.Customer;
import com.repository.CartRepository;
import com.utils.CartState;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

	@Override
	public Page<Cart> getAllCustomerOrderByCustomer(Customer customer, Pageable pageable) {
		return cartRepository.findByCustomerAndStatusIsNot(customer, CartState.AVAILABLE.name(), pageable);
	}

	@Override
	public List<Cart> findAll() {
		return cartRepository.findAll();
	}

	@Override
	public Page<Cart> findAllByStatusIsNot(String status, Pageable pageable) {
		return cartRepository.findAllByStatusIsNot(status, pageable);
	}


}
