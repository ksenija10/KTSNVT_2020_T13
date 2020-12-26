package com.kts.nvt.serbioneer.helper.exception;

public class UserViolationException extends Exception {
    private static final long serialVersionUID = 1L;

    public UserViolationException(String action, String entity) {
        super(String.format("You can only %s your own %s.", action, entity));
    }
}
