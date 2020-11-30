package com.kts.nvt.serbioneer.dto;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminDTO {

	private Long id;

	@NotBlank(message = "Name cannot be empty.")
    private String name;

	@NotBlank(message = "Surname cannot be empty.")
    private String surname;

    @NotBlank(message = "Email cannot be empty.")
    private String email;

    @NotBlank(message = "Password cannot be empty.")
    private String password;
    
    private Date dateOfBirth;

	public AdminDTO(Long id, @NotBlank(message = "Name cannot be empty.") String name,
			@NotBlank(message = "Surname cannot be empty.") String surname,
			@NotBlank(message = "Email cannot be empty.") String email,
			@NotBlank(message = "Password cannot be empty.") String password) {
		super();
		this.id = id;
		this.name = name;
		this.surname = surname;
		this.email = email;
		this.password = password;
		this.dateOfBirth = null;
	}
    
    
}
