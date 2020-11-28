package com.kts.nvt.serbioneer.helper;

import java.util.List;

public interface MapperInterface<T, U> {

	T toEntity(U dto);
	
	U toDto(T entity);
	
	List<T> toEntityList(List<U> dtoList);
	
	List<U> toDtoList(List<T> entityList);
}
