package com.controller;

import java.util.ArrayList;
import java.util.List;

import com.exception.ApplicationException;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.model.Cart;
import com.model.CartItem;
import com.model.Customer;
import com.model.Product;
import com.service.CartItemService;
import com.service.CartService;
import com.service.CustomerService;
import com.service.ProductService;

@Controller
public class CartItemController {

	private final CartService cartService;

	private final CartItemService cartItemService;

	private final CustomerService customerService;

	private final ProductService productService;

	public CartItemController(CartService cartService,
							  CartItemService cartItemService,
							  CustomerService customerService,
							  ProductService productService) {
		this.cartService = cartService;
		this.cartItemService = cartItemService;
		this.customerService = customerService;
		this.productService = productService;
	}

	@RequestMapping("/cart/add/{productId}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void addCartItem(@PathVariable(value = "productId") Long productId) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String emailId = user.getUsername();
		Customer customer = customerService.getCustomerByEmailId(emailId);
		cartItemService.addCartItem(productId, customer);
	}

	@RequestMapping("/cart/removeCartItem/{cartItemId}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void removeCartItem(@PathVariable(value = "cartItemId") Long cartItemId) {
		cartItemService.removeCartItem(cartItemId);
	}

	@RequestMapping("/cart/removeAllItems/{cartId}")
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void removeAllCartItems(@PathVariable(value = "cartId") Long cartId) {
		Cart cart = cartService.getCartByCartId(cartId);
		cartItemService.removeAllCartItems(cart);
	}

}
