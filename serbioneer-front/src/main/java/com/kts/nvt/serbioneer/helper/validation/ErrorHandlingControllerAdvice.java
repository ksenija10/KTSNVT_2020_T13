package com.kts.nvt.serbioneer.helper.validation;

import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;

import org.springframework.http.HttpStatus;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

// omogucavamo pristup svim kontrolerima u okviru Spring konteksta
@ControllerAdvice
class ErrorHandlingControllerAdvice {

	// kreiranje custom objekta sa svim prekrsenim validacijama polja DTO objekta
	// baca Hibernate
	@ExceptionHandler(ConstraintViolationException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	ValidationErrorResponse onConstraintValidationException(ConstraintViolationException e) {
		ValidationErrorResponse error = new ValidationErrorResponse();
		for (ConstraintViolation violation : e.getConstraintViolations()) {
			error.getViolations().add(new Violation(violation.getPropertyPath().toString(), violation.getMessage()));
		}
		return error;
	}

	// kreiranje custom objekta sa svim prekrsenim validacijama polja DTO objekta
	@ExceptionHandler(MethodArgumentNotValidException.class)
	@ResponseStatus(HttpStatus.BAD_REQUEST)
	@ResponseBody
	ValidationErrorResponse onMethodArgumentNotValidException(MethodArgumentNotValidException e) {
		ValidationErrorResponse error = new ValidationErrorResponse();
		for (FieldError fieldError : e.getBindingResult().getFieldErrors()) {
			error.getViolations().add(new Violation(fieldError.getField(), fieldError.getDefaultMessage()));
		}
		return error;
	}

}