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
public class Comment {

	@Getter
	@NonNull
	private UUID id;

	@Getter
	@NonNull
	private String value;

	@Getter
	@NonNull
	private AuthenticatedUser authanticatedUser;

	@Getter
	@NonNull
	private CulturalSite culturalSite;

	@Getter
	private Set<Image> images;

}
