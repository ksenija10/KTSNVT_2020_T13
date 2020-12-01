package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class CulturalSiteDTO {

	private Long id;
	
	@NotNull(message = "Cultural site category must be chosen.")
	private Long categoryId;
	private String category;
	
	@NotNull(message = "Cultural category type must be chosen.")
	private Long categoryTypeId;
	private String categoryType;
	
	@NotBlank(message = "Cultural site name cannot be empty.")
	private String name;
	
	@DecimalMin(value = "42.433", message = "Latitude must be grater or equal to 42.433.")
	@DecimalMax(value = "46.183", message = "Latitude must be less or equal to 46.183.")
	private double lat;
	
	@DecimalMin(value = "18.850", message = "Longitude must be grater or equal to 18.850.")
	@DecimalMax(value = "23.017", message = "Longitude must be less or equal to 23.017.")
	private double lng;
	
	@NotBlank(message = "Cultural site address cannot be empty.")
	private String address;

	@NotBlank(message = "Cultural site city cannot be empty.")
	@Pattern(regexp = "[A-Z]{1}[a-z]+", message = "City name must begin with a capital letter.")
	private String city;
	
	private String description;

	public CulturalSiteDTO(Long id,
			@NotBlank(message = "Cultural site name cannot be empty.") String name,
			Long categoryId, String category,
			Long categoryTypeId, String categoryType,
			@DecimalMin("42.433") @DecimalMax("46.183") double lat,
			@DecimalMin("18.850") @DecimalMax("23.017") double lng,
			@NotBlank(message = "Cultural site address cannot be empty.") String address,
			@NotBlank(message = "Cultural site city cannot be empty.") String city,
			String description) {
		this.id = id;
		this.name = name;
		this.categoryId = categoryId;
		this.category = category;
		this.categoryTypeId = categoryTypeId;
		this.categoryType = categoryType;
		this.lat = lat;
		this.lng = lng;
		this.address = address;
		this.city = city;
		this.description = description;
	}
}
