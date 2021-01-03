package com.kts.nvt.serbioneer.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentDTO {

    private Long id;

    @NotBlank(message = "Comment text cannot be empty.")
    private String text;

    private String name;

    private String surname;

    private String username;

    private String culturalSiteName;

    private boolean approved;

    public CommentDTO(Long id, @NotBlank(message = "Comment text cannot be empty.") String text) {
        this.id = id;
        this.text = text;
    }
}
