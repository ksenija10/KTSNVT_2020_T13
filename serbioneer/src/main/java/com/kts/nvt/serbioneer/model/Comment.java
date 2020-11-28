package com.kts.nvt.serbioneer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Data

@Entity
@Table(name = "comment")
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NonNull
	@Column(name = "text", nullable = false, unique = false)
	private String text;

	@NonNull
	@Column(name = "approved", nullable = false, unique = false)
	private boolean approved;

	@NonNull
	@ManyToOne
	@JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
	private AuthenticatedUser authenticatedUser;

	@NonNull
	@ManyToOne
	@JoinColumn(name = "site_id", referencedColumnName = "id", nullable = false)
	private CulturalSite culturalSite;

	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "comment")
	private Set<Image> images;

}
