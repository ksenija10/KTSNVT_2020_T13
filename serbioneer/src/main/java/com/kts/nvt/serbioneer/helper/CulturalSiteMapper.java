package com.kts.nvt.serbioneer.helper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

import com.kts.nvt.serbioneer.dto.CulturalSiteDTO;
import com.kts.nvt.serbioneer.model.CulturalSite;

public class CulturalSiteMapper implements MapperInterface<CulturalSite, CulturalSiteDTO> {

	@Override
	public CulturalSite toEntity(CulturalSiteDTO dto) {
		return new CulturalSite(dto.getName(), dto.getLat(), dto.getLng(),
								dto.getAddress(), dto.getCity(), dto.getDescription());
	}

	@Override
	public CulturalSiteDTO toDto(CulturalSite entity) {
		return new CulturalSiteDTO(entity.getId(), entity.getName(),
									entity.getCulturalSiteCategory().getId(), 
									entity.getCulturalSiteCategory().getName(),
									entity.getCulturalCategoryType().getId(),
									entity.getCulturalCategoryType().getName(),
									entity.getLat(), entity.getLng(),
									entity.getAddress(), entity.getCity(),
									entity.getDescription());
	}

	@Override
	public List<CulturalSite> toEntityList(List<CulturalSiteDTO> dtoList) {
		List<CulturalSite> entities = new ArrayList<>();
		for(CulturalSiteDTO dto : dtoList) {
			entities.add(toEntity(dto));
		}
		return entities;
	}

	@Override
	public List<CulturalSiteDTO> toDtoList(List<CulturalSite> entityList) {
		List<CulturalSiteDTO> dtos = new ArrayList<>();
		for(CulturalSite entity : entityList) {
			dtos.add(toDto(entity));
		}
		return dtos;
	}

	@Override
	public Page<CulturalSiteDTO> toDtoPage(Page<CulturalSite> entityPage) {
		List<CulturalSiteDTO> culturalSiteDTOList = toDtoList(entityPage.toList());
		return new PageImpl<>(culturalSiteDTOList, entityPage.getPageable(), entityPage.getTotalElements());
	}

}
