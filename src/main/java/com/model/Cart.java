package com.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.utils.CartState;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Entity
@Data
@ToString(exclude = {"customer", "cartItem"})
@Table(name = "cart")
@NoArgsConstructor
public class Cart implements Serializable {

	private static final long serialVersionUID = 8436097833452420298L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long cartId;

	@ManyToOne
	@JoinColumn(name = "customer_id")
	@JsonIgnore
	private Customer customer;

	@Column(name = "status")
	private String status;

	@OneToMany(mappedBy = "cart", fetch = FetchType.EAGER)
	private List<CartItem> cartItem;

	public Cart(Customer customer) {
		this.setCustomer(customer);
		this.setStatus(CartState.AVAILABLE.name());
	}
}
