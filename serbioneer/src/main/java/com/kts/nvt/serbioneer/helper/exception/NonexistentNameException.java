package com.kts.nvt.serbioneer.helper.exception;

public class NonexistentNameException extends Exception{
    private static final long serialVersionUID = 1L;

    public NonexistentNameException(String type) {
        super(String.format("%s with given name doesn't exist.", type));
    }
}
