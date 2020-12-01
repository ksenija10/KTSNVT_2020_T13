package com.kts.nvt.serbioneer.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor

@Entity
@Table(name = "image")
public class Image {

	@Getter
	@Setter
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Getter
	@Setter
	@NonNull
	@Column(name = "name", nullable = false, unique = false)
	private String name;

	@Getter
	@Setter
	@NonNull
	@Column(name = "path", nullable = false, unique = false)
	private String path;

	@Getter
	@Setter
	@ManyToOne
	@JoinColumn(name = "news", referencedColumnName = "id", nullable = true)
	private News news;

	@Getter
	@Setter
	@ManyToOne
	@JoinColumn(name = "cultural_site", referencedColumnName = "id", nullable = true)
	private CulturalSite culturalSite;

	@Getter
	@Setter
	@ManyToOne
	@JoinColumn(name = "comment", referencedColumnName = "id", nullable = true)
	private Comment comment;

	public Image(@NonNull String name, @NonNull String path, Comment comment) {
		
		this.name = name;
		this.path = path;
		this.comment = comment;
	}

	public Image(@NonNull String name, @NonNull String path, News news) {
		
		this.name = name;
		this.path = path;
		this.news = news;
	}

	public Image(@NonNull String name, @NonNull String path, CulturalSite culturalSite) {
		
		this.name = name;
		this.path = path;
		this.culturalSite = culturalSite;
	}
	
	
}
