package com.kts.nvt.serbioneer.helper.exception;

public class ForeignKeyException extends Exception {

	private static final long serialVersionUID = 1L;

	public ForeignKeyException(String type) {
		super(String.format("%s with associated cultural sites cannot be deleted.", type));
	}
}
