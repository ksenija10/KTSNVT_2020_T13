package com.kts.nvt.serbioneer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.News;

import java.util.List;

@Repository
public interface NewsRepository extends JpaRepository<News, Long> {

    List<News> findAllByCulturalSiteId(Long id);
}
