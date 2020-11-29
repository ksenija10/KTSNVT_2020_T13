package com.kts.nvt.serbioneer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.kts.nvt.serbioneer.dto.ImageDTO;
import com.kts.nvt.serbioneer.helper.ImageMapper;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.Image;
import com.kts.nvt.serbioneer.model.News;
import com.kts.nvt.serbioneer.service.CommentService;
import com.kts.nvt.serbioneer.service.CulturalSiteService;
import com.kts.nvt.serbioneer.service.ImageService;
import com.kts.nvt.serbioneer.service.NewsService;

@RestController
@RequestMapping(value = "api/image", produces = MediaType.APPLICATION_JSON_VALUE)
public class ImageController {

	@Autowired
	private ImageService imageService;

	@Autowired
	private CommentService commentService;

	@Autowired
	private CulturalSiteService culturalSiteService;

	@Autowired
	private NewsService newsService;

	private ImageMapper imageMapper;

	public ImageController() {
		this.imageMapper = new ImageMapper();
	}

	@GetMapping
	public ResponseEntity<List<ImageDTO>> getAllImages() {
		List<Image> images = imageService.findAll();
		return new ResponseEntity<>(imageMapper.toDtoList(images), HttpStatus.OK);
	}

	@GetMapping(value = "/{news-id}")
	public ResponseEntity<List<ImageDTO>> getAllImagesForNews(@PathVariable("news-id") Long newsId) {
		List<Image> images = imageService.findAllByNewsId(newsId);
		return new ResponseEntity<>(imageMapper.toDtoList(images), HttpStatus.OK);
	}

	@GetMapping(value = "/{comment-id}")
	public ResponseEntity<List<ImageDTO>> getAllImagesForComment(@PathVariable("comment-id") Long commentId) {
		List<Image> images = imageService.findAllByCommentId(commentId);
		return new ResponseEntity<>(imageMapper.toDtoList(images), HttpStatus.OK);
	}

	@GetMapping(value = "/{cultural-site-id}")
	public ResponseEntity<List<ImageDTO>> getAllImagesForCulturalSite(
			@PathVariable("cultural-site-id") Long culturalSiteId) {
		List<Image> images = imageService.findAllByCulturalSiteId(culturalSiteId);
		return new ResponseEntity<>(imageMapper.toDtoList(images), HttpStatus.OK);
	}

	@PostMapping(value = "/comment/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ImageDTO> createImageForComment(ImageDTO imageDto, @PathVariable("id") Long commentId) {
		Comment comment = commentService.findOneById(commentId);
		if (comment == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		Image image = imageMapper.toEntity(imageDto);
		try {
			imageService.create(comment, image);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}

		return new ResponseEntity<>(imageMapper.toDto(image), HttpStatus.CREATED);
	}

	@PostMapping(value = "/news/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ImageDTO> createImageForNews(ImageDTO imageDto, @PathVariable("id") Long newsId) {
		News news = newsService.findOneById(newsId);
		if (news == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		Image image = imageMapper.toEntity(imageDto);
		try {
			imageService.create(news, image);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}

		return new ResponseEntity<>(imageMapper.toDto(image), HttpStatus.CREATED);
	}

	@PostMapping(value = "/culturalSite/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ImageDTO> createImageForCulturalSite(ImageDTO imageDto,
			@PathVariable("id") Long culturalSiteId) {
		CulturalSite culturalSite = culturalSiteService.findOneById(culturalSiteId);
		if (culturalSite == null) {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		Image image = imageMapper.toEntity(imageDto);
		try {
			imageService.create(culturalSite, image);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}

		return new ResponseEntity<>(imageMapper.toDto(image), HttpStatus.CREATED);
	}

	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deleteImage(@PathVariable("id") Long id) {
		try {
			imageService.delete(id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ImageDTO> updateImage(@PathVariable("id") Long id, @RequestBody ImageDTO imageDto) {
		Image image = imageMapper.toEntity(imageDto);
		try {
			image = imageService.update(image, id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(imageMapper.toDto(image), HttpStatus.OK);
	}

}
