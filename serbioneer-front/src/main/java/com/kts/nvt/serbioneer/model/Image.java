package com.kts.nvt.serbioneer.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

import java.util.Objects;

@AllArgsConstructor
@RequiredArgsConstructor

@Entity
@Table(name = "image")
@SQLDelete(sql =
"UPDATE image " +
"SET is_active = false " +
"WHERE id = ?")
@Where(clause="is_active=true")
public class Image {

	@Getter
	@Setter
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Getter
	@Setter
	@Column(name="is_active")
	private Boolean active;
	
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

	public Image() {
		this.active = true;
	}
	
	public Image(@NonNull String name, @NonNull String path, Comment comment) {
		this.active = true;
		this.name = name;
		this.path = path;
		this.comment = comment;
	}

	public Image(@NonNull String name, @NonNull String path, News news) {
		this.active = true;
		this.name = name;
		this.path = path;
		this.news = news;
	}

	public Image(@NonNull String name, @NonNull String path, CulturalSite culturalSite) {
		this.active = true;
		this.name = name;
		this.path = path;
		this.culturalSite = culturalSite;
	}

	@Override
	public String toString() {
		return "Image{" +
				"id=" + id +
				", active=" + active +
				", name='" + name + '\'' +
				", path='" + path + '\'' +
				", news=" + news +
				", culturalSite=" + culturalSite +
				", comment=" + comment +
				'}';
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Image image = (Image) o;
		return name.equals(image.name) && path.equals(image.path);
	}

	@Override
	public int hashCode() {
		return Objects.hash(name, path);
	}
}
