package com.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import lombok.ToString;

@Entity
@Data
@ToString(exclude = {"customer", "cartItem"})
@Table(name = "cart")
public class Cart implements Serializable {

	private static final long serialVersionUID = 8436097833452420298L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cartId;

	@OneToOne(mappedBy = "cart")
	@JsonIgnore
	private Customer customer;

	@OneToMany(mappedBy = "cart", fetch = FetchType.EAGER)
	private List<CartItem> cartItem;
}
