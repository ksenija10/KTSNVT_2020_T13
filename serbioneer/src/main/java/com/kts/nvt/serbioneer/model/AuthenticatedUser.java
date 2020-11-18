package com.kts.nvt.serbioneer.model;

import java.util.Set;

public class AuthenticatedUser extends User{

	private Set<CulturalSite> subscribedSites;
	
	private Set<Comment> comments;
	
	private Set<Rating> ratings;
}
