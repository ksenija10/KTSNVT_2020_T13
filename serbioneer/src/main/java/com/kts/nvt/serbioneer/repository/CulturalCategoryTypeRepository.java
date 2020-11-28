package com.kts.nvt.serbioneer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.CulturalCategoryType;

@Repository
public interface CulturalCategoryTypeRepository extends JpaRepository<CulturalCategoryType, Long> {

}
