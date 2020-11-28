package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CulturalSiteCategoryDTO {
	
	private Long id;
	
	@NotBlank(message = "Category name cannot be empty.")
	private String name;
	
	public CulturalSiteCategoryDTO(Long id, @NotBlank(message = "Category name cannot be empty.") String name) {
		this.id = id;
		this.name = name;
	}
}
