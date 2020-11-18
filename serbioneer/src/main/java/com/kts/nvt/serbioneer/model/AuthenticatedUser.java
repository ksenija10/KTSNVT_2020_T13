package com.kts.nvt.serbioneer.model;

import java.util.Set;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class AuthenticatedUser extends User {

	@Getter
	private Set<CulturalSite> subscribedSites;

	@Getter
	private Set<Comment> comments;

	@Getter
	private Set<Rating> ratings;
}
