package com.kts.nvt.serbioneer.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Transient;

import org.hibernate.annotations.SQLDelete;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@ToString

@Entity
@SQLDelete(sql =
"UPDATE users " +
"SET is_active = false " +
"WHERE id = ?")
@DiscriminatorValue("Admin")
public class Admin extends User {

	@Transient
	private static final long serialVersionUID = 1L;
	
	@Getter
	@Setter
	@Column(name = "birthday", nullable = true, unique = false)
	private Date dateOfBirth;

	public Admin() {
		super();
	}
	
	public Admin(Long id, @NonNull String name, @NonNull String surname, @NonNull String email,
			@NonNull String password, Date dateOfBirth) {
		super(id, name, surname, email, password);
		this.dateOfBirth = dateOfBirth;
	}

}
