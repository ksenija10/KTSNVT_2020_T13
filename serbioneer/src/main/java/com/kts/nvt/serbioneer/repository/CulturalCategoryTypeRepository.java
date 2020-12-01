package com.kts.nvt.serbioneer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.CulturalCategoryType;

@Repository
public interface CulturalCategoryTypeRepository extends JpaRepository<CulturalCategoryType, Long> {

	List<CulturalCategoryType> findAllByCulturalSiteCategoryId(Long categoryId);
	
	CulturalCategoryType findOneByName(String name);
	
	CulturalCategoryType findOneByNameAndIdNot(String name, Long id);
	
	CulturalCategoryType findOneByIdAndCulturalSiteCategoryId(Long id, Long categoryId);
}
