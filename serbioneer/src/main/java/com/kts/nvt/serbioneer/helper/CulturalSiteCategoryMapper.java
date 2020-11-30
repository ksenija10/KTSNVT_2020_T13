package com.kts.nvt.serbioneer.helper;

import java.util.ArrayList;
import java.util.List;

import com.kts.nvt.serbioneer.dto.CulturalSiteCategoryDTO;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import org.springframework.data.domain.Page;

public class CulturalSiteCategoryMapper implements MapperInterface<CulturalSiteCategory, CulturalSiteCategoryDTO> {

	@Override
	public CulturalSiteCategory toEntity(CulturalSiteCategoryDTO dto) {
		return new CulturalSiteCategory(dto.getName());
	}

	@Override
	public CulturalSiteCategoryDTO toDto(CulturalSiteCategory entity) {
		return new CulturalSiteCategoryDTO(entity.getId(), entity.getName());
	}

	@Override
	public List<CulturalSiteCategory> toEntityList(List<CulturalSiteCategoryDTO> dtoList) {
		List<CulturalSiteCategory> culturalSiteCategories = new ArrayList<>();
		for(CulturalSiteCategoryDTO dto : dtoList) {
			culturalSiteCategories.add(toEntity(dto));
		}
		return culturalSiteCategories;
	}

	@Override
	public List<CulturalSiteCategoryDTO> toDtoList(List<CulturalSiteCategory> entityList) {
		List<CulturalSiteCategoryDTO> culturalSiteCategoryDtos = new ArrayList<>();
		for(CulturalSiteCategory entity : entityList) {
			culturalSiteCategoryDtos.add(toDto(entity));
		}
		return culturalSiteCategoryDtos;
	}

	@Override
	public Page<CulturalSiteCategoryDTO> toDtoPage(Page<CulturalSiteCategory> entityPage) {
		return null;
	}

}
