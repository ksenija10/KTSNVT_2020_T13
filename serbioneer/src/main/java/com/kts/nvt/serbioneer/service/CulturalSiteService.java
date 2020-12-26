package com.kts.nvt.serbioneer.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.kts.nvt.serbioneer.dto.CulturalSiteFilterDTO;
import com.kts.nvt.serbioneer.helper.exception.IncompatibleCategoryAndTypeException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalCategoryType;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import com.kts.nvt.serbioneer.model.Rating;
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

	
	public List<CulturalSite> findAll() {
		return culturalSiteRepository.findAll();
	}
	
	@Override
	public Page<CulturalSite> findAll(Pageable pageable) {
		return culturalSiteRepository.findAll(pageable);
	}

	@Override
	public CulturalSite findOneById(Long id) {
		return culturalSiteRepository.findById(id).orElse(null);
	}

	@Override
	public void delete(Long id) throws Exception {
		CulturalSite culturalSiteToDelete = culturalSiteRepository.findById(id).orElse(null);
		if (culturalSiteToDelete == null) {
			throw new NonexistentIdException(this.type);
		}
		culturalSiteRepository.delete(culturalSiteToDelete);
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
			throw new IncompatibleCategoryAndTypeException();
		}
		// postavljamo vrednosti kategorije i tipa kategorije
		entity.setCulturalSiteCategory(category);
		entity.setCulturalCategoryType(categoryType);
		// cuvamo u bazu
		return culturalSiteRepository.save(entity);
	}
	
	public CulturalSite update(CulturalSite entity, Long id, Long categoryId, Long categoryTypeId) 
			throws Exception {
		CulturalSite culturalSiteToUpdate = culturalSiteRepository.findById(id).orElse(null);
        if (culturalSiteToUpdate == null) {
            throw new NonexistentIdException(this.type);
        }
        // provera postojanja kategorije
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
 			throw new IncompatibleCategoryAndTypeException();
 		}
        // izmena dobavljenog kulturnog dobra
        culturalSiteToUpdate.setName(entity.getName());
        culturalSiteToUpdate.setLat(entity.getLat());
        culturalSiteToUpdate.setLng(entity.getLng());
        culturalSiteToUpdate.setAddress(entity.getAddress());
        culturalSiteToUpdate.setCity(entity.getCity());
        culturalSiteToUpdate.setDescription(entity.getDescription());
        culturalSiteToUpdate.setCulturalSiteCategory(category);
        culturalSiteToUpdate.setCulturalCategoryType(categoryType);
        return culturalSiteRepository.save(culturalSiteToUpdate);
	}

	public double updateRating(CulturalSite culturalSite) {

		int ratingSum = 0;
		for(Rating r : culturalSite.getRatings()) {
			ratingSum += r.getValue();
		}
		double newRating = (double) ratingSum / culturalSite.getRatings().size();
		culturalSite.setRating(newRating);

		culturalSiteRepository.save(culturalSite);

		return newRating;
	}

	public Page<CulturalSite> filterCulturalSites(Pageable pageable, CulturalSiteFilterDTO filterDTO) {
		//findAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityIn
		return culturalSiteRepository.
				findAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCase
			(pageable, filterDTO.getCategoryName(), filterDTO.getCategoryTypeName(), 
					filterDTO.getCulturalSiteName(), filterDTO.getLocation());
	}
	
	//dobavljanje svih gradova za front
	public List<String> findAllCities() {
		List<String> cities = new ArrayList<String>();
		Set<String> citiesSet = new HashSet<String>();
		List<CulturalSite> culturalSites = this.findAll();
		for (CulturalSite culturalSite : culturalSites) {
			citiesSet.add(culturalSite.getCity());
		}
		cities.addAll(citiesSet);
		return cities;
	}
	
	public Page<CulturalSite> findAllSubscribed(Pageable pageable, Long userId) {
		return culturalSiteRepository.findAllBySubscribedUsersId(pageable, userId);
	}
	
	//za potrebe testiranja
	public List<CulturalSite> findAllSubscribed(AuthenticatedUser user){
		return culturalSiteRepository.findAllBySubscribedUsersId(user.getId());
	}
	
}
