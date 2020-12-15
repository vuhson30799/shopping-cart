package com.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Data
@Table(name = "queries")
public class Queries {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "email")
	private String email;

	@Column(name = "subject")
	private String subject;

	@Column(name = "message")
	private String message;

}
