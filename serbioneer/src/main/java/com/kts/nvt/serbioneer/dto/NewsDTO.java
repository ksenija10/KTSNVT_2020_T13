package com.kts.nvt.serbioneer.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class NewsDTO {

    private Long id;

    private String information;

    private Date dateTime;

    private String culturalSiteName;

    public NewsDTO(String information, Date dateTime, String culturalSiteName) {
        this.information = information;
        this.dateTime = dateTime;
        this.culturalSiteName = culturalSiteName;
    }
}
