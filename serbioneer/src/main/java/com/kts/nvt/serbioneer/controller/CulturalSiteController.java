package com.kts.nvt.serbioneer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.kts.nvt.serbioneer.dto.CommentDTO;
import com.kts.nvt.serbioneer.dto.CulturalSiteDTO;
import com.kts.nvt.serbioneer.dto.CulturalSiteFilterDTO;
import com.kts.nvt.serbioneer.dto.NewsDTO;
import com.kts.nvt.serbioneer.helper.CommentMapper;
import com.kts.nvt.serbioneer.helper.CulturalSiteMapper;
import com.kts.nvt.serbioneer.helper.NewsMapper;
import com.kts.nvt.serbioneer.mailsender.OnNewsCreatedEvent;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.News;
import com.kts.nvt.serbioneer.service.CommentService;
import com.kts.nvt.serbioneer.service.CulturalSiteService;
import com.kts.nvt.serbioneer.service.NewsService;

@RestController
@RequestMapping(value = "api/cultural-site", produces = MediaType.APPLICATION_JSON_VALUE)
public class CulturalSiteController {

	@Autowired
	private CulturalSiteService culturalSiteService;
	
    @Autowired
    private CommentService commentService;

    @Autowired
    private NewsService newsService;
    
    @Autowired
    ApplicationEventPublisher eventPublisher;

    private final CulturalSiteMapper culturalSiteMapper;
    private final CommentMapper commentMapper;
    private final NewsMapper newsMapper;

    public CulturalSiteController() {
    	this.culturalSiteMapper = new CulturalSiteMapper();
        this.newsMapper = new NewsMapper();
        this.commentMapper = new CommentMapper();
    }
    
    /*
    	url: GET localhost:8080/api/cultural-site
    	HTTP request for getting all cultural sites
     */
    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
    @GetMapping
    public ResponseEntity<List<CulturalSiteDTO>> getAllCulturalSites() {
    	List<CulturalSite> culturalSites = culturalSiteService.findAll();
    	return new ResponseEntity<>(culturalSiteMapper.toDtoList(culturalSites), HttpStatus.OK);
    }
    
    /*
		url: GET localhost:8080/api/cultural-site/by-page
		HTTP request for getting cultural sites by page
	 */
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_USER')")
	@GetMapping(value = "by-page")
	public ResponseEntity<Page<CulturalSiteDTO>> getAllCulturalSites(Pageable pageable){
        Page<CulturalSite> page = culturalSiteService.findAll(pageable);
        return new ResponseEntity<>(culturalSiteMapper.toDtoPage(page), HttpStatus.OK);
    }
    
    /*
		url: POST localhost:8080/api/cultural-site
		HTTP request for creating a new cultural site
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<CulturalSiteDTO> createCulturalSite(
					@Valid @RequestBody CulturalSiteDTO culturalSiteDto) {
		
		Long categoryId = culturalSiteDto.getCategoryId();
		Long categoryTypeId = culturalSiteDto.getCategoryTypeId();
		CulturalSite culturalSite = culturalSiteMapper.toEntity(culturalSiteDto);
		
		try {
			culturalSite = culturalSiteService.create(culturalSite, categoryId, categoryTypeId);
		} catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		
		return new ResponseEntity<>(culturalSiteMapper.toDto(culturalSite), HttpStatus.CREATED);
	}
	
	/*
		url: GET localhost:8080/api/cultural-site/{id}
		HTTP request for getting a specific cultural site given by id
	 */
	@GetMapping(value = "/{id}")
	public ResponseEntity<CulturalSiteDTO> getCulturalSite(@PathVariable("id") Long id) {
		CulturalSite culturalSite = culturalSiteService.findOneById(id);
		if (culturalSite == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(culturalSiteMapper.toDto(culturalSite), HttpStatus.OK);
	}
	
	/*
		url: PUT localhost:8080/api/cultural-site/{id}
		HTTP request for updating a specific cultural site given by id
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<CulturalSiteDTO> updateCulturalSite(@PathVariable("id") Long id,
								@Valid @RequestBody CulturalSiteDTO culturalSiteDto) {
		Long categoryId = culturalSiteDto.getCategoryId();
		Long categoryTypeId = culturalSiteDto.getCategoryTypeId();
		CulturalSite culturalSite = culturalSiteMapper.toEntity(culturalSiteDto);
		try {
			culturalSite = culturalSiteService.update(culturalSite, id, categoryId, categoryTypeId);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
        return new ResponseEntity<>(culturalSiteMapper.toDto(culturalSite), HttpStatus.OK);
	}
	
	/*
		url: DELETE localhost:8080/api/cultural-site/{id}
		HTTP request for deleting a specific cultural site given by id
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deleteCulturalSite(@PathVariable("id") Long id) {
		try {
			culturalSiteService.delete(id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
		}
		return new ResponseEntity<>(HttpStatus.OK);
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
                                              @Valid @RequestBody CommentDTO commentDTO) {
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
                                              @Valid @RequestBody NewsDTO newsDTO,
                                              HttpServletRequest request) {
        News news = newsMapper.toEntity(newsDTO);
        try {
            news = newsService.create(culturalSiteId, news);
            //slanje mejla svim pretplacenim korisnicam prilikom kreiranja novosti
            String appUrl = request.getContextPath();
            eventPublisher.publishEvent(new OnNewsCreatedEvent(news,
                    request.getLocale(), appUrl, news.getCulturalSite().getSubscribedUsers()));
        } catch (Exception e) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
        }

        return new ResponseEntity<>(newsMapper.toDto(news), HttpStatus.CREATED);
    }
    
    /*
		url: POST localhost:8080/api/cultural-site/filter/by-page
		HTTP request for filtering cultural sites
	*/
	@PostMapping(value = "/filter/by-page", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Page<CulturalSiteDTO>> filterCulturalSites(Pageable pageable, 
									@Valid @RequestBody CulturalSiteFilterDTO filterDTO) {
		Page<CulturalSite> page = culturalSiteService.filterCulturalSites(pageable, filterDTO);
		return new ResponseEntity<>(culturalSiteMapper.toDtoPage(page), HttpStatus.OK);
	}
	
	/*
		url: GET localhost:8080/api/cultural-site/subscribed/by-page
		HTTP request for getting subscribed cultural sites by page
	 */
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping(value = "/subscribed/by-page")
	public ResponseEntity<Page<CulturalSiteDTO>> getAllSubscribedCulturalSites(Pageable pageable){
	    Page<CulturalSite> page = culturalSiteService.findAllSubscribed(pageable);
	    return new ResponseEntity<>(culturalSiteMapper.toDtoPage(page), HttpStatus.OK);
	}

}
