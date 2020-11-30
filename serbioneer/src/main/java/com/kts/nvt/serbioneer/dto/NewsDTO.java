package com.kts.nvt.serbioneer.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import javax.validation.constraints.NotBlank;
import java.util.Date;

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
