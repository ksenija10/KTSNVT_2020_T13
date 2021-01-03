package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImageDTO {

	private Long id;

	@NotBlank(message = "Image name cannot be empty")
	@NotNull
	private String name;

	@NotBlank(message = "Image content cannot be empty")
	@NotNull
	private byte[] content;

}
