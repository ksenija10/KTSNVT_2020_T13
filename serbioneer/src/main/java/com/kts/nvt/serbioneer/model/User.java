package com.kts.nvt.serbioneer.model;

import java.util.Set;
import java.util.UUID;

public abstract class User {
	
	private UUID id;
	private String name;
	private String surname;
	private String email;
	private String password;
	
	private Set<Authority> authorities; 
}
