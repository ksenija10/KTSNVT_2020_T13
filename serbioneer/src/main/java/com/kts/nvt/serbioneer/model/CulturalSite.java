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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor

@Entity
@Table(name = "cultural_site")
public class CulturalSite {

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
	@Column(name = "lat", nullable = false, unique = false)
	private double lat;

	@Getter
	@Setter
	@Column(name = "lng", nullable = false, unique = false)
	private double lng;

	@Getter
	@Setter
	@NonNull
	@Column(name = "address", nullable = false, unique = false)
	private String address;

	@Getter
	@Setter
	@NonNull
	@Column(name = "city", nullable = false, unique = false)
	private String city;

	@Getter
	@Setter
	@Column(name = "description", nullable = true, unique = false)
	private String description;

	@Getter
	@Setter
	@Column(name = "rating", nullable = true, unique = false)
	private double rating;

	@Getter
	@Setter
	@NonNull
	@ManyToOne
	@JoinColumn(name = "type_id", referencedColumnName = "id", nullable = true)
	private CulturalCategoryType culturalCategoryType;

	@Getter
	@Setter
	@NonNull
	@ManyToOne
	@JoinColumn(name = "category_id", referencedColumnName = "id", nullable = true)
	private CulturalSiteCategory culturalSiteCategory;

	@Getter
	@Setter
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "culturalSite")
	private Set<News> news;

	@Getter
	@Setter
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "culturalSite")
	private Set<Image> images;

	@Getter
	@Setter
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "culturalSite")
	private Set<Rating> ratings;

	@Getter
	@Setter
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "culturalSite")
	private Set<Comment> comments;

	@Getter
	@Setter
	@ManyToMany
	@JoinTable(
			name = "sites_users", 
			joinColumns = { @JoinColumn(name = "site_id", referencedColumnName = "id") }, 
			inverseJoinColumns = { @JoinColumn(name = "user_id", referencedColumnName = "id") }
			)
	private Set<AuthenticatedUser> subscribedUsers;

	
	public CulturalSite(@NonNull String name, double lat, double lng, @NonNull String address, @NonNull String city,
			String description) {
		this.name = name;
		this.lat = lat;
		this.lng = lng;
		this.address = address;
		this.city = city;
		this.description = description;
	}
	
}
