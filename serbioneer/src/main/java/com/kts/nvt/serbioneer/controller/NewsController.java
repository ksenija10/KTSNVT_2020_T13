package com.kts.nvt.serbioneer.controller;

import javax.validation.Valid;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.kts.nvt.serbioneer.dto.NewsDTO;
import com.kts.nvt.serbioneer.helper.NewsMapper;
import com.kts.nvt.serbioneer.model.News;
import com.kts.nvt.serbioneer.service.NewsService;

@RestController
@RequestMapping(value = "api/news", produces = MediaType.APPLICATION_JSON_VALUE)
public class NewsController {

    @Autowired
    private NewsService newsService;

    private final NewsMapper newsMapper;

    public NewsController() {
        this.newsMapper = new NewsMapper();
    }

    /*
       url: GET localhost:8080/api/news/by-page
       HTTP request for getting all news related to all cultural sites
    */
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping(value = "/by-page")
    public ResponseEntity<Page<NewsDTO>> getAllNews(Pageable pageable){
        Page<News> page = newsService.findAll(pageable);

        return new ResponseEntity<>(newsMapper.toDtoPage(page), HttpStatus.OK);
    }

    /*
       url: GET localhost:8080/api/news/{id}
       HTTP request for getting news by id
    */
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
    @GetMapping(value = "/{id}")
    public ResponseEntity<NewsDTO> getNews(@PathVariable("id") Long id){
        News news = newsService.findOneById(id);

        if(news == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(newsMapper.toDto(news), HttpStatus.OK);
    }

    /*
		url: PUT localhost:8080/api/news/{id}
		HTTP request for updating news by id
	*/
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<NewsDTO> updateNews(@PathVariable("id") Long id,
                                              @Valid @RequestBody NewsDTO newsDTO){
        News news = newsMapper.toEntity(newsDTO);
        try {
            news = newsService.update(news, id);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }

        return new ResponseEntity<>(newsMapper.toDto(news), HttpStatus.OK);
    }
    /*
       url: DELETE localhost:8080/api/news/{id}
       HTTP request for deleting one news by id
    */
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> deleteNews(@PathVariable("id") Long id){
        try {
            newsService.delete(id);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }

    /*
       url: GET localhost:8080/api/news/subscribed/by-page
       HTTP request for getting all subscribed news
    */
    @CrossOrigin(origins = "http://localhost:4200")
    @PreAuthorize("hasRole('ROLE_USER')")
    @GetMapping("/subscribed/by-page")
    public ResponseEntity<Page<NewsDTO>> getAllSubscribedNews(Pageable pageable) {

        Long id = ((AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId();
        Page<News> page = null;
        try {
            page = newsService.getAllSubscribedNews(pageable, id);
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }

        return new ResponseEntity<>(newsMapper.toDtoPage(page), HttpStatus.OK);
    }

}
