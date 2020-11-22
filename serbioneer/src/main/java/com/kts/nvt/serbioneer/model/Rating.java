package com.kts.nvt.serbioneer.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

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
@Table(name = "rating")
public class Rating {
	
	@Getter
	@Setter
	@NonNull
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Getter
	@Setter
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
}
