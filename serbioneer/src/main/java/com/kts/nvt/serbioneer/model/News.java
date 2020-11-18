package com.kts.nvt.serbioneer.model;

import java.util.Date;
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
public class News {
	
	@Getter
	@NonNull
	private UUID id;
	
	@Getter
	@NonNull
	private String information;
	
	@Getter
	@NonNull
	private Date dateTime;

	@Getter
	@NonNull
	private CulturalSite culturalSite;
	
	@Getter
	private Set<Image> images;
}
