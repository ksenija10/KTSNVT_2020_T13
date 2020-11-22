package com.kts.nvt.serbioneer.model;

import java.util.Set;

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
public class Authority {

	@Getter
	@NonNull
	private Long id;

	@Getter
	@NonNull
	private String name;

	@Getter
	private Set<User> users;
}
