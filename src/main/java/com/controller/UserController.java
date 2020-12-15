package com.controller;

import com.model.BillingAddress;
import com.model.Customer;
import com.model.ShippingAddress;
import com.model.User;
import com.service.CustomerService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class UserController {
	private final CustomerService customerService;

	public UserController(CustomerService customerService) {
		this.customerService = customerService;
	}

	@GetMapping(value = "/customer/registration")
	public ModelAndView getRegistrationForm() {
		Customer customer = new Customer();
		User user = new User();
		BillingAddress ba = new BillingAddress();
		ShippingAddress sa = new ShippingAddress();
		customer.setShippingAddress(sa);
		customer.setBillingAddress(ba);
		customer.setUserInfo(user);

		return new ModelAndView("register", "customer", customer);
	}

	// to insert the data
	@PostMapping(value = "/customer/registration")
	public String registerCustomer(@Valid @ModelAttribute(value = "customer") Customer customer,
								   Model model,
								   BindingResult result) {
		if (result.hasErrors()) {
			return "register";
		}
		customerService.addCustomer(customer);
		model.addAttribute("registrationSuccess", "Registered Successfully. Login using username and password");
		return "login";
	}
}
