package com.service;

import com.model.Cart;
import com.model.Customer;
import com.repository.CustomerRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
	private final CustomerRepository customerRepository;
	private final CartService cartService;
	private final UserService userService;
	private final PasswordEncoder passwordEncoder;

	public CustomerServiceImpl(CustomerRepository customerRepository,
							   CartService cartService, UserService userService,
							   PasswordEncoder passwordEncoder) {
		this.customerRepository = customerRepository;
		this.cartService = cartService;
		this.userService = userService;
		this.passwordEncoder = passwordEncoder;
	}


	@Transactional
	public void addCustomer(Customer customer) {
		customer.getUserInfo().setEnabled(true);
		customer.getUserInfo().setPassword(passwordEncoder.encode(customer.getUserInfo().getPassword()));

		Cart cart = new Cart(customer);
		customer.setCarts(Arrays.asList(cart));

		cartService.save(cart);
		customerRepository.save(customer);
	}

	public List<Customer> getAllCustomers() {
		return customerRepository.findAll();
	}

	public Customer getCustomerByEmailId(String emailId) {
		return userService.getUserByEmail(emailId).getCustomer();
	}

}
