package com.kts.nvt.serbioneer.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.CulturalSiteCategory;

import java.util.Optional;

@Repository
public interface CulturalSiteCategoryRepository extends JpaRepository<CulturalSiteCategory, Long> {
	
	Page<CulturalSiteCategory> findAllByOrderByIdAsc(Pageable pageable);
	
	CulturalSiteCategory findOneByName(String categoryName);
	
	CulturalSiteCategory findOneByNameAndIdNot(String categoryName, Long id);
}
