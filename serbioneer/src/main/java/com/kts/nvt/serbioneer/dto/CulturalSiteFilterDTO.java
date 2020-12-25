package com.kts.nvt.serbioneer.dto;

import java.util.Date;

import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
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
