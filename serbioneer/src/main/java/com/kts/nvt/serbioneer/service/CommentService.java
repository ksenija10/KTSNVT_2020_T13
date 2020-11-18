package com.kts.nvt.serbioneer.service;

import java.util.Set;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.Comment;

@Service
public class CommentService implements ServiceInterface<Comment> {

	@Override
	public Set<Comment> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Comment findOneById(UUID id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Comment create(Comment entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(UUID id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Comment update(Comment entity, UUID id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
