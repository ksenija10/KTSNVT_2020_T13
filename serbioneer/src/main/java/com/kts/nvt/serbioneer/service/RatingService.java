package com.kts.nvt.serbioneer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.Rating;
import com.kts.nvt.serbioneer.repository.RatingRepository;

@Service
public class RatingService implements ServiceInterface<Rating> {

	@Autowired
	private RatingRepository ratingRepository;

	@Autowired
	private AuthenticatedUserService authenticatedUserService;

	@Autowired
	private CulturalSiteService culturalSiteService;

	private final String type = "Rating";

	@Override
	public List<Rating> findAll() {
		return ratingRepository.findAll();
	}
	
	public Page<Rating> findAll(Pageable pageable) {
		return ratingRepository.findAll(pageable);
	}

	public List<Rating> findAllByCulturalSiteId(Long culturalSiteId) {
		return ratingRepository.findAllByCulturalSiteId(culturalSiteId);
	}
	
	public Page<Rating> findAllByCulturalSiteId(Pageable pageable, Long culturalSiteId) {
		return ratingRepository.findAllByCulturalSiteId(pageable, culturalSiteId);
	}

	public List<Rating> findAllByAuthenticatedUserId(Long authenticatedUserId) {
		return ratingRepository.findAllByAuthenticatedUserId(authenticatedUserId);
	}

	public Page<Rating> findAllByAuthenticatedUserId(Pageable pageable, Long authenticatedUserId) {
		return ratingRepository.findAllByAuthenticatedUserId(pageable, authenticatedUserId);
	}
	
	@Override
	public Rating findOneById(Long id) {
		return ratingRepository.findById(id).orElse(null);
	}

	@Override
	public Rating create(Rating entity) throws Exception {
		return null;
	}

	public Rating create(Long culturalSiteId, Long authenticatedUserId, int value) throws Exception {
		CulturalSite culturalSite = culturalSiteService.findOneById(culturalSiteId);
		if (culturalSite == null) {
			throw new NonexistentIdException("Cultural Site");
		}

		AuthenticatedUser authenticatedUser = authenticatedUserService.findOneById(authenticatedUserId);
		if (authenticatedUser == null) {
			throw new NonexistentIdException("Authenticated User");
		}
		Rating entity = new Rating(value, culturalSite, authenticatedUser);
		return ratingRepository.save(entity);
	}

	@Override
	public void delete(Long id) throws Exception {
		Rating ratingToDelete = ratingRepository.findById(id).orElse(null);
		if (ratingToDelete == null) {
			throw new NonexistentIdException(this.type);
		}
		ratingRepository.delete(ratingToDelete);

	}

	public Rating update(int value, Long id) throws Exception {
		Rating ratingToUpdate = ratingRepository.findById(id).orElse(null);
		if (ratingToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		ratingToUpdate.setValue(value);
		return ratingRepository.save(ratingToUpdate);
	}

	@Override
	public Rating update(Rating entity, Long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
