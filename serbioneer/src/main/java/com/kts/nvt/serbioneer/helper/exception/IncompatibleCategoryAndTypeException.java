package com.kts.nvt.serbioneer.helper.exception;

public class IncompatibleCategoryAndTypeException extends Exception {

	private static final long serialVersionUID = 1L;

	public IncompatibleCategoryAndTypeException() {
		super("Cultural category type doesn't belong to the given cultural site category.");
	}
}
