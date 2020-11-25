package com.kts.nvt.serbioneer.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode

@Entity
@DiscriminatorValue("AuthenticatedUser")
public class Admin extends User {

	@Getter
	@NonNull
	@Column(name = "birthday", nullable = false, unique = false)
	private Date dateOfBirth;

}
