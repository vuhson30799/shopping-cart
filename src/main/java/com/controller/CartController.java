package com.controller;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.model.Cart;
import com.model.Customer;
import com.service.CartService;
import com.service.CustomerService;

@Controller
public class CartController {

	private final CustomerService customerService;

	private final CartService cartService;

	public CartController(CustomerService customerService,
						  CartService cartService) {
		this.customerService = customerService;
		this.cartService = cartService;
	}
	
	@RequestMapping("cart/getCartById")
	public String getCartId(Model model){
		User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String emailId = user.getUsername();
		Customer customer = customerService.getCustomerByEmailId(emailId);
		model.addAttribute("cartId", customer.getCart().getCartId());
		return "cart";
	}
	
	@RequestMapping("/cart/getCart/{cartId}")
	public @ResponseBody Cart getCartItems(@PathVariable(value="cartId")Long cartId){
		return cartService.getCartByCartId(cartId);
	}
	
}
