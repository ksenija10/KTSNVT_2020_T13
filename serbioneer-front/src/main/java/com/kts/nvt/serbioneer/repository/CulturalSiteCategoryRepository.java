package com.kts.nvt.serbioneer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.CulturalSiteCategory;

@Repository
public interface CulturalSiteCategoryRepository extends JpaRepository<CulturalSiteCategory, Long> {
	
	CulturalSiteCategory findOneByName(String categoryName);
	
	CulturalSiteCategory findOneByNameAndIdNot(String categoryName, Long id);
}
