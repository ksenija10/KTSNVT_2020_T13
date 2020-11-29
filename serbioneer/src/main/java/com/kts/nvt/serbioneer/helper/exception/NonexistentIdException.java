package com.kts.nvt.serbioneer.helper.exception;

public class NonexistentIdException extends Exception {
	
	private static final long serialVersionUID = 1L;

	public NonexistentIdException(String type) {
		super(String.format("%s with given id doesn't exist.", type));
	}
}
