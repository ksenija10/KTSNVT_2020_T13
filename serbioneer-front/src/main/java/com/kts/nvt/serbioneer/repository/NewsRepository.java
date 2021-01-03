package com.kts.nvt.serbioneer.repository;

import com.kts.nvt.serbioneer.model.CulturalSite;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.News;

import java.util.List;
import java.util.Set;

@Repository
public interface NewsRepository extends JpaRepository<News, Long> {

    List<News> findAllByCulturalSiteId(Long id);

    Page<News> findAllByCulturalSiteId(Pageable pageable, Long culturalSiteId);

    Page<News> findAllByCulturalSiteInOrderByDateTimeDesc(Set<CulturalSite> culturalSites, Pageable pageable);
}
