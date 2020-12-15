package com.service;

import com.model.Authorities;
import com.model.Customer;
import com.repository.AuthoritiesRepository;
import com.repository.CustomerRepository;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
	private final CustomerRepository customerRepository;
	private final AuthoritiesRepository authoritiesRepository;
	private final UserService userService;
	private final PasswordEncoder passwordEncoder;

	public CustomerServiceImpl(CustomerRepository customerRepository,
							   AuthoritiesRepository authoritiesRepository,
							   UserService userService,
							   PasswordEncoder passwordEncoder) {
		this.customerRepository = customerRepository;
		this.authoritiesRepository = authoritiesRepository;
		this.userService = userService;
		this.passwordEncoder = passwordEncoder;
	}


	@Transactional
	public void addCustomer(Customer customer) {
		customer.getUserInfo().setEnabled(true);
		customer.getUserInfo().setPassword(passwordEncoder.encode(customer.getUserInfo().getPassword()));

		Authorities authorities = new Authorities();
		authorities.setRole("ROLE_USER");
		authorities.setEmailId(customer.getUserInfo().getEmailId());

		customerRepository.save(customer);
		authoritiesRepository.save(authorities);
	}

	public List<Customer> getAllCustomers() {

		return customerRepository.findAll();
	}

	public Customer getCustomerByEmailId(String emailId) {
		return userService.getUserByEmail(emailId).getCustomer();
	}

}
