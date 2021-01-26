package com.kts.nvt.serbioneer.helper;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

import com.kts.nvt.serbioneer.dto.CommentDTO;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.Image;

public class CommentMapper implements MapperInterface<Comment, CommentDTO>{

	private ImageMapper imageMapper = new ImageMapper();
	
    @Override
    public Comment toEntity(CommentDTO dto) {
        return new Comment(dto.getText(), dto.isApproved());
    }
    
    @Override
    public CommentDTO toDto(Comment entity) {
    	if(entity.getImages() == null) {
    		entity.setImages(new HashSet<Image>());
    	}
        return new CommentDTO(entity.getId(), entity.getText(), entity.getAuthenticatedUser().getName(),
                entity.getAuthenticatedUser().getSurname(), entity.getAuthenticatedUser().getEmail(),
                entity.getCulturalSite().getName(), entity.isApproved(), imageMapper.toDtoList(new ArrayList<>(entity.getImages())));
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
