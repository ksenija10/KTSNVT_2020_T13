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

import com.kts.nvt.serbioneer.dto.CulturalSiteCategoryDTO;
import com.kts.nvt.serbioneer.helper.CulturalSiteCategoryMapper;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import com.kts.nvt.serbioneer.service.CulturalSiteCategoryService;


@RestController
@RequestMapping(value = "api/cultural-site-category", produces = MediaType.APPLICATION_JSON_VALUE)
public class CulturalSiteCategoryController {

	@Autowired
	private CulturalSiteCategoryService culturalSiteCategoryService;
	
	private CulturalSiteCategoryMapper culturalSiteCategoryMapper;
	
	public CulturalSiteCategoryController() {
		this.culturalSiteCategoryMapper = new CulturalSiteCategoryMapper();
	}

	@GetMapping
	public ResponseEntity<List<CulturalSiteCategoryDTO>> getAllCulturalSiteCategories() {
		List<CulturalSiteCategory> culturalSiteCategories = culturalSiteCategoryService.findAll();
		return new ResponseEntity<>(culturalSiteCategoryMapper.toDtoList(culturalSiteCategories), HttpStatus.OK);
	}
	
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
	
	@GetMapping(value = "/{id}")
	public ResponseEntity<CulturalSiteCategoryDTO> getCulturalSiteCategory(@PathVariable("id") Long id) {
		CulturalSiteCategory culturalSiteCategory = culturalSiteCategoryService.findOneById(id);
        if(culturalSiteCategory == null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(culturalSiteCategoryMapper.toDto(culturalSiteCategory), HttpStatus.OK);
	}
	
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
	
	@DeleteMapping(value = "/{id}")
	public ResponseEntity<Void> deleteCulturalSiteCategory(@PathVariable("id") Long id) {
		try {
			culturalSiteCategoryService.delete(id);
		} catch (Exception e) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, e.getMessage());
		}
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}
