package com.kts.nvt.serbioneer.model;

import java.util.Set;
import java.util.UUID;

public class Comment {
	
	private UUID id;
	private String value;

	private AuthenticatedUser authanticatedUser;
	
	private Set<Image> images;
	
	private CulturalSite culturalSite;
}
