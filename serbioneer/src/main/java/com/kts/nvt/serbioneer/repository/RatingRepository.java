package com.kts.nvt.serbioneer.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.Rating;

@Repository
public interface RatingRepository extends JpaRepository<Rating, Long> {

	List<Rating> findAllByCulturalSiteId(Long culturalSiteId);
	
	Page<Rating> findAllByCulturalSiteId(Pageable pageable, Long culturalSiteId);
	
	List<Rating> findAllByAuthenticatedUserId(Long authenticatedUserId);
	
	Page<Rating> findAllByAuthenticatedUserId(Pageable pageable, Long authenticatedUserId);
	
	Rating findOneByCulturalSiteIdAndAuthenticatedUserId(Long culturalSiteId, Long authenticatedUserId);
	
}
