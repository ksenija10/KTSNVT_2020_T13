package com.kts.nvt.serbioneer.helper;

import com.kts.nvt.serbioneer.dto.CommentDTO;
import com.kts.nvt.serbioneer.model.Comment;

import java.util.ArrayList;
import java.util.List;

public class CommentMapper implements MapperInterface<Comment, CommentDTO>{

    @Override
    public Comment toEntity(CommentDTO dto) {
        return null;
    }

    @Override
    public CommentDTO toDto(Comment entity) {
        return new CommentDTO(entity.getId(), entity.getText(), entity.getAuthenticatedUser().getName(),
                entity.getAuthenticatedUser().getSurname(), entity.getAuthenticatedUser().getEmail(),
                entity.getCulturalSite().getName(), entity.isApproved());
    }

    @Override
    public List<Comment> toEntityList(List<CommentDTO> dtoList) {
        return null;
    }

    @Override
    public List<CommentDTO> toDtoList(List<Comment> entityList) {
        List<CommentDTO> commentDTOS = new ArrayList<CommentDTO>();

        for(Comment entity : entityList){
            commentDTOS.add(toDto(entity));
        }

        return commentDTOS;
    }
}
