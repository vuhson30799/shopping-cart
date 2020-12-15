package com.controller;

import java.util.List;

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
		System.out.println("Customer : " + customer.getUserInfo().getEmailId());
		Cart cart = customer.getCart();
		List<CartItem> cartItems = cart.getCartItem();
		Product product = productService.getProductById(productId);
		for (int i = 0; i < cartItems.size(); i++) {
			CartItem cartItem = cartItems.get(i);
			if (product.getProductId().equals(cartItem.getProduct().getProductId())) {
				cartItem.setQuality(cartItem.getQuality() + 1);
				cartItem.setPrice(cartItem.getQuality() * cartItem.getProduct().getProductPrice());
				cartItemService.addCartItem(cartItem);
				return;
			}
		}
		CartItem cartItem = new CartItem();
		cartItem.setQuality(1);
		cartItem.setProduct(product);
		cartItem.setPrice(product.getProductPrice() * 1);
		cartItem.setCart(cart);
		cartItemService.addCartItem(cartItem);
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
