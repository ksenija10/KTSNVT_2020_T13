package com.kts.nvt.serbioneer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import com.kts.nvt.serbioneer.dto.ImageDTO;
import com.kts.nvt.serbioneer.helper.ImageMapper;
import com.kts.nvt.serbioneer.model.Image;
import com.kts.nvt.serbioneer.service.ImageService;

@RestController
@RequestMapping(value = "api/image", produces = MediaType.APPLICATION_JSON_VALUE)
public class ImageController {

	@Autowired
	private ImageService imageService;

	private final ImageMapper imageMapper;

	public ImageController() {
		this.imageMapper = new ImageMapper();
	}

	/*
	 * url: GET localhost:8080/api/image/news/{news-id} HTTP request for getting all
	 * images for specific news
	 */
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping(value = "/news/{news-id}")
	public ResponseEntity<List<ImageDTO>> getAllImagesForNews(@PathVariable("news-id") Long newsId) {
		List<Image> images = imageService.findAllByNewsId(newsId);
		return new ResponseEntity<>(imageMapper.toDtoList(images), HttpStatus.OK);
	}

	/*
	 * url: GET localhost:8080/api/image/news/{news-id}/by-page HTTP request for
	 * getting all images for specific news by page
	 */
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping(value = "/news/{news-id}/by-page")
	public ResponseEntity<Page<ImageDTO>> getAllImagesForNews(@PathVariable("news-id") Long newsId, Pageable pageable) {
		Page<Image> page = imageService.findAllByNewsId(pageable, newsId);

		return new ResponseEntity<>(imageMapper.toDtoPage(page), HttpStatus.OK);
	}

	/*
	 * url: GET localhost:8080/api/image/comment/{commet-id} HTTP request for
	 * getting all images for specific comment
	 */
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping(value = "/comment/{comment-id}")
	public ResponseEntity<List<ImageDTO>> getAllImagesForComment(@PathVariable("comment-id") Long commentId) {
		List<Image> images = imageService.findAllByCommentId(commentId);
		return new ResponseEntity<>(imageMapper.toDtoList(images), HttpStatus.OK);
	}

	/*
	 * url: GET localhost:8080/api/image/comment/{commet-id}/by-page HTTP request
	 * for getting all images for specific comment by page
	 */
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping(value = "/comment/{comment-id}/by-page")
	public ResponseEntity<Page<ImageDTO>> getAllImagesForComment(@PathVariable("comment-id") Long commentId,
			Pageable pageable) {
		Page<Image> page = imageService.findAllByNewsId(pageable, commentId);

		return new ResponseEntity<>(imageMapper.toDtoPage(page), HttpStatus.OK);
	}

	/*
	 * url: GET localhost:8080/api/image/cultural-site/{cultural-site-id} HTTP request for
	 * getting all images for specific cultural site
	 */
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping(value = "/cultural-site/{cultural-site-id}")
	public ResponseEntity<List<ImageDTO>> getAllImagesForCulturalSite(
			@PathVariable("cultural-site-id") Long culturalSiteId) {
		List<Image> images = imageService.findAllByCulturalSiteId(culturalSiteId);
		return new ResponseEntity<>(imageMapper.toDtoList(images), HttpStatus.OK);
	}

	/*
	 * url: GET localhost:8080/api/image/cultural-site/{cultural-site-id}/by-page HTTP
	 * request for getting all images for specific cultural site by page
	 */
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping(value = "/cultural-site/{cultural-site-id}/by-page")
	public ResponseEntity<Page<ImageDTO>> getAllImagesForCulturalSite(
			@PathVariable("cultural-site-id") Long culturalSiteId, Pageable pageable) {
		Page<Image> page = imageService.findAllByNewsId(pageable, culturalSiteId);

		return new ResponseEntity<>(imageMapper.toDtoPage(page), HttpStatus.OK);
	}

	/*
	 * url: POST localhost:8080/api/image/comment/{id} HTTP request for creating a
	 * new image for a comment
	 */
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@PostMapping(value = "/comment/{id}")
	public ResponseEntity<ImageDTO> createImageForComment(@RequestParam("file") MultipartFile file,
			@PathVariable("id") Long commentId){
		Image image;

		if (file == null) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid image received");
		}

		if (!file.getContentType().startsWith("image")) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You can only upload images");
		}

		if (file.getSize() > 10000000) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Image cannot be larger than 10MB");
		}

		try {
			image = imageService.createForComment(commentId, file);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(imageMapper.toDto(image), HttpStatus.CREATED);
	}

	/*
	 * url: POST localhost:8080/api/image/news/{id} HTTP request for creating a new
	 * image for news
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(value = "/news/{id}")
	public ResponseEntity<ImageDTO> createImageForNews(@RequestParam("file") MultipartFile file,
			@PathVariable("id") Long newsId) {
		Image image;
		if (file == null) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid image received");
		}

		if (!file.getContentType().startsWith("image")) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You can only upload images");
		}

		if (file.getSize() > 10000000) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Image cannot be larger than 10MB");
		}

		try {
			image = imageService.createForNews(newsId, file);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(imageMapper.toDto(image), HttpStatus.CREATED);
	}

	/*
	 * url: POST localhost:8080/api/image/cultural-site/{id} HTTP request for
	 * creating a new image for a cultural site
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(value = "/cultural-site/{id}")
	public ResponseEntity<ImageDTO> createImageForCulturalSite(@RequestParam("file") MultipartFile file,
			@PathVariable("id") Long culturalSiteId) {
		Image image;
		if (file == null) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid image received");
		}

		if (!file.getContentType().startsWith("image")) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "You can only upload images");
		}

		if (file.getSize() > 10000000) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Image cannot be larger than 10MB");
		}

		try {
			image = imageService.createForCulturalSite(culturalSiteId, file);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(imageMapper.toDto(image), HttpStatus.CREATED);
	}

	/*
	 * url: DELETE localhost:8080/api/image/{id} HTTP request for deleting a specific
	 * image
	 */
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deleteImage(@PathVariable("id") Long id) {
		try {
			imageService.delete(id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}

}
