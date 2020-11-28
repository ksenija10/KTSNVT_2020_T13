package com.kts.nvt.serbioneer.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.Comment;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

    List<Comment> findAllByApproved(Boolean approved);

    List<Comment> findAllByCulturalSiteIdAndApproved(Long culturalSiteId, Boolean approved);
}
