package com.kts.nvt.serbioneer.service;

import java.util.List;

public interface ServiceInterface<T> {

	List<T> findAll();
	
	T findOneById(Long id);
	
	T create(T entity) throws Exception;
	
	void delete(Long id) throws Exception;
	
	T update(T entity, Long id) throws Exception;
}
