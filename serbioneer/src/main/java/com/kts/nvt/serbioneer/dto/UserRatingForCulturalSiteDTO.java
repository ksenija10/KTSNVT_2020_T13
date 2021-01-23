package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.Digits;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserRatingForCulturalSiteDTO {

	private Long id;
	
	@Digits(fraction = 0, integer = 1)
	private int value;
	
	private Long culturalSiteId;
	
	private String authenticatedUserEmail;
}
