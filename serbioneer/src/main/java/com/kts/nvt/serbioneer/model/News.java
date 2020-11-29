package com.kts.nvt.serbioneer.model;

import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "news")
public class News {

	@NonNull
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NonNull
	@Column(name = "information", nullable = false, unique = false)
	private String information;

	@NonNull
	@Column(name = "date_time", nullable = false, unique = false)
	private Date dateTime;

	@NonNull
	@ManyToOne
	@JoinColumn(name = "site_id", referencedColumnName = "id", nullable = false)
	private CulturalSite culturalSite;

	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "news")
	private Set<Image> images;

	public News(@NonNull String information) {
		this.information = information;
	}
}
