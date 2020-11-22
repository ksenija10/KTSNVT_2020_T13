package com.kts.nvt.serbioneer.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

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
public class CulturalSiteCategory {

	@Getter
	@Setter
	@NonNull
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Getter
	@Setter
	@NonNull
	@Column(name = "name", nullable = false, unique = true)
	private String name;
	
	@Getter
	@Setter
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "culturalSiteCategory")
	private Set<CulturalCategoryType> culturalCategoryTypes;
	
	@Getter
	@Setter
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "culturalSiteCategory")
	private Set<CulturalSite> culturalSites;
}
