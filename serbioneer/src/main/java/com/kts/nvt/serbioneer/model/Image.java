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
public class Image {

	@Getter
	@NonNull
	private UUID id;

	@Getter
	@NonNull
	private String name;

	@Getter
	@NonNull
	private String content;

	@Getter
	private News news;

	@Getter
	private CulturalSite culturalSite;

	@Getter
	private Comment comment;
}
