package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.Email;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserLoginDTO {

	@Email(message = "Poorly formated email address.")
    private String username;
    private String password;
}
