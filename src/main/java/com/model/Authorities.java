package com.model;

import lombok.Data;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Data
@Table(name = "authorities")
public class Authorities implements Serializable {

	private static final long serialVersionUID = 8734140534986494039L;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long authorityId;

	@Column(name = "email_id")
	private String emailId;

	@Column(name = "role")
	private String role;

}
