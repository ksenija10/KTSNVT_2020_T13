package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
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

	private boolean activated;

	public AuthenticatedUserDTO(Long id, @NotBlank(message = "Name cannot be empty.") String name,
								@NotBlank(message = "Surname cannot be empty.") String surname,
								@NotBlank(message = "Email cannot be empty.")
								@Email(message = "Poorly formated email address.") String email,
								@NotBlank(message = "Password cannot be empty.") String password, boolean activated) {
		this.id = id;
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.password = password;
		this.activated = activated;
	}
}
