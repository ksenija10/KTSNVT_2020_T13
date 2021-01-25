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
	public void testFindAllByCulturalSiteCategoryNameInAndNameContainingIgnoreCaseAndCityContainingIgnoreCaseOrderByIdAsc() {
		String[] categoryName = {"Manifestacija"}; // -> Manifestacija, Institucija
		String name = "sajam"; // -> Beogradski sajam knjiga, Beogradski sajam automobila
		String city = "grad"; // -> Beograd
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> filteredSitesPageable = culturalSiteRepository.findAllByCulturalSiteCategoryNameInAndNameContainingIgnoreCaseAndCityContainingIgnoreCaseOrderByIdAsc(pageable, categoryName, name, city);
		
		assertEquals(2, filteredSitesPageable.getContent().size());
	}
	
	@Test
	public void testFindAllByNameContainingIgnoreCaseAndCityContainingIgnoreCaseOrderByIdAsc() {
		String name = ""; //
		String city = "abac"; //
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> filteredSitesPageable = culturalSiteRepository.findAllByNameContainingIgnoreCaseAndCityContainingIgnoreCaseOrderByIdAsc(pageable, name, city);
		
		assertEquals(3, filteredSitesPageable.getContent().size());
	}
	
	
	@Test
	public void testFindAllByCulturalSiteCategoryNameInAndNameContainingIgnoreCaseAndCityContainingIgnoreCaseAndSubscribedUsersEmailContainingOrderByIdAsc() {
		String[] categoryName = {"Manifestacija"}; // -> Manifestacija, Institucija
		String name = "a"; // -> Beogradski sajam knjiga, Beogradski sajam automobila
		String city = "a"; // -> Beograd
		String userEmail = "prvi@user.com";
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> filteredSitesPageable = culturalSiteRepository.findAllByCulturalSiteCategoryNameInAndNameContainingIgnoreCaseAndCityContainingIgnoreCaseAndSubscribedUsersEmailContainingOrderByIdAsc(pageable, categoryName, name, city, userEmail);
		
		assertEquals(1, filteredSitesPageable.getContent().size());
	}
	
	@Test
	public void testFindAllByNameContainingIgnoreCaseAndCityContainingIgnoreCaseAndSubscribedUsersEmailContainingOrderByIdAsc() {
		String name = "a"; //
		String city = "a"; //
		String userEmail = "prvi@user.com";
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> filteredSitesPageable = culturalSiteRepository.findAllByNameContainingIgnoreCaseAndCityContainingIgnoreCaseAndSubscribedUsersEmailContainingOrderByIdAsc(pageable, name, city, userEmail);
		
		assertEquals(3, filteredSitesPageable.getContent().size());
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
