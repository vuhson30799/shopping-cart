package com.service;

import com.exception.ApplicationException;
import com.model.Cart;
import com.model.CartItem;
import com.model.Customer;
import com.model.Product;
import com.repository.CartItemRepository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CartItemServiceImpl implements CartItemService {
	private final CartItemRepository cartItemRepository;
	private final ProductService productService;

	public CartItemServiceImpl(CartItemRepository cartItemRepository, ProductService productService) {
		this.cartItemRepository = cartItemRepository;
		this.productService = productService;
	}

	@Override
	public List<CartItem> getCartItemByCart(Cart cart) {
		return this.cartItemRepository.findAllByCart(cart);
	}

	@Override
	public void addCartItem(Long productId, Customer customer) {
		Product product = productService.getProductById(productId);
		if (product == null) {
			throw new ApplicationException("Product is not exist");
		}
		Cart cart = customer.getCart();
		CartItem cartItem = new CartItem();
		cartItem.setCart(cart);
		cartItem.setProduct(product);
		cartItem.setQuality(1);
		cartItem.setPrice(product.getProductPrice() * cartItem.getQuality());
		List<CartItem> cartItems = getCartItemByCart(cart);

		Optional<CartItem> optionalCartItem = cartItems.stream().filter(c -> c.getProduct().getProductId().equals(productId)).findFirst();
		if (optionalCartItem.isPresent()) {
			CartItem oldCartItem = optionalCartItem.get();
			oldCartItem.setQuality(oldCartItem.getQuality() + cartItem.getQuality());
			oldCartItem.setPrice(oldCartItem.getPrice() * oldCartItem.getQuality());
			cartItemRepository.save(oldCartItem);
		} else {
			cartItemRepository.save(cartItem);
		}
	}

	public void removeCartItem(Long cartItemId) {
		CartItem cartItem = cartItemRepository.findById(cartItemId).orElseThrow();
		cartItemRepository.delete(cartItem);
		Cart cart = cartItem.getCart();
		List<CartItem> cartItems = cart.getCartItem();
		cartItems.remove(cartItem);
	}

	public void removeAllCartItems(Cart cart) {
		cart.getCartItem().forEach(cartItem -> removeCartItem(cartItem.getCartItemId()));
	}

}
