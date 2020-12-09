package com.kts.nvt.serbioneer.helper.exception;

public class LoggedInUserNotFoundException extends Exception {
	private static final long serialVersionUID = 1L;
	
	public LoggedInUserNotFoundException() {
		super("Logged in user not found in database");
	}
}
