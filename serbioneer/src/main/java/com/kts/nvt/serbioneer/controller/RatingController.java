package com.kts.nvt.serbioneer.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.kts.nvt.serbioneer.dto.RatingDTO;
import com.kts.nvt.serbioneer.helper.RatingMapper;
import com.kts.nvt.serbioneer.model.Rating;
import com.kts.nvt.serbioneer.service.RatingService;

@RestController
@RequestMapping(value = "api/rating", produces = MediaType.APPLICATION_JSON_VALUE)
public class RatingController {

	@Autowired
	private RatingService ratingService;

	private final RatingMapper ratingMapper;

	public RatingController() {
		this.ratingMapper = new RatingMapper();
	}

	/*
	 * url: GET localhost:8080/api/rating/cultural-site/{cultural-site-id}
	 * HTTP request for getting all ratings of a cultural site
	 */
	@PreAuthorize("hasAnyRole('ROLE_USER', 'ROLE_ADMIN')")
	@GetMapping(value = "/cultural-site/{cultural-site-id}")
	public ResponseEntity<List<RatingDTO>> getAllRatingsForCulturalSite(
			@PathVariable("cultural-site-id") Long culturalSiteId) {
		List<Rating> ratings = ratingService.findAllByCulturalSiteId(culturalSiteId);
		return new ResponseEntity<>(ratingMapper.toDtoList(ratings), HttpStatus.OK);
	}

	/*
	 * url: GET localhost:8080/api/rating/authenticated-user/{authenticated-user-id}
	 * HTTP request for getting all ratings of an authenticated user
	 */
	@PreAuthorize("hasRole('ROLE_USER')")
	@GetMapping(value = "/authenticated-user/{authenticated-user-id}")
	public ResponseEntity<List<RatingDTO>> getAllRatingsForAuthenticatedUser(
			@PathVariable("authenticated-user-id") Long authenticatedUserId) {
		List<Rating> ratings = ratingService.findAllByAuthenticatedUserId(authenticatedUserId);
		return new ResponseEntity<>(ratingMapper.toDtoList(ratings), HttpStatus.OK);
	}

	/*
	 * url: POST localhost:8080/api/rating/cultural-site/{cultural-site-id} HTTP
	 * request for creating a new rating of a cultural site
	 */
	@PreAuthorize("hasRole('ROLE_USER')")
	@PostMapping(value = "/cultural-site/{cultural-site-id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<RatingDTO> createRating(@Valid @RequestBody RatingDTO ratingDto,
			@PathVariable("cultural-site-id") Long culturalSiteId) {
		Rating rating;
		try {
			rating = ratingService.create(culturalSiteId, ratingDto.getValue());
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}

		return new ResponseEntity<>(ratingMapper.toDto(rating), HttpStatus.CREATED);
	}

	/*
	 * url: PUT localhost:8080/api/rating HTTP request for updating a specific
	 * rating
	 */
	@PreAuthorize("hasRole('ROLE_USER')")
	@PutMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<RatingDTO> updateRating(@Valid @RequestBody RatingDTO ratingDto) {
		Rating rating;
		try {
			rating = ratingService.update(ratingDto.getValue(), ratingDto.getId());
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(ratingMapper.toDto(rating), HttpStatus.OK);
	}
}
