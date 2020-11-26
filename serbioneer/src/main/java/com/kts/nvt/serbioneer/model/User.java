package com.kts.nvt.serbioneer.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
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
@Table(name="users")
@Inheritance(strategy= InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="type", discriminatorType= DiscriminatorType.STRING)
public abstract class User {
	
	@Getter
	@Setter
	@NonNull
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;
	
	@Getter
	@Setter
	@NonNull
	@Column(name = "name", nullable = false, unique = false)
	private String name;
	
	@Getter
	@Setter
	@NonNull
	@Column(name = "surname", nullable = false, unique = false)
	private String surname;
	
	@Getter
	@Setter
	@NonNull
	@Column(name = "email", nullable = false, unique = true)
	private String email;
	
	@Getter
	@Setter
	@NonNull
	@Column(name = "password", nullable = false, unique = false)
	private String password;
	
	@Getter
	@Setter
	@ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "user_authority",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "authority_id", referencedColumnName = "id"))
	private Set<Authority> authorities; 
	
}
