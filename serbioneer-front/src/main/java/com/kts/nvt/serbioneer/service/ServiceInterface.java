package com.kts.nvt.serbioneer.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface ServiceInterface<T> {
	
	Page<T> findAll(Pageable pageable);
	
	T findOneById(Long id);
	
	void delete(Long id) throws Exception;
}
