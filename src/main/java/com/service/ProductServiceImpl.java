package com.service;

import com.exception.ApplicationException;
import com.model.Product;
import com.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

@Service(value = "productService")
public class ProductServiceImpl implements ProductService {
    @Value("${project.root.src}")
    private String projectRoot;

    @Value("${resource.location.src}")
    private String resourceLocation;

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
        try {
        	Product product = getProductById(productId);
            Files.delete(Path.of(projectRoot + resourceLocation + product.getImage()));
        } catch (IOException e) {
            throw new ApplicationException(e.getMessage());
        }
        productRepository.deleteById(productId);
    }

    public void addProduct(Product product) {
        MultipartFile image = product.getProductImage();
        if (image != null && !image.isEmpty()) {
            try {
            	String imagePath = projectRoot + resourceLocation + image.getOriginalFilename();
                image.transferTo(new File(imagePath));
				product.setImage(image.getOriginalFilename());
            } catch (IllegalStateException | IOException e) {
                throw new ApplicationException(e.getMessage());
            }
        }
        productRepository.save(product);
    }

    public void editProduct(Product product) {
        productRepository.save(product);
    }
}
