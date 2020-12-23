package com.service;

import java.util.List;

import com.model.Product;
import org.springframework.data.domain.Page;

public interface ProductService {

	List<Product> getAllProducts();

	Page<Product> getAllProducts(int page, int size);

	Product getProductById(Long productId);

	void deleteProduct(Long productId);
	
	void addProduct(Product product);
	
	void editProduct(Product product);
}
