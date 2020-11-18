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
public class CulturalCategoryType {

	@Getter
	@NonNull
	private UUID id;

	@Getter
	@NonNull
	private String name;

	@Getter
	@NonNull
	private CulturalSiteCategory culturalSiteCategory;

	@Getter
	private Set<CulturalSite> culturalSites;

}
