package com.service;

import com.model.Product;
import com.repository.ProductRepository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service(value="productService")
public class ProductServiceImpl implements ProductService {
	private final ProductRepository productRepository;

	public ProductServiceImpl(ProductRepository productRepository) {
		this.productRepository = productRepository;
	}

	@Transactional
	public List<Product> getAllProducts() {
		return productRepository.findAll();
	}

	
	public Product getProductById(Long productId) {
		return productRepository.findById(productId).orElseThrow();
	}

	
	public void deleteProduct(Long productId) {
		productRepository.deleteById(productId);
	}
	
	public void addProduct(Product product){
		productRepository.save(product);
	}
	
	public void editProduct(Product product){
		productRepository.save(product);
	}

}
