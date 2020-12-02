package com.kts.nvt.serbioneer.service;

import java.util.List;

import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.User;
import com.kts.nvt.serbioneer.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.Comment;

@Service
public class CommentService implements ServiceInterface<Comment> {

	@Autowired
	private CommentRepository commentRepository;

	@Autowired
	private CulturalSiteService culturalSiteService;

	private final String type = "Comment";

	@Override
	public List<Comment> findAll() {
		return commentRepository.findAll();
	}

	// @Override
	public Page<Comment> findAll(Pageable pageable) {
		return commentRepository.findAll(pageable);
	}

	@Override
	public Comment findOneById(Long id) {
		return commentRepository.findById(id).orElse(null);
	}

	@Override
	public Comment create(Comment entity) {
		return commentRepository.save(entity);
	}

	public Comment create(Long culturalSiteId, Comment comment) throws Exception {
		// check if cultural site with given id exists
		CulturalSite culturalSite = culturalSiteService.findOneById(culturalSiteId);
		if (culturalSite == null) {
			throw new NonexistentIdException(culturalSiteService.getType());
		}
		AuthenticatedUser user = (AuthenticatedUser) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		comment.setCulturalSite(culturalSite);
		comment.setAuthenticatedUser(user);
		comment.setApproved(false);
		return commentRepository.save(comment);
	}

	@Override
	public void delete(Long id) throws Exception {
		Comment existingComment = commentRepository.findById(id).orElse(null);
		if (existingComment == null) {
			throw new NonexistentIdException(this.type);
		}
		// provera da li je ulogovani korisnik isti onaj koji je napravio komentar
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (!user.getId().equals(existingComment.getAuthenticatedUser().getId())) {
			throw new Exception("You can only delete your comments.");
		}
		if (!existingComment.isApproved()) {
			throw new Exception("Comment is being revised, you can not delete it.");
		}
		commentRepository.delete(existingComment);

	}

	@Override
	public Comment update(Comment entity, Long id) throws Exception {
		Comment commentToUpdate = commentRepository.findById(id).orElse(null);
		if (commentToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		// provera da li je ulogovani korisnik isti onaj koji je napravio komentar
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (!user.getId().equals(commentToUpdate.getAuthenticatedUser().getId())) {
			throw new Exception("You can only edit your comments.");
		}
		if (!commentToUpdate.isApproved()) {
			throw new Exception("Comment is being revised, you can not modify it.");
		}
		commentToUpdate.setText(entity.getText());
		return commentRepository.save(commentToUpdate);
	}

	public List<Comment> findAllByApproved(Boolean approved) {
		return commentRepository.findAllByApproved(approved);
	}

	public Page<Comment> findAllByApproved(Pageable pageable, Boolean approved) {
		return commentRepository.findAllByApproved(pageable, approved);
	}

	public Comment approve(Long id) throws Exception {
		Comment commentToUpdate = commentRepository.findById(id).orElse(null);
		if (commentToUpdate == null) {
			throw new Exception("Comment with given id doesn't exist.");
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
			throw new Exception("Comment with given id doesn't exist.");
		}

		if (existingComment.isApproved()) {
			throw new Exception("Comment with given id is already approved and can not be rejected");
		}

		commentRepository.delete(existingComment);
	}

	public List<Comment> findAllByCulturalSiteIdAndApproved(Long culturalSiteId, Boolean approved) {
		return commentRepository.findAllByCulturalSiteIdAndApproved(culturalSiteId, approved);
	}

	public Page<Comment> findAllByCulturalSiteIdAndApproved(Pageable pageable, Long culturalSiteId, Boolean approved) {
		return commentRepository.findAllByCulturalSiteIdAndApproved(pageable, culturalSiteId, approved);
	}

}
