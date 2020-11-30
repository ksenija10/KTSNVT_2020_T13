package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Digits;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RatingDTO {

	private Long id;
	
	@NotBlank(message = "Rating value cannot be empty")
	@Digits(fraction = 0, integer = 50)
	private int value;
	
	@Digits(fraction = 0, integer = 50)
	@NotNull
	private Long culturalSiteId;
	
	@Digits(fraction = 0, integer = 50)
	@NotNull
	private Long authenticatedUserId;
}
