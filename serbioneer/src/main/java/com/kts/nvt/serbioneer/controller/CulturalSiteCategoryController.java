package com.kts.nvt.serbioneer.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.kts.nvt.serbioneer.dto.CulturalCategoryTypeDTO;
import com.kts.nvt.serbioneer.dto.CulturalSiteCategoryDTO;
import com.kts.nvt.serbioneer.helper.CulturalCategoryTypeMapper;
import com.kts.nvt.serbioneer.helper.CulturalSiteCategoryMapper;
import com.kts.nvt.serbioneer.model.CulturalCategoryType;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import com.kts.nvt.serbioneer.service.CulturalCategoryTypeService;
import com.kts.nvt.serbioneer.service.CulturalSiteCategoryService;


@RestController
@RequestMapping(value = "api/cultural-site-category", produces = MediaType.APPLICATION_JSON_VALUE)
public class CulturalSiteCategoryController {

	@Autowired
	private CulturalSiteCategoryService culturalSiteCategoryService;
	
	@Autowired
	private CulturalCategoryTypeService culturalCategoryTypeService;
	
	private CulturalSiteCategoryMapper culturalSiteCategoryMapper;
	private CulturalCategoryTypeMapper culturalCategoryTypeMapper;
	
	public CulturalSiteCategoryController() {
		this.culturalSiteCategoryMapper = new CulturalSiteCategoryMapper();
		this.culturalCategoryTypeMapper = new CulturalCategoryTypeMapper();
	}

	
	/*
		url: GET localhost:8080/api/cultural-site-category
		HTTP request for getting all cultural site categories
	*/
	@GetMapping
	public ResponseEntity<List<CulturalSiteCategoryDTO>> getAllCulturalSiteCategories() {
		List<CulturalSiteCategory> culturalSiteCategories = culturalSiteCategoryService.findAll();
		return new ResponseEntity<>(culturalSiteCategoryMapper.toDtoList(culturalSiteCategories), HttpStatus.OK);
	}
	
	/*
		url: POST localhost:8080/api/cultural-site-category
		HTTP request for creating new cultural site category
	*/
	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<CulturalSiteCategoryDTO> createCulturalSiteCategory(@RequestBody CulturalSiteCategoryDTO culturalSiteCategoryDto) {
		CulturalSiteCategory culturalSiteCategory = culturalSiteCategoryMapper.toEntity(culturalSiteCategoryDto);
		try {
			culturalSiteCategory = culturalSiteCategoryService.create(culturalSiteCategory);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(culturalSiteCategoryMapper.toDto(culturalSiteCategory), HttpStatus.OK);
	}
	
	/*
		url: GET localhost:8080/api/cultural-site-category/{id}
		HTTP request for getting one cultural site category by id
	*/
	@GetMapping(value = "/{id}")
	public ResponseEntity<CulturalSiteCategoryDTO> getCulturalSiteCategory(@PathVariable("id") Long id) {
		CulturalSiteCategory culturalSiteCategory = culturalSiteCategoryService.findOneById(id);
        if (culturalSiteCategory == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(culturalSiteCategoryMapper.toDto(culturalSiteCategory), HttpStatus.OK);
	}
	
	/*
		url: PUT localhost:8080/api/cultural-site-category/{id}
		HTTP request for updating a cultural site category by id
	*/
	@PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<CulturalSiteCategoryDTO> updateCulturalSiteCategory(@PathVariable("id") Long id, 
											@RequestBody CulturalSiteCategoryDTO culturalSiteCategoryDto) {
		CulturalSiteCategory culturalSiteCategory = culturalSiteCategoryMapper.toEntity(culturalSiteCategoryDto);
		try {
			culturalSiteCategory = culturalSiteCategoryService.update(culturalSiteCategory, id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
        return new ResponseEntity<>(culturalSiteCategoryMapper.toDto(culturalSiteCategory), HttpStatus.OK);
	}
	
	/*
		url: DELETE localhost:8080/api/cultural-site-category/{id}
		HTTP request for deleting a cultural site category by id
	*/
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deleteCulturalSiteCategory(@PathVariable("id") Long id) {
		try {
			culturalSiteCategoryService.delete(id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	/*
		url: GET localhost:8080/api/cultural-site-category/{category-id}/type
		HTTP request for getting all category types of a cultural site category given by id
	*/
	@GetMapping(value = "/{category-id}/type")
	public ResponseEntity<List<CulturalCategoryTypeDTO>> getAllCategoryTypes(@PathVariable("category-id") Long categoryId) {
        List<CulturalCategoryType> categoryTypes = culturalCategoryTypeService.findAll(categoryId);
        return new ResponseEntity<>(culturalCategoryTypeMapper.toDtoList(categoryTypes), HttpStatus.OK);
	}
	
	/*
		url: POST localhost:8080/api/cultural-site-category/{category-id}/type
		HTTP request for creating a new category type for category given by id
	*/
	@PostMapping(value = "/{category-id}/type")
	public ResponseEntity<CulturalCategoryTypeDTO> createCategoryType(@PathVariable("category-id") Long categoryId, 
																	@RequestBody CulturalCategoryTypeDTO categoryTypeDto) {
		CulturalCategoryType culturalCategoryType = culturalCategoryTypeMapper.toEntity(categoryTypeDto);
		try {
			culturalCategoryType = culturalCategoryTypeService.create(categoryId, culturalCategoryType);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(culturalCategoryTypeMapper.toDto(culturalCategoryType), HttpStatus.OK);
	}
	
	/*
		url: GET localhost:8080/api/cultural-site-category/{category-id}/type/{id}
		HTTP request for getting a category type by given id and given category id
	*/
	@GetMapping(value = "/{category-id}/type/{id}")
	public ResponseEntity<CulturalCategoryTypeDTO> getCategoryType(@PathVariable("category-id") Long categoryId, 
																@PathVariable("id") Long typeId) {
		CulturalCategoryType categoryType = culturalCategoryTypeService.findOneById(typeId);
		if (categoryType == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(culturalCategoryTypeMapper.toDto(categoryType), HttpStatus.OK);
	}
	
	/*
		url: PUT localhost:8080/api/cultural-site-category/{category-id}/type/{id}
		HTTP request for updating a category type by given id and given category id
	*/
	@PutMapping(value = "/{category-id}/type/{id}")
	public ResponseEntity<CulturalCategoryTypeDTO> updateCategoryType(@PathVariable("category-id") Long categoryId, 
																@PathVariable("id") Long typeId, 
																@RequestBody CulturalCategoryTypeDTO typeDto) {
		CulturalCategoryType categoryType = culturalCategoryTypeMapper.toEntity(typeDto);
		try {
			categoryType = culturalCategoryTypeService.update(categoryType, typeId);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
        return new ResponseEntity<>(culturalCategoryTypeMapper.toDto(categoryType), HttpStatus.OK);
	}
	
	/*
		url: DELETE localhost:8080/api/cultural-site-category/{category-id}/type/{id}
		HTTP request for deleting a category type by given id and given category id
	*/
	@DeleteMapping(value = "/{category-id}/type/{id}")
	public ResponseEntity<Void> deleteCategoryType(@PathVariable("category-id") Long categoryId, 
																@PathVariable("id") Long typeId) {
		try {
			culturalCategoryTypeService.delete(typeId);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
		}
	    return new ResponseEntity<>(HttpStatus.OK);
	}
}
