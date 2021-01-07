package com.kts.nvt.serbioneer.helper.exception;

import java.util.Date;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.server.ResponseStatusException;

import com.kts.nvt.serbioneer.dto.ExceptionDTO;

@ControllerAdvice
public class GlobalExceptionHandler {
	@ExceptionHandler(ResponseStatusException.class)
	public ResponseEntity<ExceptionDTO> generateHttpException(ResponseStatusException ex) {
		ExceptionDTO exceptionDto = new ExceptionDTO();
		exceptionDto.setMessage(ex.getReason());
		exceptionDto.setStatus(String.valueOf(ex.getStatus().value()));
		exceptionDto.setTime(new Date().toString());
		return new ResponseEntity<ExceptionDTO>(exceptionDto, ex.getStatus());
	}
}