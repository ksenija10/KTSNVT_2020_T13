package com.kts.nvt.serbioneer.helper;

import com.kts.nvt.serbioneer.dto.NewsDTO;
import com.kts.nvt.serbioneer.model.News;

import java.util.ArrayList;
import java.util.List;

public class NewsMapper implements MapperInterface<News, NewsDTO>{
    @Override
    public News toEntity(NewsDTO dto) {
        return new News(dto.getInformation());
    }

    @Override
    public NewsDTO toDto(News entity) {
        return new NewsDTO(entity.getId(), entity.getInformation(), entity.getDateTime(),
                entity.getCulturalSite().getName());
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
}
