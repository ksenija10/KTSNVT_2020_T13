package com.kts.nvt.serbioneer.helper;

import com.kts.nvt.serbioneer.dto.CommentDTO;
import com.kts.nvt.serbioneer.model.Comment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

import java.util.ArrayList;
import java.util.List;

public class CommentMapper implements MapperInterface<Comment, CommentDTO>{

    @Override
    public Comment toEntity(CommentDTO dto) {
        return new Comment(dto.getText());
    }

    @Override
    public CommentDTO toDto(Comment entity) {
        return new CommentDTO(entity.getId(), entity.getText(), entity.getAuthenticatedUser().getName(),
                entity.getAuthenticatedUser().getSurname(), entity.getAuthenticatedUser().getEmail(),
                entity.getCulturalSite().getName(), entity.isApproved());
    }

    @Override
    public List<Comment> toEntityList(List<CommentDTO> dtoList) {
    	List<Comment> comments = new ArrayList<Comment>();

        for(CommentDTO dto : dtoList){
        	comments.add(toEntity(dto));
        }

        return comments;
    }

    @Override
    public List<CommentDTO> toDtoList(List<Comment> entityList) {
        List<CommentDTO> commentDTOS = new ArrayList<CommentDTO>();

        for(Comment entity : entityList){
            commentDTOS.add(toDto(entity));
        }

        return commentDTOS;
    }

    @Override
    public Page<CommentDTO> toDtoPage(Page<Comment> entityPage) {
        List<CommentDTO> commentDTOList = toDtoList(entityPage.toList());
        return new PageImpl<>(commentDTOList, entityPage.getPageable(), entityPage.getTotalElements());
    }
}
