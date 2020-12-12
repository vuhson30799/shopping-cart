package com.dao;

import java.util.List;

import lombok.RequiredArgsConstructor;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.model.Product;

import javax.persistence.EntityManager;

@Repository(value = "productDao")
@RequiredArgsConstructor
public class ProductDaoImpl implements ProductDao {

	private EntityManager entityManager;

	public List<Product> getAllProducts() {

		List<Product> products = entityManager.createQuery("select Product from Product ", Product.class).getResultList();
		System.out.println("----- List of Products-----");
		System.out.println(products);
		entityManager.flush();
		entityManager.close();
		return products;
	}

	public Product getProductById(String productId) {

		Product product = entityManager.find(Product.class, productId);
		entityManager.close();
		return product;
	}

	public void deleteProduct(String productId) {
		Product product = entityManager.find(Product.class, productId);
		entityManager.remove(product);
		entityManager.flush();
		entityManager.close();
	}

	public void addProduct(Product product) {
		entityManager.persist(product);
		entityManager.close();
	}

	public void editProduct(Product product) {
		entityManager.refresh(product);
		entityManager.flush();
		entityManager.close();
	}

}
