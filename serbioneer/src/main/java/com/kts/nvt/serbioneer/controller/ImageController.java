package com.kts.nvt.serbioneer.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
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

	private ImageMapper imageMapper;

	public ImageController() {
		this.imageMapper = new ImageMapper();
	}

	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping
	public ResponseEntity<List<ImageDTO>> getAllImages() {
		List<Image> images = imageService.findAll();
		return new ResponseEntity<>(imageMapper.toDtoList(images), HttpStatus.OK);
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/{news-id}")
	public ResponseEntity<List<ImageDTO>> getAllImagesForNews(@PathVariable("news-id") Long newsId) {
		List<Image> images = imageService.findAllByNewsId(newsId);
		return new ResponseEntity<>(imageMapper.toDtoList(images), HttpStatus.OK);
	}

	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping(value = "/{comment-id}")
	public ResponseEntity<List<ImageDTO>> getAllImagesForComment(@PathVariable("comment-id") Long commentId) {
		List<Image> images = imageService.findAllByCommentId(commentId);
		return new ResponseEntity<>(imageMapper.toDtoList(images), HttpStatus.OK);
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/{cultural-site-id}")
	public ResponseEntity<List<ImageDTO>> getAllImagesForCulturalSite(
			@PathVariable("cultural-site-id") Long culturalSiteId) {
		List<Image> images = imageService.findAllByCulturalSiteId(culturalSiteId);
		return new ResponseEntity<>(imageMapper.toDtoList(images), HttpStatus.OK);
	}

	
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@PostMapping(value = "/comment/{id}")
	public ResponseEntity<ImageDTO> createImageForComment(@RequestParam("file") MultipartFile file,
			@PathVariable("id") Long commentId) throws Exception {
		
		if(file == null) {
			throw new Exception("Null je");
		}
		
		try {
			imageService.createForComment(commentId, file);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}

		//return new ResponseEntity<>(imageMapper.toDto(image), HttpStatus.CREATED);
		return new ResponseEntity<>(HttpStatus.CREATED);
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(value = "/news/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ImageDTO> createImageForNews(@Valid @RequestBody ImageDTO imageDto,
			@PathVariable("id") Long newsId) {
		Image image = imageMapper.toEntity(imageDto);
		
		try {
			imageService.createForNews(newsId, image);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}

		return new ResponseEntity<>(imageMapper.toDto(image), HttpStatus.CREATED);
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(value = "/culturalSite/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ImageDTO> createImageForCulturalSite(@Valid @RequestBody ImageDTO imageDto,
			@PathVariable("id") Long culturalSiteId) {
		Image image = imageMapper.toEntity(imageDto);
		try {
			imageService.createForCulturalSite(culturalSiteId, image);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}

		return new ResponseEntity<>(imageMapper.toDto(image), HttpStatus.CREATED);
	}

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

	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<ImageDTO> updateImage(@PathVariable("id") Long id, @Valid @RequestBody ImageDTO imageDto) {
		Image image = imageMapper.toEntity(imageDto);
		try {
			image = imageService.update(image, id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(imageMapper.toDto(image), HttpStatus.OK);
	}

}
