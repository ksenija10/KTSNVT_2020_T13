package com.kts.nvt.serbioneer.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AuthenticatedUserDTO {
	
	private Long id;

    private String name;

    private String surname;

    private String email;

    private String password;
    
}
