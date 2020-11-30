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
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode

@Entity
@DiscriminatorValue("Admin")
public class Admin extends User {

	@Getter
	@Setter
	@Column(name = "birthday", nullable = true, unique = false)
	private Date dateOfBirth;

	public Admin(@NonNull Long id, @NonNull String name, @NonNull String surname, @NonNull String email,
			@NonNull String password, Date dateOfBirth) {
		super(id, name, surname, email, password);
		this.dateOfBirth = dateOfBirth;
	}

}
