package com.kts.nvt.serbioneer.dto;

import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
    
    private List<ImageDTO> images;

    public CommentDTO(Long id, @NotBlank(message = "Comment text cannot be empty.") String text) {
        this.id = id;
        this.text = text;
        this.approved = true;
    }
    
    public CommentDTO(Long id, @NotBlank(message = "Comment text cannot be empty.") String text,
    		boolean approved) {
        this.id = id;
        this.text = text;
        this.approved = approved;
    }
}
