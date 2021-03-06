package com.kts.nvt.serbioneer.helper;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import com.kts.nvt.serbioneer.dto.ImageDTO;
import com.kts.nvt.serbioneer.model.Image;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

public class ImageMapper implements MapperInterface<Image, ImageDTO> {

	@Override
	public Image toEntity(ImageDTO dto) {
		return null;
	}

	@Override
	public ImageDTO toDto(Image entity){
		byte[] content;
		try {
			content = Files.readAllBytes (Paths.get (entity.getPath()));
		} catch (IOException e) {
			content = null;
		}
		ImageDTO imageDto = new ImageDTO(entity.getId(), entity.getName(), content);
		return imageDto;
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

	@Override
	public Page<ImageDTO> toDtoPage(Page<Image> entityPage) {
		List<ImageDTO> imageDTOList = toDtoList(entityPage.toList());
		return new PageImpl<>(imageDTOList, entityPage.getPageable(), entityPage.getTotalElements());
	}

}
