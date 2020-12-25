package com.kts.nvt.serbioneer.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.Objects;

@AllArgsConstructor
@RequiredArgsConstructor

@Entity
@Table(name = "rating")
@SQLDelete(sql =
"UPDATE rating " +
"SET is_active = false " +
"WHERE id = ?")
@Where(clause="is_active=true")
public class Rating {
	
	@Getter
	@Setter
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Getter
	@Setter
	@Column(name="is_active")
	private Boolean active;
	
	@Getter
	@Setter
	@NonNull // -> primitivan tip ne moze biti null, ali neophodno zbog konstruktora!
	@Column(name = "value", nullable = false, unique = false)
	private int value;

	@Getter
	@Setter
	@NonNull
	@ManyToOne
	@JoinColumn(name = "site_id", referencedColumnName = "id", nullable = false)
	private CulturalSite culturalSite;
	
	@Getter
	@Setter
	@NonNull
	@ManyToOne
	@JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
	private AuthenticatedUser authenticatedUser;

	public Rating() {
		this.active = true;
	}
	
	public Rating(@NonNull int value) {
		this.value = value;
		this.active = true;
	}

	@Override
	public String toString() {
		return "Rating{" +
				"id=" + id +
				", active=" + active +
				", value=" + value +
				", culturalSite=" + culturalSite +
				", authenticatedUser=" + authenticatedUser +
				'}';
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Rating rating = (Rating) o;
		return value == rating.value && culturalSite.equals(rating.culturalSite) && authenticatedUser.equals(rating.authenticatedUser);
	}

	@Override
	public int hashCode() {
		return Objects.hash(value, culturalSite, authenticatedUser);
	}
}
