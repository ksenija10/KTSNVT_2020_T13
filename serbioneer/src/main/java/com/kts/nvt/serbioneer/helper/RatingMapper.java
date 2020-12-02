package com.kts.nvt.serbioneer.helper;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

import com.kts.nvt.serbioneer.dto.RatingDTO;
import com.kts.nvt.serbioneer.model.Rating;

public class RatingMapper implements MapperInterface<Rating, RatingDTO> {

	@Override
	public Rating toEntity(RatingDTO dto) {
		return new Rating(dto.getValue());
	}

	@Override
	public RatingDTO toDto(Rating entity) {
		return new RatingDTO(entity.getId(), entity.getValue(), entity.getCulturalSite().getId(),
				entity.getAuthenticatedUser().getId());
	}

	@Override
	public List<Rating> toEntityList(List<RatingDTO> dtoList) {
		return null;
	}

	@Override
	public List<RatingDTO> toDtoList(List<Rating> entityList) {
		List<RatingDTO> ratingDtos = new ArrayList<>();
		for (Rating rating : entityList) {
			ratingDtos.add(toDto(rating));
		}
		return ratingDtos;
	}

	@Override
	public Page<RatingDTO> toDtoPage(Page<Rating> entityPage) {
		List<RatingDTO> ratingDTOList = toDtoList(entityPage.toList());
		return new PageImpl<>(ratingDTOList, entityPage.getPageable(), entityPage.getTotalElements());
	}

}
