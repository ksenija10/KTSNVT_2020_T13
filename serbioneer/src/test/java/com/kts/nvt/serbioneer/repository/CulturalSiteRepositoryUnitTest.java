package com.kts.nvt.serbioneer.repository;

import static com.kts.nvt.serbioneer.constants.CulturalSiteConstants.PAGEABLE_PAGE;
import static com.kts.nvt.serbioneer.constants.CulturalSiteConstants.PAGEABLE_SIZE;
import static com.kts.nvt.serbioneer.constants.CulturalSiteConstants.PAGEABLE_TOTAL_ELEMENTS;
import static com.kts.nvt.serbioneer.constants.CulturalSiteConstants.SUBSCRIBED_USER_ID;
import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Set;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.model.AuthenticatedUser;
import com.kts.nvt.serbioneer.model.CulturalSite;

@RunWith(SpringRunner.class)
@DataJpaTest
@TestPropertySource("classpath:test.properties")
public class CulturalSiteRepositoryUnitTest {

	@Autowired
	private TestEntityManager entityManager;
	
	@Autowired
	private CulturalSiteRepository culturalSiteRepository;
	
	private static int userSubscribedSitesSizeDB;
	
	@Before
	public void setUp() {
		AuthenticatedUser user = entityManager.find(AuthenticatedUser.class, SUBSCRIBED_USER_ID);
		Set<CulturalSite> subscribedSites = user.getSubscribedSites();
		userSubscribedSitesSizeDB = subscribedSites.size();
	}
	
	@Test
	public void testFindAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCase() {
		String categoryName = "cija"; // -> Manifestacija, Institucija
		String typeName = "a"; // -> Biblioteka, Festival, Sajam
		String name = "sajam"; // -> Beogradski sajam knjiga, Beogradski sajam automobila
		String city = "grad"; // -> Beograd
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> filteredSitesPageable = culturalSiteRepository.findAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCase(pageable, categoryName, typeName, name, city);
		
		assertEquals(2, filteredSitesPageable.getContent().size());
	}
	
	@Test
	public void testFindAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCaseEmpty() {
		String categoryName = ""; // -> Manifestacija, Institucija
		String typeName = ""; // -> Biblioteka, Festival, Sajam
		String name = ""; // -> Beogradski sajam knjiga, Beogradski sajam automobila
		String city = ""; // -> Beograd
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> filteredSitesPageable = culturalSiteRepository.findAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCase(pageable, categoryName, typeName, name, city);
		
		assertEquals(5, filteredSitesPageable.getContent().size());

	}
	
	@Test
	public void testFindAllBySubscribedUsersIdPageableLong() {
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> subscribedSitesPageable = culturalSiteRepository.findAllBySubscribedUsersId(pageable, SUBSCRIBED_USER_ID);
	
		assertEquals(PAGEABLE_TOTAL_ELEMENTS, subscribedSitesPageable.getContent().size());
	}

	@Test
	public void testFindAllBySubscribedUsersIdLong() {
		List<CulturalSite> subscribedSites = culturalSiteRepository.findAllBySubscribedUsersId(SUBSCRIBED_USER_ID);
		
		assertEquals(userSubscribedSitesSizeDB, subscribedSites.size());
	}

}
