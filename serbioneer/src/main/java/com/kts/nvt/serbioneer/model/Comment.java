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
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

@AllArgsConstructor
@RequiredArgsConstructor

@Entity
@Table(name = "comment")
@SQLDelete(sql =
"UPDATE comment " +
"SET is_active = false " +
"WHERE id = ?")
@Where(clause="is_active=true")
public class Comment {

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
	@NonNull
	@Column(name = "text", nullable = false, unique = false)
	private String text;

	@Getter
	@Setter
	//@NonNull -> primitivan tip ne moze biti null
	@Column(name = "approved", nullable = false, unique = false)
	private boolean approved;

	@Getter
	@Setter
	@NonNull
	@ManyToOne
	@JoinColumn(name = "user_id", referencedColumnName = "id", nullable = false)
	private AuthenticatedUser authenticatedUser;

	@Getter
	@Setter
	@NonNull
	@ManyToOne
	@JoinColumn(name = "site_id", referencedColumnName = "id", nullable = false)
	private CulturalSite culturalSite;

	@Getter
	@Setter
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "comment")
	private Set<Image> images;

	public Comment() {
		this.active = true;
	}
	
	public Comment(@NonNull String text) {
		this.text = text;
		this.active = true;
	}
	
	public Comment(@NonNull String text, boolean approved) {
		this.text = text;
		this.approved = approved;
		this.active = true;
	}

	public Comment(@NonNull String text, boolean approved, @NonNull AuthenticatedUser authenticatedUser, @NonNull CulturalSite culturalSite) {
		this.text = text;
		this.approved = approved;
		this.authenticatedUser = authenticatedUser;
		this.culturalSite = culturalSite;
		this.active = true;
	}
}
