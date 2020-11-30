package com.kts.nvt.serbioneer.controller;

import com.kts.nvt.serbioneer.dto.CommentDTO;
import com.kts.nvt.serbioneer.dto.NewsDTO;
import com.kts.nvt.serbioneer.helper.CommentMapper;
import com.kts.nvt.serbioneer.helper.NewsMapper;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.News;
import com.kts.nvt.serbioneer.service.CommentService;
import com.kts.nvt.serbioneer.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping(value = "api/cultural-site", produces = MediaType.APPLICATION_JSON_VALUE)
public class CulturalSiteController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private NewsService newsService;

    private final CommentMapper commentMapper;

    private final NewsMapper newsMapper;

    public CulturalSiteController() {
        this.newsMapper = new NewsMapper();
        this.commentMapper = new CommentMapper();
    }

    /*
       url: GET localhost:8080/api/cultural-site/{id}/comment
       HTTP request getting all comments left on cultural site
    */
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
    @GetMapping(value = "/{id}/comment")
    public ResponseEntity<List<CommentDTO>> getAllCulturalSiteComments(@PathVariable("id") Long id){
        List<Comment> comments = commentService.findAllByCulturalSiteIdAndApproved(id, true);

        List<CommentDTO> commentDTOS = commentMapper.toDtoList(comments);

        return new ResponseEntity<>(commentDTOS, HttpStatus.OK);
    }

    /*
       url: GET localhost:8080/api/cultural-site/{id}/comment/by-page
       HTTP request getting all comments left on cultural site by page
    */
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
    @GetMapping(value = "/{id}/comment/by-page")
    public ResponseEntity<Page<CommentDTO>> getAllCulturalSiteComments(Pageable pageable, @PathVariable("id") Long id){
        Page<Comment> page = commentService.findAllByCulturalSiteIdAndApproved(pageable, id, true);
        return new ResponseEntity<>(commentMapper.toDtoPage(page), HttpStatus.OK);
    }
    /*
		url: POST localhost:8080/api/cultural-site/{cultural-site-id}/comment
		HTTP request for commenting on a specific cultural site
	*/
    @PreAuthorize("hasRole('ROLE_USER')")
    @PostMapping(value = "/{cultural-site-id}/comment")
    public ResponseEntity<CommentDTO> createComment(@PathVariable("cultural-site-id") Long culturalSiteId,
                                              @RequestBody CommentDTO commentDTO) {
        Comment comment = commentMapper.toEntity(commentDTO);
        try {
            comment = commentService.create(culturalSiteId, comment);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }

        return new ResponseEntity<>(commentMapper.toDto(comment), HttpStatus.CREATED);
    }

    /*
       url: GET localhost:8080/api/cultural-site/{id}/news
       HTTP request getting all news related to a cultural site
    */
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
    @GetMapping(value = "/{id}/news")
    public ResponseEntity<List<NewsDTO>> getAllCulturalSiteNews(@PathVariable("id") Long id) {
        List<News> news = newsService.findAllByCulturalSiteId(id);

        List<NewsDTO> newsDTOS = newsMapper.toDtoList(news);

        return new ResponseEntity<>(newsDTOS, HttpStatus.OK);
    }

    /*
       url: GET localhost:8080/api/cultural-site/{id}/news/by-page
       HTTP request getting all news related to a cultural site by page
    */
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
    @GetMapping(value = "{id}/news/by-page")
    public ResponseEntity<Page<NewsDTO>> getAllCulturalSiteNews(Pageable pageable, @PathVariable("id") Long id){
        Page<News> page = newsService.findAllByCulturalSiteId(pageable, id);

        return new ResponseEntity<>(newsMapper.toDtoPage(page), HttpStatus.OK);
    }

    /*
		url: POST localhost:8080/api/cultural-site/{cultural-site-id}/news
		HTTP request for creating news related to a specific cultural site
	*/
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping(value = "/{cultural-site-id}/news")
    public ResponseEntity<NewsDTO> createNews(@PathVariable("cultural-site-id") Long culturalSiteId,
                                              @RequestBody NewsDTO newsDTO) {
        News news = newsMapper.toEntity(newsDTO);
        try {
            news = newsService.create(culturalSiteId, news);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }

        return new ResponseEntity<>(newsMapper.toDto(news), HttpStatus.CREATED);
    }

}
