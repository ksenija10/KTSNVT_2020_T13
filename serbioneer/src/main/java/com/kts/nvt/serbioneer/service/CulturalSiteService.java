package com.kts.nvt.serbioneer.service;

import java.util.List;

import com.kts.nvt.serbioneer.repository.CulturalSiteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.CulturalSite;

@Service
public class CulturalSiteService implements ServiceInterface<CulturalSite> {

	@Autowired
	private CulturalSiteRepository culturalSiteRepository;

	private final String type = "News";

	@Override
	public List<CulturalSite> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CulturalSite findOneById(Long id) {
		return culturalSiteRepository.findById(id).orElse(null);
	}

	@Override
	public CulturalSite create(CulturalSite entity) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CulturalSite update(CulturalSite entity, Long id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public String getType() {
		return type;
	}
}
