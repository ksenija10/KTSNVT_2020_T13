package com.kts.nvt.serbioneer.dto;

import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminDTO {

	private Long id;

    private String name;

    private String surname;

    private String email;

    private String password;
    
    private Date dateOfBirth;
    
}
