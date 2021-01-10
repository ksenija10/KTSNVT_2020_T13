package com.kts.nvt.serbioneer.repository;

import static com.kts.nvt.serbioneer.constants.CulturalSiteConstants.*;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.model.CulturalSite;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalSiteRepositoryIntegrationTest {

	@Autowired
	private CulturalSiteRepository culturalSiteRepository;
	/*
	@Test
	public void testFindAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCase() {
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> filteredSitesPageable = culturalSiteRepository.findAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCase(
				pageable, DB_FILTER_CATEGORY_NAME, DB_FILTER_TYPE_NAME, DB_FILTER_SITE_NAME, DB_FILTER_CITY_NAME);
		
		assertEquals(DB_FILTER_NUM, filteredSitesPageable.getContent().size());
	}

	@Test
	public void testFindAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCaseEmpty() {
		String categoryName = ""; // -> Manifestacija, Institucija
		String typeName = ""; // -> Biblioteka, Festival, Sajam
		String name = ""; // -> Beogradski sajam knjiga, Beogradski sajam automobila
		String city = ""; // -> Beograd
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> filteredSitesPageable = culturalSiteRepository.findAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCase(
				pageable, categoryName, typeName, name, city);
		
		assertEquals(5, filteredSitesPageable.getContent().size());
	}
	*/
	@Test
	public void testFindAllBySubscribedUsersIdPageableLong() {
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> subscribedSitesPageable = culturalSiteRepository.findAllBySubscribedUsersId(pageable, SUBSCRIBED_USER_ID);
	
		assertEquals(PAGEABLE_TOTAL_ELEMENTS, subscribedSitesPageable.getContent().size());
	}

	@Test
	public void testFindAllBySubscribedUsersIdLong() {
		List<CulturalSite> subscribedSites = culturalSiteRepository.findAllBySubscribedUsersId(SUBSCRIBED_USER_ID);
		
		assertEquals(USER_SUBSCRIBED_NUM, subscribedSites.size());
	}

}
