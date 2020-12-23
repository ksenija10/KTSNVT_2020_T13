package com.kts.nvt.serbioneer.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

@AllArgsConstructor

@Entity
@Table(name = "cultural_category")
@SQLDelete(sql =
"UPDATE cultural_category " +
"SET is_active = false " +
"WHERE id = ?")
@Where(clause="is_active=true")
public class CulturalSiteCategory {

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
	@Column(name = "name", nullable = false, unique = true)
	private String name;
	
	@Getter
	@Setter
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "culturalSiteCategory")
	private Set<CulturalCategoryType> culturalCategoryTypes;

	@Getter
	@Setter
	@OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY, mappedBy = "culturalSiteCategory")
	private Set<CulturalSite> culturalSites;
	
	public CulturalSiteCategory() {
		this.active = true;
	}
	
	public CulturalSiteCategory(@NonNull String name) {
		this.active = true;
		this.name = name;
		this.culturalSites = new HashSet<>();
		this.culturalCategoryTypes = new HashSet<>();
	}
	
	public void addCulturalCategoryType(CulturalCategoryType categoryType) {
		if (this.culturalCategoryTypes == null) {
			this.culturalSites = new HashSet<>();
		}
		this.culturalCategoryTypes.add(categoryType);
		categoryType.setCulturalSiteCategory(this);
	}
	
	public void addCulturalSite(CulturalSite culturalSite) {
		if (this.culturalSites == null) {
			this.culturalSites = new HashSet<>();
		}
		this.culturalSites.add(culturalSite);
		culturalSite.setCulturalSiteCategory(this);
	}
}
