package com.kts.nvt.serbioneer.model;

import java.util.Set;
import java.util.UUID;

public class Authority {
	
	private UUID id;
	private String name;
	
	private Set<User> users;
}
