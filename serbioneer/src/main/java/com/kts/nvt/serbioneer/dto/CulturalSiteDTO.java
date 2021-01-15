package com.kts.nvt.serbioneer.dto;

import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import com.kts.nvt.serbioneer.model.Image;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@NoArgsConstructor
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
	@Pattern(regexp = "([A-Z]{1}[a-z]+)(\\s[A-Z]{1}[a-z]+)*", message = "City name must begin with a capital letter.")
	private String city;
	
	private String description;

	private double rating;
	
	private List<ImageDTO> images;

	public CulturalSiteDTO(Long id,
			@NotBlank(message = "Cultural site name cannot be empty.") String name,
			Long categoryId, String category,
			Long categoryTypeId, String categoryType,
			@DecimalMin("42.433") @DecimalMax("46.183") double lat,
			@DecimalMin("18.850") @DecimalMax("23.017") double lng,
			@NotBlank(message = "Cultural site address cannot be empty.") String address,
			@NotBlank(message = "Cultural site city cannot be empty.") String city,
			String description, double rating) {
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
		this.rating = rating;
	}

	public CulturalSiteDTO(Long id2, @NonNull String name2, Long id3, @NonNull String name3, Long id4,
			@NonNull String name4, double lat2, double lng2, @NonNull String address2, @NonNull String city2,
			String description2, double rating2, List<ImageDTO> dtoList) {
		this.id = id2;
		this.name = name2;
		this.categoryId = id3;
		this.category = name3;
		this.categoryTypeId = id4;
		this.categoryType = name4;
		this.lat = lat2;
		this.lng = lng2;
		this.address = address2;
		this.city = city2;
		this.description = description2;
		this.rating = rating2;
		this.images = dtoList;
	}
}
