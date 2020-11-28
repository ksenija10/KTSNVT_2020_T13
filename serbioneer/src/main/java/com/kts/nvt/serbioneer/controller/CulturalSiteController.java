package com.kts.nvt.serbioneer.controller;

import com.kts.nvt.serbioneer.dto.CommentDTO;
import com.kts.nvt.serbioneer.helper.CommentMapper;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "api/cultural-site", produces = MediaType.APPLICATION_JSON_VALUE)
public class CulturalSiteController {

    @Autowired
    private CommentService commentService;

    private CommentMapper commentMapper;

    public CulturalSiteController() {
        this.commentMapper = new CommentMapper();
    }

    /*
   url: GET localhost:8080/api/cultural-site/{id}/comment
   HTTP request getting all comments left on cultural site
    */
    @GetMapping(value = "/{id}/comment")
    public ResponseEntity<List<CommentDTO>> getAllCulturalSiteComments(@PathVariable("id") Long id){
        List<Comment> comments = commentService.findAllByCulturalSiteIdAndApproved(id, true);

        List<CommentDTO> commentDTOS = commentMapper.toDtoList(comments);

        return new ResponseEntity<>(commentDTOS, HttpStatus.OK);
    }
}
