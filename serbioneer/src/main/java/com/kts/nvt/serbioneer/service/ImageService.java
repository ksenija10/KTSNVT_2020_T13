package com.kts.nvt.serbioneer.service;

import java.util.Set;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.Image;

@Service
public class ImageService implements ServiceInterface<Image> {

	@Override
	public Set<Image> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Image findOneById(UUID id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Image create(Image entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(UUID id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Image update(Image entity, UUID id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
