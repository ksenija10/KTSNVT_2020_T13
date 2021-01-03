package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
public class CulturalCategoryTypeDTO {

	private Long id;
	
	@NonNull
	@NotBlank(message = "Category type name cannot be empty.")
	private String name;
	
	private Long categoryId;
	
	private String categoryName;
	
	public CulturalCategoryTypeDTO(Long id, @NotBlank(message = "Category type name cannot be empty.") String name) {
		this.id = id;
		this.name = name;
	}
}
