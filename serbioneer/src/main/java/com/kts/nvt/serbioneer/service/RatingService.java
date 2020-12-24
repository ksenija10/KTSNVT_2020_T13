package com.kts.nvt.serbioneer.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.Rating;
import com.kts.nvt.serbioneer.model.User;
import com.kts.nvt.serbioneer.repository.RatingRepository;

import java.util.List;

@Service
public class RatingService implements ServiceInterface<Rating> {

	@Autowired
	private RatingRepository ratingRepository;

	@Autowired
	private CulturalSiteService culturalSiteService;
	
	@Autowired
	private AuthenticatedUserService authenticatedUserService;

	private final String type = "Rating";

	@Override
	public Page<Rating> findAll(Pageable pageable) {
		return ratingRepository.findAll(pageable);
	}

	public Page<Rating> findAllByCulturalSiteId(Pageable pageable, Long culturalSiteId) {
		return ratingRepository.findAllByCulturalSiteId(pageable, culturalSiteId);
	}
	
	public Page<Rating> findAllByAuthenticatedUserId(Pageable pageable, Long authenticatedUserId) {
		return ratingRepository.findAllByAuthenticatedUserId(pageable, authenticatedUserId);
	}

	public List<Rating> findAll() {
		return ratingRepository.findAll();
	}

	public List<Rating> findAllByCulturalSiteId(Long culturalSiteId) {
		return ratingRepository.findAllByCulturalSiteId(culturalSiteId);
	}

	public List<Rating> findAllByAuthenticatedUserId(Long authenticatedUserId) {
		return ratingRepository.findAllByAuthenticatedUserId(authenticatedUserId);
	}

	@Override
	public Rating findOneById(Long id) {
		return ratingRepository.findById(id).orElse(null);
	}

	public Rating create(Long culturalSiteId, int value) throws Exception {
		CulturalSite culturalSite = culturalSiteService.findOneById(culturalSiteId);
		if (culturalSite == null) {
			throw new NonexistentIdException("Cultural Site");
		}
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		AuthenticatedUser authUser = authenticatedUserService.findOneById(user.getId());

		Rating entity = new Rating(value, culturalSite, authUser);
		
		culturalSite.addRating(entity);
		
		entity = ratingRepository.save(entity);

		culturalSiteService.updateRating(culturalSite);

		return entity;
	}

	@Override
	public void delete(Long id) throws Exception {
		Rating ratingToDelete = ratingRepository.findById(id).orElse(null);
		if (ratingToDelete == null) {
			throw new NonexistentIdException(this.type);
		}
		
		AuthenticatedUser user = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		if (!ratingToDelete.getAuthenticatedUser().getId().equals(user.getId())) {
			throw new Exception("You can only delete your ratings");
		}
		
		ratingRepository.delete(ratingToDelete);

	}

	public Rating update(int value, Long id) throws Exception {
		Rating ratingToUpdate = ratingRepository.findById(id).orElse(null);
		if (ratingToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}

		AuthenticatedUser user = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		
		if (!ratingToUpdate.getAuthenticatedUser().getId().equals(user.getId())) {
			throw new Exception("You can only edit your ratings");
		}

		ratingToUpdate.setValue(value);

		ratingToUpdate = ratingRepository.save(ratingToUpdate);

		culturalSiteService.updateRating(ratingToUpdate.getCulturalSite());

		return ratingRepository.save(ratingToUpdate);
	}

}
