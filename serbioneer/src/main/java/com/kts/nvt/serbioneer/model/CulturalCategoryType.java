package com.kts.nvt.serbioneer.model;

import java.util.Set;
import java.util.UUID;

public class CulturalCategoryType {

	private UUID id;
	private String name;
	
	private Set<CulturalSite> culturalSites;
	
	private CulturalSiteCategory culturalSiteCategory;
}
