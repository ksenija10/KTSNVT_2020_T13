package com.kts.nvt.serbioneer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.Image;

@Repository
public interface ImageRepository extends JpaRepository<Image, Long> {

	List<Image> findAllByNewsId(Long newsId);

	List<Image> findAllByCommentId(Long commentId);

	List<Image> findAllByCulturalSiteId(Long culturalSiteId);

}
