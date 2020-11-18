package com.kts.nvt.serbioneer.model;

import java.util.Date;
import java.util.Set;
import java.util.UUID;

public class News {
	
	private UUID id;
	private String information;
	private Date dateTime;

	private CulturalSite culturalSite;
	
	private Set<Image> images;
}
