package com.kts.nvt.serbioneer.dto;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PasswordDTO {

    @NotBlank(message = "Old password cannot be empty.")
    private String oldPassword;

    @NotBlank(message = "New password cannot be empty.")
    private String newPassword;

    @NotBlank(message = "Repeated password cannot be empty.")
    private String repeatedPassword;


}
