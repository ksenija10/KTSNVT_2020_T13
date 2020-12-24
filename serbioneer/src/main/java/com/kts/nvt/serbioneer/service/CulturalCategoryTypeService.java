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
import com.kts.nvt.serbioneer.model.CulturalCategoryType;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import com.kts.nvt.serbioneer.repository.CulturalCategoryTypeRepository;

import lombok.Getter;

@Service
public class CulturalCategoryTypeService implements ServiceInterface<CulturalCategoryType> {

	@Autowired
	private CulturalCategoryTypeRepository culturalCategoryTypeRepository;
	
	@Autowired
	private CulturalSiteCategoryService culturalSiteCategoryService;
	
	@Getter
	private final String type = "Cultural category type";
	private final String unique = "name";
	
	public List<CulturalCategoryType> findAll(Long categoryId) {
		return culturalCategoryTypeRepository.findAllByCulturalSiteCategoryId(categoryId);
	}
	
	@Override
	public Page<CulturalCategoryType> findAll(Pageable pageable) {
		return culturalCategoryTypeRepository.findAll(pageable);
	}

	@Override
	public CulturalCategoryType findOneById(Long id) {
		return culturalCategoryTypeRepository.findById(id).orElse(null);
	}
	
	public CulturalCategoryType create(Long categoryId, CulturalCategoryType entity) throws Exception {
		// check if category exists with given id
		CulturalSiteCategory category = culturalSiteCategoryService.findOneById(categoryId);
		if (category == null) {
			throw new NonexistentIdException(culturalSiteCategoryService.getType());
		}
		// check if category type name is unique
		CulturalCategoryType categoryType = culturalCategoryTypeRepository.findOneByName(entity.getName());
		if (categoryType != null) {
			throw new ExistentFieldValueException(this.type, this.unique);
		}
		entity.setCulturalSiteCategory(category);
		return culturalCategoryTypeRepository.save(entity);
	}

	@Override
	@Transactional
	public void delete(Long id) throws Exception {
		CulturalCategoryType categoryTypeToDelete = culturalCategoryTypeRepository.findById(id).orElse(null);
		if (categoryTypeToDelete == null) {
			throw new NonexistentIdException(this.type);
		}
		// provera da li ima vezanih kulturnih dobara za sebe
		if (categoryTypeToDelete.getCulturalSites() != null) {
			if (!categoryTypeToDelete.getCulturalSites().isEmpty()) {
				throw new ForeignKeyException(this.type);
			}
		}
		culturalCategoryTypeRepository.delete(categoryTypeToDelete);
	}

	public CulturalCategoryType update(CulturalCategoryType entity, Long id) throws Exception {
		CulturalCategoryType categoryTypeToUpdate = culturalCategoryTypeRepository.findById(id).orElse(null);
		if (categoryTypeToUpdate == null) {
			throw new NonexistentIdException(this.type);
		}
		if (culturalCategoryTypeRepository.findOneByNameAndIdNot(entity.getName(), id) != null) {
			throw new ExistentFieldValueException(this.type, this.unique);
		}
		categoryTypeToUpdate.setName(entity.getName());
		return culturalCategoryTypeRepository.save(categoryTypeToUpdate);
	}
	
	public CulturalCategoryType findOneByIdAndCategoryId(Long typeId, Long categoryId) {
		return culturalCategoryTypeRepository.findOneByIdAndCulturalSiteCategoryId(typeId, categoryId);
	}

}
