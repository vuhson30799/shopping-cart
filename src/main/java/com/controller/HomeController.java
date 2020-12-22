package com.controller;

import javax.validation.Valid;

import com.model.Product;
import com.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.model.Queries;
import com.service.QueriesService;

import java.util.List;

@Controller
public class HomeController {
	private final ProductService productService;
	private final QueriesService queryService;

	public HomeController(ProductService productService, QueriesService queryService) {
		this.productService = productService;
		this.queryService = queryService;
	}


	@GetMapping({ "/", "/home" })
	public String home(Model model) {
		List<Product> products = productService.getAllProducts();
		model.addAttribute("products", products);
		return "home";
	}

	@GetMapping("/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model) {
		if (error != null)
			model.addAttribute("error", "Invalid username and Password");
		if (logout != null)
			model.addAttribute("logout", "You have logged out successfully");
		return "login";
	}

	@GetMapping("/aboutus")
	public String sayAbout() {
		return "aboutUs";
	}

	@GetMapping(value = "/contactus")
	public ModelAndView getQuery() {
		Queries query = new Queries();
		return new ModelAndView("contactUs", "contact", query);
	}

	@PostMapping(value = "/contactus")
	public String addQuery(@Valid @ModelAttribute(value = "contact") Queries query, Model model, BindingResult result) {

		if (result.hasErrors())
			return "contactUs";

		queryService.addQuery(query);
		model.addAttribute("querySuccess",
				"Thank you, Your Message stored in our Server we will contact through corresponding Mail");
		return "login";

	}
}
