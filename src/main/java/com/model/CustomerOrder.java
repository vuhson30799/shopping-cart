package com.model;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

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
}
