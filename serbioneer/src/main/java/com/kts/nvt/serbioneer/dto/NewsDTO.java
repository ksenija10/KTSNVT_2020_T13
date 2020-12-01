package com.kts.nvt.serbioneer.dto;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NewsDTO {

    private Long id;

    @NotBlank(message = "News information can not be empty.")
    private String information;

    private Date dateTime;

    private String culturalSiteName;

    public NewsDTO(@NotBlank(message = "News information can not be empty.") String information, Date dateTime, String culturalSiteName) {
        this.information = information;
        this.dateTime = dateTime;
        this.culturalSiteName = culturalSiteName;
    }
}
