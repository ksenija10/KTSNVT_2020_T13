package com.kts.nvt.serbioneer.service;

import java.util.Set;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.News;

@Service
public class NewsService implements ServiceInterface<News> {

	@Override
	public Set<News> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public News findOneById(UUID id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public News create(News entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(UUID id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public News update(News entity, UUID id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
