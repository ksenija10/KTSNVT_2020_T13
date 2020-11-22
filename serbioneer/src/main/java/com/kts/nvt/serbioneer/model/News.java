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
@Table(name = "news")
public class News {
	
	@Getter
	@Setter
	@NonNull
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Getter
	@Setter
	@NonNull
	@Column(name = "information", nullable = false, unique = false)
	private String information;
	
	@Getter
	@Setter
	@NonNull
	@Column(name = "date_time", nullable = false, unique = false)
	private Date dateTime;

	@Getter
	@Setter
	@NonNull
	@ManyToOne
	@JoinColumn(name = "site_id", referencedColumnName = "id", nullable = false)
	private CulturalSite culturalSite;
	
	@Getter
	@Setter
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "news")
	private Set<Image> images;
}
