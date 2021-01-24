package com.kts.nvt.serbioneer.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.Comment;

import java.util.List;

@Repository
public interface CommentRepository extends JpaRepository<Comment, Long> {

    List<Comment> findAllByApproved(Boolean approved);

    Page<Comment> findAllByApprovedOrderByIdAsc(Pageable pageable, Boolean approved);

    List<Comment> findAllByCulturalSiteIdAndApproved(Long culturalSiteId, Boolean approved);
    
    Page<Comment> findAllByCulturalSiteIdAndApprovedOrderByIdAsc(Pageable pageable, Long culturalSiteId, Boolean approved);
}
