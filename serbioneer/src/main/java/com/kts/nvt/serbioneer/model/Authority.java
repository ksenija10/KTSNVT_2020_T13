package com.kts.nvt.serbioneer.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
@Entity
@Table(name="authority")
public class Authority {

	@Getter
	@NonNull
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Getter
	@NonNull
	@Column(name="name")
	private String name;

	/*
	 * @Getter private Set<User> users;
	 */
}
