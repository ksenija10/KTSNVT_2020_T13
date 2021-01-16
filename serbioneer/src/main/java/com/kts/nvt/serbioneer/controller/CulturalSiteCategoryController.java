package com.kts.nvt.serbioneer.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
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
import com.kts.nvt.serbioneer.helper.exception.ForeignKeyException;
import com.kts.nvt.serbioneer.model.CulturalCategoryType;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import com.kts.nvt.serbioneer.service.CulturalCategoryTypeService;
import com.kts.nvt.serbioneer.service.CulturalSiteCategoryService;


@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping(value = "api/cultural-site-category", produces = MediaType.APPLICATION_JSON_VALUE)
public class CulturalSiteCategoryController {

	@Autowired
	private CulturalSiteCategoryService culturalSiteCategoryService;
	
	@Autowired
	private CulturalCategoryTypeService culturalCategoryTypeService;
	
	private final CulturalSiteCategoryMapper culturalSiteCategoryMapper;
	private final CulturalCategoryTypeMapper culturalCategoryTypeMapper;
	
	public CulturalSiteCategoryController() {
		this.culturalSiteCategoryMapper = new CulturalSiteCategoryMapper();
		this.culturalCategoryTypeMapper = new CulturalCategoryTypeMapper();
	}

	
	/*
		url: GET localhost:8080/api/cultural-site-category
		HTTP request for getting all cultural site categories
	*/
	@CrossOrigin(origins = "http://localhost:4200")
	@GetMapping
	public ResponseEntity<List<CulturalSiteCategoryDTO>> getAllCulturalSiteCategories() {
		List<CulturalSiteCategory> culturalSiteCategories = culturalSiteCategoryService.findAll();
		return new ResponseEntity<>(culturalSiteCategoryMapper.toDtoList(culturalSiteCategories), HttpStatus.OK);
	}
	
	/*
		url: GET localhost:8080/api/cultural-site-category/by-page
		HTTP request for getting all cultural site categories by page
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/by-page")
	public ResponseEntity<Page<CulturalSiteCategoryDTO>> getAllCulturalSiteCategories(Pageable pageable) {
		Page<CulturalSiteCategory> page = culturalSiteCategoryService.findAll(pageable);
		return new ResponseEntity<>(culturalSiteCategoryMapper.toDtoPage(page), HttpStatus.OK);
    }
	
	/*
		url: POST localhost:8080/api/cultural-site-category
		HTTP request for creating new cultural site category
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<CulturalSiteCategoryDTO> createCulturalSiteCategory(
			@Valid @RequestBody CulturalSiteCategoryDTO culturalSiteCategoryDto) {
		CulturalSiteCategory culturalSiteCategory = culturalSiteCategoryMapper.toEntity(culturalSiteCategoryDto);
		try {
			culturalSiteCategory = culturalSiteCategoryService.create(culturalSiteCategory);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(culturalSiteCategoryMapper.toDto(culturalSiteCategory), HttpStatus.CREATED);
	}
	
	/*
		url: GET localhost:8080/api/cultural-site-category/{id}
		HTTP request for getting one cultural site category by id
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
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
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PutMapping(value = "/{id}", consumes = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<CulturalSiteCategoryDTO> updateCulturalSiteCategory(
				@PathVariable("id") Long id, 
				@Valid @RequestBody CulturalSiteCategoryDTO culturalSiteCategoryDto) {
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
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deleteCulturalSiteCategory(@PathVariable("id") Long id) {
		try {
			culturalSiteCategoryService.delete(id);
		} catch (ForeignKeyException e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	/*
		url: GET localhost:8080/api/cultural-site-category/{category-id}/type
		HTTP request for getting all category types of a cultural site category given by id
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/{category-id}/type")
	public ResponseEntity<List<CulturalCategoryTypeDTO>> getAllCategoryTypes(@PathVariable("category-id") Long categoryId) {
		try {
			List<CulturalCategoryType> categoryTypes = culturalCategoryTypeService.findAll(categoryId);
			return new ResponseEntity<>(culturalCategoryTypeMapper.toDtoList(categoryTypes), HttpStatus.OK);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
	}
	
	/*
		url: GET localhost:8080/api/cultural-site-category/{category-id}/type/by-page
		HTTP request for getting all category types by page of a cultural site category given by id
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/{category-id}/type/by-page")
	public ResponseEntity<Page<CulturalCategoryTypeDTO>> getAllCategoryTypes(
			@PathVariable("category-id") Long categoryId, Pageable pageable) {
		try {
			Page<CulturalCategoryType> page = culturalCategoryTypeService.findAll(categoryId, pageable);
			return new ResponseEntity<>(culturalCategoryTypeMapper.toDtoPage(page), HttpStatus.OK);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
	}
	
	/*
		url: POST localhost:8080/api/cultural-site-category/{category-id}/type
		HTTP request for creating a new category type for category given by id
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping(value = "/{category-id}/type")
	public ResponseEntity<CulturalCategoryTypeDTO> createCategoryType(
					@PathVariable("category-id") Long categoryId, 
					@Valid @RequestBody CulturalCategoryTypeDTO categoryTypeDto) {
		CulturalCategoryType culturalCategoryType = culturalCategoryTypeMapper.toEntity(categoryTypeDto);
		try {
			culturalCategoryType = culturalCategoryTypeService.create(categoryId, culturalCategoryType);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
		return new ResponseEntity<>(culturalCategoryTypeMapper.toDto(culturalCategoryType), HttpStatus.CREATED);
	}
	
	/*
		url: GET localhost:8080/api/cultural-site-category/type/{id}
		HTTP request for getting a category type by given id
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/type/{id}")
	public ResponseEntity<CulturalCategoryTypeDTO> getCategoryType(@PathVariable("id") Long typeId) {
		CulturalCategoryType categoryType = culturalCategoryTypeService.findOneById(typeId);
		if (categoryType == null) {
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<>(culturalCategoryTypeMapper.toDto(categoryType), HttpStatus.OK);
	}
	
	/*
		url: PUT localhost:8080/api/cultural-site-category/type/{id}
		HTTP request for updating a category type by given id
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PutMapping(value = "/type/{id}")
	public ResponseEntity<CulturalCategoryTypeDTO> updateCategoryType(
								@PathVariable("id") Long typeId, 
								@Valid @RequestBody CulturalCategoryTypeDTO typeDto) {
		CulturalCategoryType categoryType = culturalCategoryTypeMapper.toEntity(typeDto);
		try {
			categoryType = culturalCategoryTypeService.update(categoryType, typeId);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		}
        return new ResponseEntity<>(culturalCategoryTypeMapper.toDto(categoryType), HttpStatus.OK);
	}
	
	/*
		url: DELETE localhost:8080/api/cultural-site-category/type/{id}
		HTTP request for deleting a category type by given id
	*/
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@DeleteMapping(value = "/type/{id}")
	public ResponseEntity<Void> deleteCategoryType(@PathVariable("id") Long typeId) {
		try {
			culturalCategoryTypeService.delete(typeId);
		} catch (ForeignKeyException e) {
			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, e.getMessage());
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
		}
	    return new ResponseEntity<>(HttpStatus.OK);
	}
}
