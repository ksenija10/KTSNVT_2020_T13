package com.kts.nvt.serbioneer.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@AllArgsConstructor
@NoArgsConstructor
public class PasswordDTO {

    @Getter
    @Setter
    @NotBlank(message = "Old password cannot be empty.")
    private String oldPassword;

    @Getter
    @Setter
    @NotBlank(message = "New password cannot be empty.")
    private String newPassword;

    @Getter
    @Setter
    @NotBlank(message = "Repeated password cannot be empty.")
    private String repeatedPassword;


}
