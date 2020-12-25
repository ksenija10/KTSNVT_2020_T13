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

import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.Where;

import lombok.*;

@AllArgsConstructor
@RequiredArgsConstructor

@Entity
@Table(name = "news")
@SQLDelete(sql =
"UPDATE news " +
"SET is_active = false " +
"WHERE id = ?")
@Where(clause="is_active=true")
public class News {

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
	@OneToMany(cascade = {CascadeType.PERSIST, CascadeType.REMOVE}, fetch = FetchType.LAZY, mappedBy = "news")
	private Set<Image> images;

	public News() {
		this.active = true;
	}
	
	public News(@NonNull String information) {
		this.information = information;
		this.active = true;
	}

	public News(Long id, @NonNull String information) {
		this.id = id;
		this.information = information;
		this.active = true;
	}
}
