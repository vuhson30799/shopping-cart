package com.controller;

import com.dto.CustomerOrderDTO;
import com.exception.ApplicationException;
import com.model.CustomerOrder;
import com.service.CustomerOrderService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class OrderController {
	private final CustomerOrderService customerOrderService;

	public OrderController(CustomerOrderService customerOrderService) {
		this.customerOrderService = customerOrderService;
	}

	@RequestMapping("/order/{cartId}")
	public String createOrder(@PathVariable("cartId") Long cartId) {
        customerOrderService.addCustomerOrder(cartId);
		return "redirect:/checkout?cartId=" + cartId;
	}

	@GetMapping("/checkout")
	public ModelAndView checkout(@RequestParam("cartId") Long cartId) {
		List<CustomerOrder> customerOrders = customerOrderService.getCustomerOrderByCart(cartId);
		if (customerOrders.isEmpty()) {
			throw new ApplicationException("This customer order is not exist");
		}

		return new ModelAndView("checkout/collectCustomerInfo", "customerOrder", customerOrders.get(0));
	}

	@GetMapping("/order/cancel/{cartId}")
	public ResponseEntity<String> cancel(@PathVariable("cartId")Long cartId) {
		try {
			customerOrderService.cancelCustomerOrder(cartId);
			return new ResponseEntity<>(HttpStatus.OK);
		}catch (Exception e) {
			return new ResponseEntity<>(e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping("/order/collectCustomerInfo")
	public ResponseEntity<String> collectCustomerInfo(@RequestBody CustomerOrderDTO customerOrderDTO) {
		customerOrderService.collectCustomerInfo(customerOrderDTO);
		return new ResponseEntity<>(HttpStatus.OK);

	}

	@GetMapping("/order/confirm/{cartId}")
	public ModelAndView getConfirmation(@PathVariable("cartId") Long cartId) {
		return new ModelAndView("/checkout/orderConfirmation", "order", customerOrderService.getCustomerOrderByCart(cartId).get(0));
	}

	@PostMapping("/order/submit/{customerOrderId}")
	public ResponseEntity<String> submitOrder(@PathVariable("customerOrderId") Long customerOrderId) {
		customerOrderService.submitCustomerOrder(customerOrderId);
		return new ResponseEntity<>("/checkout/thankCustomer", HttpStatus.OK);
	}

	@GetMapping("/order/thanks")
	public String thankYou() {
		return "/checkout/thankCustomer";
	}
}
