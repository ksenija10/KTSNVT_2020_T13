package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthenticatedUserDTO {
	
	private Long id;

	@NotBlank(message = "Name cannot be empty.")
    private String name;

	@NotBlank(message = "Surname cannot be empty.")
    private String surname;

	@NotBlank(message = "Email cannot be empty.")
	@Email(message = "Poorly formated email address.")
    private String email;

	@NotBlank(message = "Password cannot be empty.")
    private String password;
    
}
