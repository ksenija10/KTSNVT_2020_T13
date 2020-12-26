package com.kts.nvt.serbioneer.model;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Objects;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@AllArgsConstructor
@RequiredArgsConstructor

@Entity
@Table(name="users")
@SQLDelete(sql =
"UPDATE users " +
"SET is_active = false " +
"WHERE id = ?")
@Where(clause="is_active=true")
@Inheritance(strategy= InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="type", discriminatorType= DiscriminatorType.STRING)
public abstract class User implements UserDetails {

	@Transient
	private static final long serialVersionUID = 1L;

	@Getter
	@Setter
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;
	
	@Getter
	@Setter
	@Column(name="is_active")
	private Boolean active;
	
	@Getter
	@Setter
	@NonNull
	@Column(name = "name", nullable = false, unique = false)
	private String name;
	
	@Getter
	@Setter
	@NonNull
	@Column(name = "surname", nullable = false, unique = false)
	private String surname;
	
	@Getter
	@Setter
	@NonNull
	@Column(name = "email", nullable = false, unique = false)
	private String email;
	
	@Getter
	@NonNull
	@Column(name = "password", nullable = false, unique = false)
	private String password;

	@Getter
	@Setter
	@Column(name = "last_password_reset_date")
	private Timestamp lastPasswordResetDate;
	
	@Getter
	@Setter
	@ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "user_authority",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "authority_id", referencedColumnName = "id"))
	private Set<Authority> authorities;

	@Override
	public String getUsername() {
		return email;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}


	public void setPassword(String password) {
		Timestamp now = new Timestamp(new Date().getTime());
		this.setLastPasswordResetDate(now);
		this.password = password;
	}

	public User() {
		this.active = true;
	}
	
	public User(Long id, @NonNull String name, @NonNull String surname, @NonNull String email, @NonNull String password) {
		this.id = id;
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.password = password;
		this.active = true;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		User user = (User) o;
		return email.equals(user.email);
	}

	@Override
	public int hashCode() {
		return Objects.hash(email);
	}
}
