package com.kts.nvt.serbioneer.model;

import java.util.Set;
import java.util.UUID;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode
public abstract class User {
	
	@Getter
	@NonNull
	private UUID id;
	
	@Getter
	@NonNull
	private String name;
	
	@Getter
	@NonNull
	private String surname;
	
	@Getter
	@NonNull
	private String email;
	
	@Getter
	@NonNull
	private String password;
	
	@Getter
	private Set<Authority> authorities; 
}
