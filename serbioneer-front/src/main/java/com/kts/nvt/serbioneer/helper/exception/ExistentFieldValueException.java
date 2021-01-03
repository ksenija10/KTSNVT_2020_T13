package com.kts.nvt.serbioneer.helper.exception;

public class ExistentFieldValueException extends Exception {

	private static final long serialVersionUID = 1L;

	public ExistentFieldValueException(String type, String fieldName) {
		super(String.format("%s with given %s already exists.", type, fieldName));
	}
}