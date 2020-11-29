package com.kts.nvt.serbioneer.helper;

import java.util.ArrayList;
import java.util.List;

import com.kts.nvt.serbioneer.dto.CulturalCategoryTypeDTO;
import com.kts.nvt.serbioneer.model.CulturalCategoryType;

public class CulturalCategoryTypeMapper implements MapperInterface<CulturalCategoryType, CulturalCategoryTypeDTO> {

	@Override
	public CulturalCategoryType toEntity(CulturalCategoryTypeDTO dto) {
		return new CulturalCategoryType(dto.getName());
	}

	@Override
	public CulturalCategoryTypeDTO toDto(CulturalCategoryType entity) {
		return new CulturalCategoryTypeDTO(entity.getId(), entity.getName(),
											entity.getCulturalSiteCategory().getId(),
											entity.getCulturalSiteCategory().getName());
	}

	@Override
	public List<CulturalCategoryType> toEntityList(List<CulturalCategoryTypeDTO> dtoList) {
		List<CulturalCategoryType> entities = new ArrayList<>();
		for(CulturalCategoryTypeDTO dto : dtoList) {
			entities.add(toEntity(dto));
		}
		return entities;
	}

	@Override
	public List<CulturalCategoryTypeDTO> toDtoList(List<CulturalCategoryType> entityList) {
		List<CulturalCategoryTypeDTO> dtos = new ArrayList<>();
		for(CulturalCategoryType entity : entityList) {
			dtos.add(toDto(entity));
		}
		return dtos;
	}

	
}
