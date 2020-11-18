package com.kts.nvt.serbioneer.model;

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
public class Rating {
	
	@Getter
	@NonNull
	private UUID id;
	
	@Getter
	private int value;

	@Getter
	@NonNull
	private CulturalSite culturalSite;
	
	@Getter
	@NonNull
	private AuthenticatedUser authenticatedUser;
}
