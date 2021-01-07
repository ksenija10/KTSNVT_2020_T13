package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CulturalSiteFilterDTO {

	/*@NotNull
	private String categoryName;
	
	@NotNull
	private String categoryTypeName;*/
	
	@NotNull
	private String[] categoryNames;
	
	@NotNull
	private String culturalSiteName;
	
	@NotNull
	private String location;
}
