package com.service;

import com.dto.CustomerOrderDTO;
import com.model.CustomerOrder;

import java.util.List;

public interface CustomerOrderService {

	void addCustomerOrder(Long cartId);
	List<CustomerOrder> getCustomerOrderByCart(Long cartId);
	void cancelCustomerOrder(Long cartId);
	void collectCustomerInfo(CustomerOrderDTO customerOrderDTO);
	void submitCustomerOrder(Long customerOrderId);
	double getCustomerOrderGrandTotal(Long cartId);
}
