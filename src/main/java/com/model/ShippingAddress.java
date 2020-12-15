package com.model;

import lombok.Data;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Data
@Table(name = "shipping_address")
public class ShippingAddress implements Serializable {

	private static final long serialVersionUID = 7551999649936522523L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long shippingAddressId;

	@Column(name = "address")
	private String address;

		@Column(name = "city")
	private String city;

	@Column(name = "state")
	private String state;

	@Column(name = "zipcode")
	private String zipcode;

	@Column(name = "country")
	private String country;

	@OneToOne(mappedBy = "shippingAddress")
	private Customer customer;

}
