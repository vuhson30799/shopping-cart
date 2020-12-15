package com.model;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Data
@Table(name = "customer_order")
public class CustomerOrder implements Serializable {

	private static final long serialVersionUID = -6571020025726257848L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long customerOrderId;

	@OneToOne
	@JoinColumn(name = "cart_id")
	private Cart cart;

	@OneToOne
	@JoinColumn(name = "customer_id")
	private Customer customer;

	@OneToOne
	@JoinColumn(name = "shipping_address_id")
	private ShippingAddress shippingAddress;

	@OneToOne
	@JoinColumn(name = "billing_address_id")
	private BillingAddress billingAddress;

}
