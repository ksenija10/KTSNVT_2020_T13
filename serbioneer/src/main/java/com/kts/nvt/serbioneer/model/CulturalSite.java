package com.kts.nvt.serbioneer.model;

import java.util.Set;
import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public class CulturalSite {
	
	@Getter
	@NonNull
	private UUID id;
	
	@Getter
	@NonNull
	private String name;
	
	@Getter
	private double lat;
	
	@Getter
	private double lng;
	
	@Getter
	@NonNull
	private String address;
	
	@Getter
	@NonNull
	private String city;
	
	@Getter
	private String description;
	
	@Getter
	private double rating;

	@Getter
	private CulturalCategoryType culturalCategoryType;
	
	@Getter
	private CulturalSiteCategory culturalSiteCategory;
	
	@Getter
	private Set<News> news;
	
	@Getter
	private Set<Image> images;
	
	@Getter
	private Set<Rating> ratings;
	
	@Getter
	private Set<Comment> comments;
	
	@Getter
	private Set<AuthenticatedUser> subscribedUsers;
}
