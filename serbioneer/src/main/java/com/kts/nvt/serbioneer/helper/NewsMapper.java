package com.kts.nvt.serbioneer.helper;

import com.kts.nvt.serbioneer.dto.NewsDTO;
import com.kts.nvt.serbioneer.model.Image;
import com.kts.nvt.serbioneer.model.News;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

public class NewsMapper implements MapperInterface<News, NewsDTO>{
	
	private ImageMapper imageMapper = new ImageMapper();
	
    @Override
    public News toEntity(NewsDTO dto) {
        return new News(dto.getInformation());
    }

    @Override
    public NewsDTO toDto(News entity) {
    	if(entity.getImages() == null) {
    		entity.setImages(new HashSet<Image>());
    	}
        return new NewsDTO(entity.getId(), entity.getInformation(), entity.getDateTime(),
                entity.getCulturalSite().getName(), imageMapper.toDtoList(new ArrayList<>(entity.getImages())));
    }

    @Override
    public List<News> toEntityList(List<NewsDTO> dtoList) {
        List<News> entities = new ArrayList<>();
        for(NewsDTO dto : dtoList){
            entities.add(toEntity(dto));
        }

        return entities;
    }

    @Override
    public List<NewsDTO> toDtoList(List<News> entityList) {
        List<NewsDTO> dtos = new ArrayList<>();
        for(News entity : entityList) {
            dtos.add(toDto(entity));
        }

        return dtos;
    }

    @Override
    public Page<NewsDTO> toDtoPage(Page<News> entityPage) {
        List<NewsDTO> newsDTOS = toDtoList(entityPage.toList());
        return new PageImpl<>(newsDTOS, entityPage.getPageable(), entityPage.getTotalElements());
    }
}
