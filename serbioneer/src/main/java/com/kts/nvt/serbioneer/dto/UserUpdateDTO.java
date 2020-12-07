package com.kts.nvt.serbioneer.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
public class UserUpdateDTO {

    @Getter
    @Setter
    private Long id;

    @Getter
    @Setter
    @NotBlank(message = "Name cannot be empty.")
    private String name;

    @Getter
    @Setter
    @NotBlank(message = "Surname cannot be empty.")
    private String surname;

    @Getter
    @Setter
    private Date dateOfBirth;

    public UserUpdateDTO(@NotBlank(message = "Name cannot be empty.") String name,
                         @NotBlank(message = "Surname cannot be empty.") String surname, Date dateOfBirth) {
        this.name = name;
        this.surname = surname;
        this.dateOfBirth = dateOfBirth;
    }
}
