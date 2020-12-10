package com.kts.nvt.serbioneer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

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
@DiscriminatorValue("AuthenticatedUser")
public class AuthenticatedUser extends User {

	@Getter
	@Setter
	@Column(name = "activated")
	private boolean activated;

	@Getter
	@Setter
	// cascadeType = None, ne zelimo propagaciju nijedne operacije
	// (entiteti su u potpunosti nepovezani, nema smisla propagirati)
	
	@ManyToMany(cascade= CascadeType.PERSIST, fetch = FetchType.LAZY)
	@JoinTable(
			name = "sites_users", 
			joinColumns = { @JoinColumn(name = "user_id", referencedColumnName = "id") }, 
			inverseJoinColumns = { @JoinColumn(name = "site_id", referencedColumnName = "id") }
			)
	private Set<CulturalSite> subscribedSites;

	@Getter
	@Setter
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "authenticatedUser")
	private Set<Comment> comments;

	@Getter
	@Setter
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "authenticatedUser")
	private Set<Rating> ratings;

	public AuthenticatedUser() {
		super();
	}
	
	public AuthenticatedUser(Long id, @NonNull String name, @NonNull String surname, @NonNull String email,
			@NonNull String password, boolean activated) {
		super(id, name, surname, email, password);
		this.activated = activated;
	}
	
	public void addSubscribedSite(CulturalSite culturalSite) {
		subscribedSites.add(culturalSite);
	}

	public void removeSubscribedSite(CulturalSite culturalSite) {
		subscribedSites.remove(culturalSite);
	}
	
}
