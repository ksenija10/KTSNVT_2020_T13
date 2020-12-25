package com.kts.nvt.serbioneer.helper.exception;

public class NonExistingAuthenticatedUser extends Exception{

    private static final long serialVersionUID = 1L;

    public NonExistingAuthenticatedUser() {
        super("Authenticated user with given id doesn't exist.");
    }
}
