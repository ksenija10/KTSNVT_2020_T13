package com.kts.nvt.serbioneer.model;

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

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.Setter;

@AllArgsConstructor

@Entity
@Table(name = "category_type")
@SQLDelete(sql =
"UPDATE category_type " +
"SET is_active = false " +
"WHERE id = ?")
@Where(clause="is_active=true")
public class CulturalCategoryType {

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
	//@NonNull
	@ManyToOne
	@JoinColumn(name = "category_id", referencedColumnName = "id", nullable = false)
	private CulturalSiteCategory culturalSiteCategory;

	@Getter
	@Setter
	// ne zelimo da brisanjem tipa obrisemo sva kulturna dobra tog tipa
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.DETACH}, fetch = FetchType.LAZY, mappedBy = "culturalCategoryType")
	private Set<CulturalSite> culturalSites;
	
	public CulturalCategoryType() {
		this.active = true;
	}
	
	public CulturalCategoryType(@NonNull String name) {
		this.active = true;
		this.name = name;
	}

	public CulturalCategoryType(@NonNull String name, CulturalSiteCategory culturalSiteCategory) {
		this.active = true;
		this.name = name;
		this.culturalSiteCategory = culturalSiteCategory;
	}
}
