package com.kts.nvt.serbioneer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.NonExistingAuthenticatedUser;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.helper.exception.UserViolationException;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.Comment;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepository;
import com.kts.nvt.serbioneer.repository.CommentRepository;

@Service
public class CommentService{

	@Autowired
	private CommentRepository commentRepository;

	@Autowired
	private CulturalSiteService culturalSiteService;

	@Autowired
	private AuthenticatedUserRepository userRepository;

	private final String type = "Comment";

	public List<Comment> findAll() { return commentRepository.findAll(); }

	public Page<Comment> findAll(Pageable pageable) {
		return commentRepository.findAll(pageable);
	}

	public List<Comment> findAllByApproved(Boolean approved) {
		return commentRepository.findAllByApproved(approved);
	}
	public Page<Comment> findAllByApproved(Pageable pageable, Boolean approved) {
		return commentRepository.findAllByApprovedOrderByIdAsc(pageable, approved);
	}

	// neophodno za potrebe testiranja
	public List<Comment> findAllByCulturalSiteIdAndApproved(Long culturalSiteId, Boolean approved) {
		return commentRepository.findAllByCulturalSiteIdAndApproved(culturalSiteId, approved);
	}
	
	public Page<Comment> findAllByCulturalSiteIdAndApproved(Pageable pageable, Long culturalSiteId, Boolean approved) {
		return commentRepository.findAllByCulturalSiteIdAndApprovedOrderByIdAsc(pageable, culturalSiteId, approved);
	}

	public Comment findOneById(Long id) {
		return commentRepository.findById(id).orElse(null);
	}

	public Comment create(Long culturalSiteId, Comment comment, Long userId) throws Exception {
		// check if cultural site with given id exists
		CulturalSite culturalSite = culturalSiteService.findOneById(culturalSiteId);
		if (culturalSite == null) {
			throw new NonexistentIdException(culturalSiteService.getType());
		}
		AuthenticatedUser user = userRepository.findById(userId).orElse(null);
		if( user == null) {
			throw new NonExistingAuthenticatedUser();
		}
		comment.setCulturalSite(culturalSite);
		comment.setAuthenticatedUser(user);
		comment.setApproved(false);
		return commentRepository.save(comment);
	}

	public void delete(Long id, Long userId) throws Exception {
		Comment existingComment = commentRepository.findById(id).orElse(null);
		if (existingComment == null) {
			throw new NonexistentIdException(this.type);
		}
		// provera da li je ulogovani korisnik isti onaj koji je napravio komentar
		if (!userId.equals(existingComment.getAuthenticatedUser().getId())) {
			throw new UserViolationException("delete", this.type);
		}
		if (!existingComment.isApproved()) {
			throw new Exception("Comment is being revised, you can not delete it.");
		}
		commentRepository.delete(existingComment);
	}

	public Comment update(Comment entity, Long commentId, Long userID) throws Exception {
		Comment commentToUpdate = commentRepository.findById(commentId).orElse(null);
		if (commentToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		// provera da li je ulogovani korisnik isti onaj koji je napravio komentar
		if (!userID.equals(commentToUpdate.getAuthenticatedUser().getId())) {
			throw new UserViolationException("update", this.type);
		}
		if (!commentToUpdate.isApproved()) {
			throw new Exception("Comment is being revised, you can not modify it.");
		}
		commentToUpdate.setText(entity.getText());
		commentToUpdate.setApproved(entity.isApproved());
		return commentRepository.save(commentToUpdate);
	}

	public Comment approve(Long id) throws Exception {
		Comment commentToUpdate = commentRepository.findById(id).orElse(null);
		if (commentToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}

		if (commentToUpdate.isApproved()) {
			throw new Exception("Comment with given id is already approved.");
		}
		commentToUpdate.setApproved(true);

		return commentRepository.save(commentToUpdate);
	}

	public void reject(Long id) throws Exception {
		Comment existingComment = commentRepository.findById(id).orElse(null);
		if (existingComment == null) {
			throw new NonexistentIdException(this.type);
		}

		if (existingComment.isApproved()) {
			throw new Exception("Comment with given id is already approved and can not be rejected");
		}

		commentRepository.delete(existingComment);
	}
}
