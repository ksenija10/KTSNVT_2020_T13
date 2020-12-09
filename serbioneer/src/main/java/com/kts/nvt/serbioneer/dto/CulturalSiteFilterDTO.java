package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class CulturalSiteFilterDTO {

	@NotNull
	private String categoryName;
	
	@NotNull
	private String categoryTypeName;
	
	@NotNull
	private String culturalSiteName;
	
	/*@NotNull
	private List<String> location;*/
	
	@NotNull
	private String location;
}