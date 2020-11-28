package com.kts.nvt.serbioneer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import com.kts.nvt.serbioneer.repository.CulturalSiteCategoryRepository;

@Service
public class CulturalSiteCategoryService implements ServiceInterface<CulturalSiteCategory> {

	@Autowired
    private CulturalSiteCategoryRepository culturalSiteCategoryRepository;
	
	@Override
	public List<CulturalSiteCategory> findAll() {
		return culturalSiteCategoryRepository.findAll();
	}

	@Override
	public CulturalSiteCategory findOneById(Long id) {
		return culturalSiteCategoryRepository.findById(id).orElse(null);
	}

	@Override
	public CulturalSiteCategory create(CulturalSiteCategory entity) throws Exception {
		if (culturalSiteCategoryRepository.findOneByName(entity.getName()) != null) {
			throw new Exception("Cultural site category with given name already exists.");
		}
		return culturalSiteCategoryRepository.save(entity);
	}

	@Override
	public void delete(Long id) throws Exception {
		CulturalSiteCategory existingCulturalSiteCategory = culturalSiteCategoryRepository.findById(id).orElse(null);
		if (existingCulturalSiteCategory == null) {
			throw new Exception("Cultural site category with given id doesn't exist.");
		}
		culturalSiteCategoryRepository.delete(existingCulturalSiteCategory);
	}

	@Override
	public CulturalSiteCategory update(CulturalSiteCategory entity, Long id) throws Exception {
		CulturalSiteCategory culturalSiteCategoryToUpdate = culturalSiteCategoryRepository.findById(id).orElse(null);
        if (culturalSiteCategoryToUpdate == null) {
            throw new Exception("Cultural site category with given id doesn't exist.");
        }
        culturalSiteCategoryToUpdate.setName(entity.getName());
        // neophodno AndIdNot ako menja ime na isto ime
        // pametan nacin da se proveri da li je uneo isto ime koje je vec bilo
        if (culturalSiteCategoryRepository.findOneByNameAndIdNot(culturalSiteCategoryToUpdate.getName(), id) != null) {
        	throw new Exception("Cultural site category with given name already exists.");
        }
        return culturalSiteCategoryRepository.save(culturalSiteCategoryToUpdate);
	}

}
