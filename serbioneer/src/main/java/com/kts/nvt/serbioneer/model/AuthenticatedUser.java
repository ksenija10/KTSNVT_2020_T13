package com.kts.nvt.serbioneer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode

@Entity
@DiscriminatorValue("AuthenticatedUser")
public class AuthenticatedUser extends User {

	@Getter
	@Setter
	// cascadeType = None, ne zelimo propagaciju nijedne operacije
	// (entiteti su u potpunosti nepovezani, nema smisla propagirati)
	@ManyToMany(fetch = FetchType.LAZY, mappedBy = "subscribedUsers")
	private Set<CulturalSite> subscribedSites;

	@Getter
	@Setter
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "authenticatedUser")
	private Set<Comment> comments;

	@Getter
	@Setter
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "authenticatedUser")
	private Set<Rating> ratings;
	
}
