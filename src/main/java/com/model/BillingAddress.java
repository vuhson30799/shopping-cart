package com.model;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Data
@ToString(exclude="customer")
@Table(name = "billing_address")
public class BillingAddress implements Serializable {

	private static final long serialVersionUID = 1028098616457762743L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long billingAddressId;

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

	@OneToOne(mappedBy = "billingAddress")
	private Customer customer;

}
