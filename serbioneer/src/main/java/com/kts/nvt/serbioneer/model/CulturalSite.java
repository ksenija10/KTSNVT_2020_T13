package com.kts.nvt.serbioneer.model;

import java.util.Set;
import java.util.UUID;

public class CulturalSite {
	
	private UUID id;
	private String name;
	private double lat;
	private double lng;
	private String address;
	private String city;
	private String description;
	private double rating;

	private CulturalCategoryType culturalCategoryType;
	
	private CulturalSiteCategory culturalSiteCategory;
	
	private Set<News> news;
	
	private Set<Image> images;
	
	private Set<Rating> ratings;
	
	private Set<Comment> comments;
	
	private Set<AuthenticatedUser> subscribedUsers;
}
