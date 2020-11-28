package com.kts.nvt.serbioneer.service;

import java.util.List;

import com.kts.nvt.serbioneer.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.Comment;

@Service
public class CommentService implements ServiceInterface<Comment> {

	@Autowired
	private CommentRepository commentRepository;

	@Override
	public List<Comment> findAll() {
		return commentRepository.findAll();
	}

	@Override
	public Comment findOneById(Long id) {
		return commentRepository.findById(id).orElse(null);
	}

	@Override
	public Comment create(Comment entity) throws Exception {
		return commentRepository.save(entity);
	}

	@Override
	public void delete(Long id) throws Exception {
		//provera da li je ulogovani onaj koji je i napravio komentar - SPRING SECURITY
		Comment existingComment = commentRepository.findById(id).orElse(null);
		if( existingComment == null){
			throw new Exception("Comment with given id doesn't exist.");
		}
		commentRepository.delete(existingComment);
		
	}

	@Override
	public Comment update(Comment entity, Long id) throws Exception {
		Comment commentToUpdate = commentRepository.findById(id).orElse(null);
		if(commentToUpdate == null) {
			throw new Exception("Comment with given id doesn't exist.");
		}
		commentToUpdate.setText(entity.getText());

		return commentRepository.save(commentToUpdate);
	}

	public List<Comment> findAllByApproved(Boolean approved) {
		return commentRepository.findAllByApproved(approved);
	}

	public Comment approve(Long id) throws Exception{
		Comment commentToUpdate = commentRepository.findById(id).orElse(null);
		if(commentToUpdate == null) {
			throw new Exception("Comment with given id doesn't exist.");
		}

		if(commentToUpdate.isApproved() == true){
			throw new Exception("Comment with given id is already approved.");
		}
		commentToUpdate.setApproved(true);

		return commentRepository.save(commentToUpdate);
	}

	public void reject(Long id) throws Exception{
		Comment existingComment = commentRepository.findById(id).orElse(null);
		if(existingComment == null) {
			throw new Exception("Comment with given id doesn't exist.");
		}

		if(existingComment.isApproved() == true){
			throw new Exception("Comment with given id is already approved and can not be rejected");
		}

		commentRepository.delete(existingComment);
	}

	public List<Comment> findAllByCulturalSiteIdAndApproved(Long culturalSiteId, Boolean approved){
		return commentRepository.findAllByCulturalSiteIdAndApproved(culturalSiteId, approved);
	}

}
