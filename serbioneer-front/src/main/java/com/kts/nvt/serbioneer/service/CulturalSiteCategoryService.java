package com.kts.nvt.serbioneer.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.ForeignKeyException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import com.kts.nvt.serbioneer.repository.CulturalSiteCategoryRepository;

import lombok.Getter;

@Service
public class CulturalSiteCategoryService implements ServiceInterface<CulturalSiteCategory> {

	@Autowired
    private CulturalSiteCategoryRepository culturalSiteCategoryRepository;
	
	@Getter
	private final String type = "Cultural category type";
	private final String unique = "name";
	
	
	public List<CulturalSiteCategory> findAll() {
		return culturalSiteCategoryRepository.findAll();
	}
	
	@Override
	public Page<CulturalSiteCategory> findAll(Pageable pageable) {
		return culturalSiteCategoryRepository.findAll(pageable);
	}

	@Override
	public CulturalSiteCategory findOneById(Long id) {
		return culturalSiteCategoryRepository.findById(id).orElse(null);
	}

	public CulturalSiteCategory create(CulturalSiteCategory entity) throws Exception {
		if (culturalSiteCategoryRepository.findOneByName(entity.getName()) != null) {
			throw new ExistentFieldValueException(this.type, this.unique);
		}
		return culturalSiteCategoryRepository.save(entity);
	}

	@Override
	@Transactional
	public void delete(Long id) throws Exception {
		CulturalSiteCategory clturalSiteCategoryToDelete = culturalSiteCategoryRepository.findById(id).orElse(null);
		if (clturalSiteCategoryToDelete == null) {
			throw new NonexistentIdException(this.type);
		}
		// provera da li ima vezanih kulturnih dobara za sebe
		if (clturalSiteCategoryToDelete.getCulturalSites() != null) {
			if (!clturalSiteCategoryToDelete.getCulturalSites().isEmpty()) {
				throw new ForeignKeyException(this.type);
			}
		}
		culturalSiteCategoryRepository.delete(clturalSiteCategoryToDelete);
	}

	public CulturalSiteCategory update(CulturalSiteCategory entity, Long id) throws Exception {
		CulturalSiteCategory culturalSiteCategoryToUpdate = culturalSiteCategoryRepository.findById(id).orElse(null);
        if (culturalSiteCategoryToUpdate == null) {
            throw new NonexistentIdException(this.type);
        }
        culturalSiteCategoryToUpdate.setName(entity.getName());
        // neophodno AndIdNot ako menja ime na isto ime
        // pametan nacin da se proveri da li je uneo isto ime koje je vec bilo
        if (culturalSiteCategoryRepository.findOneByNameAndIdNot(culturalSiteCategoryToUpdate.getName(), id) != null) {
        	throw new ExistentFieldValueException(this.type, this.unique);
        }
        return culturalSiteCategoryRepository.save(culturalSiteCategoryToUpdate);
	}

}