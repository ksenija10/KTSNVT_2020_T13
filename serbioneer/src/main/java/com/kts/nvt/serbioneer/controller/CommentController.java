package com.kts.nvt.serbioneer.controller;

import com.kts.nvt.serbioneer.dto.CommentDTO;
import com.kts.nvt.serbioneer.helper.CommentMapper;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;


@RestController
@RequestMapping(value = "api/comment", produces = MediaType.APPLICATION_JSON_VALUE)
public class CommentController {

    @Autowired
    private CommentService commentService;

    private CommentMapper commentMapper;

    public CommentController() {
        this.commentMapper = new CommentMapper();
    }

    /*
   url: GET localhost:8080/api/comment
   HTTP request for getting all comments left on all cultural sites(approved and not approved)
    */
    @GetMapping
    public ResponseEntity<List<CommentDTO>> getAllComments(){
        List<Comment> comments = commentService.findAll();

        return new ResponseEntity<>(commentMapper.toDtoList(comments), HttpStatus.OK);
    }

    /*
  url: GET localhost:8080/api/comment/unapproved
  HTTP request for getting all unapproved comments
   */
    @GetMapping(value = "/unapproved")
    public ResponseEntity<List<CommentDTO>> getAllUnapprovedComments(){
        List<Comment> comments = commentService.findAllByApproved(false);

        return new ResponseEntity<>(commentMapper.toDtoList(comments), HttpStatus.OK);
    }

    /*
   url: GET localhost:8080/api/comment/{id}
   HTTP request for getting one comment by id
    */
    @GetMapping(value = "/{id}")
    public ResponseEntity<CommentDTO> getComment(@PathVariable("id") Long id){
        Comment comment = commentService.findOneById(id);

        if(comment == null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(commentMapper.toDto(comment), HttpStatus.OK);
    }

    //kreiranje i updatovanje komentara nakon ugradjenog spring sec jer mi treba trenutno ulogovani korisnik

    /*
   url: DELETE localhost:8080/api/comment/{id}
   HTTP request for deleting one comment by id
    */
    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> deleteComment(@PathVariable("id") Long id){
        try {
            //ovde se salje username ulogovanog korinsika- SPRING SECURITY
            commentService.delete(id);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }

    /*
   url: PUT localhost:8080/api/comment/{id}/approval
   HTTP request for approving one comment by id
    */
    @PutMapping(value = "/{id}/approval")
    public ResponseEntity<CommentDTO> approveComment(@PathVariable("id") Long id){
        Comment comment;

        try {
            comment = commentService.approve(id);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }

        return new ResponseEntity<>(commentMapper.toDto(comment), HttpStatus.OK);
    }

    /*
   url: DELETE localhost:8080/api/comment/{id}/approval
   HTTP request for rejecting one comment by id
    */
    @DeleteMapping(value = "/{id}/approval")
    public ResponseEntity<Void> rejectComment(@PathVariable("id") Long id){
        try {
            commentService.reject(id);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }


}
