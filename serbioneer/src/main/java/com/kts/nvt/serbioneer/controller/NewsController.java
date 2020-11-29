package com.kts.nvt.serbioneer.controller;

import com.kts.nvt.serbioneer.dto.NewsDTO;
import com.kts.nvt.serbioneer.helper.NewsMapper;
import com.kts.nvt.serbioneer.model.News;
import com.kts.nvt.serbioneer.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping(value = "api/news", produces = MediaType.APPLICATION_JSON_VALUE)
public class NewsController {

    @Autowired
    private NewsService newsService;

    private NewsMapper newsMapper;

    public NewsController() {
        this.newsMapper = new NewsMapper();
    }

    /*
       url: GET localhost:8080/api/news
       HTTP request for getting all news related to all cultural sites
    */
    @GetMapping
    public ResponseEntity<List<NewsDTO>> getAllNews(){
        List<News> news = newsService.findAll();

        return new ResponseEntity<>(newsMapper.toDtoList(news), HttpStatus.OK);
    }

    /*
       url: GET localhost:8080/api/news/{id}
       HTTP request for getting news by id
    */
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
    @PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<NewsDTO> updateNews(@PathVariable("id") Long id,
                                              @RequestBody NewsDTO newsDTO){
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
    @DeleteMapping(value = "/{id}")
    public ResponseEntity<Void> deleteNews(@PathVariable("id") Long id){
        try {
            newsService.delete(id);
        }catch (Exception e){
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
        }

        return new ResponseEntity<>(HttpStatus.OK);
    }

}
