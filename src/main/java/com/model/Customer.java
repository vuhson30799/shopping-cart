package com.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.utils.CartState;
import lombok.Data;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Data
@Table(name = "customer")
public class Customer implements Serializable {

	private static final long serialVersionUID = 2652327633296064143L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long customerId;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "customer_phone")
	private String customerPhone;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "shipping_address_id")
	private ShippingAddress shippingAddress;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "billing_address_id")
	private BillingAddress billingAddress;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User userInfo;

	@OneToMany(mappedBy = "customer")
	@LazyCollection(LazyCollectionOption.FALSE)
	@JsonIgnore
	private List<Cart> carts;

	public Cart getAvailableCart() {
		return carts.stream()
				.filter(cart -> CartState.AVAILABLE.name().equals(cart.getStatus()))
				.findFirst()
				.orElseThrow();
	}
}
