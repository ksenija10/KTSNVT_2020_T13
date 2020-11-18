package com.kts.nvt.serbioneer.service;

import java.util.Set;
import java.util.UUID;

public interface ServiceInterface<T> {

	Set<T> findAll();
	
	T findOneById(UUID id);
	
	T create(T entity) throws Exception;
	
	void delete(UUID id) throws Exception;
	
	T update(T entity, UUID id) throws Exception;
}
