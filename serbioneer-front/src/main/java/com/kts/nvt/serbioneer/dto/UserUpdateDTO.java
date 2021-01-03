package com.kts.nvt.serbioneer.dto;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserUpdateDTO {

    private Long id;

    @NotBlank(message = "Name cannot be empty.")
    private String name;

    @NotBlank(message = "Surname cannot be empty.")
    private String surname;

    private Date dateOfBirth;

    public UserUpdateDTO(@NotBlank(message = "Name cannot be empty.") String name,
                         @NotBlank(message = "Surname cannot be empty.") String surname, Date dateOfBirth) {
        this.name = name;
        this.surname = surname;
        this.dateOfBirth = dateOfBirth;
    }
}
