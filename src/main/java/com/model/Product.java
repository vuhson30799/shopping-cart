package com.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

@Entity
@Data
@Table(name = "product")
@NoArgsConstructor
public class Product implements Serializable {

	private static final long serialVersionUID = 5186013952828648626L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long productId;

	@Column(name="category")
	private String productCategory;
	
	@Column(name = "description")
	private String productDescription;
	
	@Column(name = "manufacturer")
	private String productManufacturer;
	
	@NotEmpty(message = "Product Name is mandatory")
	@Column(name = "name")
	private String productName;
	
	@NotNull(message="Please provide some price")
	@Min(value = 100, message = "Minimum value should be greater than 100")
	@Column(name = "price")
	private double productPrice;
	
	@Column(name = "unit")
	private String unitStock;

	@Transient
	private MultipartFile productImage;

	public Product(Long productId, String productCategory, String productDescription, String productManufacturer, String productName, double productPrice, String unitStock) {
		this.productId = productId;
		this.productCategory = productCategory;
		this.productDescription = productDescription;
		this.productManufacturer = productManufacturer;
		this.productName = productName;
		this.productPrice = productPrice;
		this.unitStock = unitStock;
	}
}
