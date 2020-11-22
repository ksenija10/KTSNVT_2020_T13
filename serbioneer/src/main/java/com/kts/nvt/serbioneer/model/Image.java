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
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@EqualsAndHashCode

@Entity
@Table(name = "image")
public class Image {

	@Getter
	@Setter
	@NonNull
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
	@Column(name = "content", nullable = false, unique = false)
	private String content;

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
}
