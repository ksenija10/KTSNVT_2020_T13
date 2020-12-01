package com.kts.nvt.serbioneer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.CulturalCategoryType;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import com.kts.nvt.serbioneer.repository.CulturalSiteRepository;

import lombok.Getter;

@Service
public class CulturalSiteService implements ServiceInterface<CulturalSite> {

	@Autowired
	private CulturalSiteRepository culturalSiteRepository;

	@Autowired
	private CulturalSiteCategoryService culturalSiteCategoryService;
	@Autowired
	private CulturalCategoryTypeService culturalCategoryTypeService;
	
	@Getter
	private final String type = "Cultural site";

	@Override
	public List<CulturalSite> findAll() {
		return culturalSiteRepository.findAll();
	}
	
	public Page<CulturalSite> findAll(Pageable pageable) {
		return culturalSiteRepository.findAll(pageable);
	}

	@Override
	public CulturalSite findOneById(Long id) {
		return culturalSiteRepository.findById(id).orElse(null);
	}

	@Override
	public CulturalSite create(CulturalSite entity) throws Exception {
		return null;
	}

	@Override
	public void delete(Long id) throws Exception {
		CulturalSite culturalSiteToDelete = culturalSiteRepository.findById(id).orElse(null);
		if (culturalSiteToDelete == null) {
			throw new NonexistentIdException(this.type);
		}
		culturalSiteRepository.delete(culturalSiteToDelete);
	}

	@Override
	public CulturalSite update(CulturalSite entity, Long id) throws Exception {
		CulturalSite culturalSiteToUpdate = culturalSiteRepository.findById(id).orElse(null);
        if (culturalSiteToUpdate == null) {
            throw new NonexistentIdException(this.type);
        }
        // izmena dobavljenog kulturnog dobra
        culturalSiteToUpdate.setName(entity.getName());
        culturalSiteToUpdate.setLat(entity.getLat());
        culturalSiteToUpdate.setLng(entity.getLng());
        culturalSiteToUpdate.setAddress(entity.getAddress());
        culturalSiteToUpdate.setCity(entity.getCity());
        culturalSiteToUpdate.setDescription(entity.getDescription());
        // TODO potencijalno promena tipa
        return culturalSiteRepository.save(culturalSiteToUpdate);
	}
	
	public CulturalSite create(CulturalSite entity, Long categoryId, Long categoryTypeId) throws Exception {
		// provera postojanja kategorije kulturnog dobra
		CulturalSiteCategory category = culturalSiteCategoryService.findOneById(categoryId);
		if (category == null) {
			throw new NonexistentIdException(culturalSiteCategoryService.getType());
		}
		// provera postojanja tipa kategorije
		CulturalCategoryType categoryType = culturalCategoryTypeService.findOneById(categoryTypeId);
		if (categoryType == null) {
			throw new NonexistentIdException(culturalCategoryTypeService.getType());
		}
		// provera da li tip kategorije pripada prosledjenoj kategoriji
		if (culturalCategoryTypeService.findOneByIdAndCategoryId(categoryTypeId, categoryId) == null) {
			// ne pripada odgovarajucoj kategoriji
			throw new Exception("Cultural category type doesn't belong to the given cultural site category.");
		}
		// postavljamo vrednosti kategorije i tipa kategorije
		entity.setCulturalSiteCategory(category);
		entity.setCulturalCategoryType(categoryType);
		// cuvamo u bazu
		return culturalSiteRepository.save(entity);
	}

}
