package com.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Data
@ToString(exclude = {"product", "cart"})
@Table(name = "cart_item")
public class CartItem implements Serializable {

	private static final long serialVersionUID = -2455760938054036364L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cartItemId;

	@Column(name = "quality")
	private int quality;

	@Column(name = "price")
	private double price;

	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;

	@ManyToOne
	@JoinColumn(name = "cart_id")
	@JsonIgnore
	private Cart cart;

}
