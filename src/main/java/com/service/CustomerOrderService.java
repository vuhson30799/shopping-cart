package com.service;

import com.dto.CustomerOrderDTO;
import com.model.CustomerOrder;

public interface CustomerOrderService {

	void addCustomerOrder(Long cartId);
	CustomerOrder getCustomerOrderByCart(Long cartId);
	void cancelCustomerOrder(Long cartId);
	void collectCustomerInfo(CustomerOrderDTO customerOrderDTO);
	void submitCustomerOrder(Long customerOrderId);
	void finishCustomerOrder(Long cartId);
	double getCustomerOrderGrandTotal(Long cartId);
}
