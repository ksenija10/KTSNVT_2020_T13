package com.kts.nvt.serbioneer.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.kts.nvt.serbioneer.model.CulturalSite;

@Repository
public interface CulturalSiteRepository extends JpaRepository<CulturalSite, Long> {

	/*Page<CulturalSite> findAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityIn
					(Pageable pageable, String cat, String type, String name, List<String> cities);*/
	
	/*Page<CulturalSite> findAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCase
					(Pageable pageable, String cat, String type, String name, String city);*/
	
	// u slucaju da prosledi kategoriju
	Page<CulturalSite> findAllByCulturalSiteCategoryNameInAndNameContainingIgnoreCaseAndCityContainingIgnoreCaseOrderByIdAsc
					(Pageable pageable, String[] categoryNames, String name, String city);
	
	// u slucaju da ne prosledi kategoriju
	Page<CulturalSite> findAllByNameContainingIgnoreCaseAndCityContainingIgnoreCaseOrderByIdAsc
					(Pageable pageable, String name, String city);
	
	// u slucaju da prosledi kategoriju
		Page<CulturalSite> findAllByCulturalSiteCategoryNameInAndNameContainingIgnoreCaseAndCityContainingIgnoreCaseAndSubscribedUsersEmailContainingOrderByIdAsc
						(Pageable pageable, String[] categoryNames, String name, String city, String userEmail);
		
	// u slucaju da ne prosledi kategoriju
	Page<CulturalSite> findAllByNameContainingIgnoreCaseAndCityContainingIgnoreCaseAndSubscribedUsersEmailContainingOrderByIdAsc
					(Pageable pageable, String name, String city, String userEmail);
	
	Page<CulturalSite> findAllByOrderByIdAsc(Pageable pageable);
	
	Page<CulturalSite> findAllBySubscribedUsersId(Pageable pageable, Long Id);
	
	List<CulturalSite> findAllBySubscribedUsersId(Long id);
	
	CulturalSite findOneByIdAndSubscribedUsersEmailContaining(Long cultualSiteId, String userEmail);
}
