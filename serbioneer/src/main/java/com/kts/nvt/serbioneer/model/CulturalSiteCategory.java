package com.kts.nvt.serbioneer.model;

import java.util.Set;
import java.util.UUID;

public class CulturalSiteCategory {

	private UUID id;
	private String name;
	
	private Set<CulturalCategoryType> culturalCategoryTypes;
	
	private Set<CulturalSite> culturalSites;
}
