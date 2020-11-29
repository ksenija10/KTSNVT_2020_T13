package com.kts.nvt.serbioneer.helper;

import java.util.ArrayList;
import java.util.List;

import com.kts.nvt.serbioneer.dto.ImageDTO;
import com.kts.nvt.serbioneer.model.Image;

public class ImageMapper implements MapperInterface<Image, ImageDTO> {

	@Override
	public Image toEntity(ImageDTO dto) {
		return new Image(dto.getName(), dto.getContent());
	}

	@Override
	public ImageDTO toDto(Image entity) {
		return new ImageDTO(entity.getId(), entity.getName(), entity.getContent());
	}

	@Override
	public List<Image> toEntityList(List<ImageDTO> dtoList) {
		List<Image> images = new ArrayList<>();
		for (ImageDTO dto : dtoList) {
			images.add(toEntity(dto));
		}
		return images;
	}

	@Override
	public List<ImageDTO> toDtoList(List<Image> entityList) {
		List<ImageDTO> imageDtos = new ArrayList<>();
		for (Image entity : entityList) {
			imageDtos.add(toDto(entity));
		}
		return imageDtos;
	}

}
