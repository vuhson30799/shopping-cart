package com.service;

import java.util.List;

import com.dto.CustomerOrderDTO;
import com.exception.ApplicationException;
import com.model.ShippingAddress;
import com.repository.CustomerOrderRepository;
import com.repository.ShippingAddressRepository;
import com.utils.CartState;
import org.springframework.stereotype.Service;

import com.model.Cart;
import com.model.CartItem;
import com.model.CustomerOrder;

@Service
public class CustomerOrderServiceImpl implements CustomerOrderService {
	private final CustomerOrderRepository customerOrderRepository;
	private final CartService cartService;
	private final ShippingAddressRepository shippingAddressRepository;

	public CustomerOrderServiceImpl(CustomerOrderRepository customerOrderRepository, CartService cartService, ShippingAddressRepository shippingAddressRepository) {
		this.customerOrderRepository = customerOrderRepository;
		this.cartService = cartService;
		this.shippingAddressRepository = shippingAddressRepository;
	}

	@Override
	public void addCustomerOrder(Long cartId) {
		CustomerOrder customerOrder = new CustomerOrder();

		Cart cart = cartService.getCartByCartId(cartId);

		if (cart == null) {
			throw new ApplicationException("Invalid cart");
		}

		if (cart.getCartItem().isEmpty()) {
			throw new ApplicationException("There nothing to order since this cart is empty.");
		}

		customerOrder.setCart(cart);

		customerOrderRepository.save(customerOrder);
	}

	@Override
	public List<CustomerOrder> getCustomerOrderByCart(Long cartId) {
		return customerOrderRepository.findByCart_CartId(cartId);
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

	@Override
	public void cancelCustomerOrder(Long cartId) {
		customerOrderRepository.deleteAll(customerOrderRepository.findByCart_CartId(cartId));
	}

	@Override
	public void collectCustomerInfo(CustomerOrderDTO customerOrderDTO) {
		CustomerOrder customerOrder = customerOrderRepository.findById(customerOrderDTO.getCustomerOrderId()).orElseThrow();

		ShippingAddress shippingAddress = customerOrderDTO.getShippingAddressDTO().toShippingAddress(customerOrder.getCart().getCustomer().getShippingAddress());
		shippingAddressRepository.save(shippingAddress);
		customerOrderRepository.save(customerOrder);
	}

	@Override
	public void submitCustomerOrder(Long customerOrderId) {
		CustomerOrder customerOrder = customerOrderRepository.findById(customerOrderId).orElseThrow();
		customerOrder.getCart().setStatus(CartState.CHECKOUT.name());
		cartService.save(customerOrder.getCart());
		cartService.save(new Cart(customerOrder.getCart().getCustomer()));
	}

}
