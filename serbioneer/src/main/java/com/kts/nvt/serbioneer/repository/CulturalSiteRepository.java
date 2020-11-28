package com.kts.nvt.serbioneer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.CulturalSite;

@Repository
public interface CulturalSiteRepository extends JpaRepository<CulturalSite, Long> {

}
