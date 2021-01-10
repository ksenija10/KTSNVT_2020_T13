package com.kts.nvt.serbioneer.service;

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
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.transaction.annotation.Transactional;

import com.kts.nvt.serbioneer.dto.CulturalSiteFilterDTO;
import com.kts.nvt.serbioneer.helper.exception.IncompatibleCategoryAndTypeException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.Rating;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalSiteServiceIntegrationTest {

	@Autowired
	private CulturalSiteService culturalSiteService;
	
	@Test
	public void testFindAll() {
		List<CulturalSite> allSites = culturalSiteService.findAll();
		
		assertEquals(DB_TOTAL_SITES_NUM, allSites.size());
	}

	@Test
	public void testFindAllPageable() {
		Pageable pageable = PageRequest.of(DB_PAGEABLE_PAGE, DB_PAGEABLE_SIZE);
		Page<CulturalSite> allSitesPage = culturalSiteService.findAll(pageable);
	
		assertEquals(DB_PAGEABLE_NUM, allSitesPage.getContent().size());
	}

	@Test
	public void testFindOneById() {
		CulturalSite site = culturalSiteService.findOneById(DB_ID);

		assertNotNull(site);
		assertEquals(DB_ID, site.getId());
		assertEquals(DB_NAME, site.getName());
		assertEquals(DB_CATEGORY_ID, site.getCulturalSiteCategory().getId());
		assertEquals(DB_TYPE_ID, site.getCulturalCategoryType().getId());
		// only able to get active elements
		assertEquals(true, site.getActive());
	}
	
	@Test
	public void testFindOneByIdInvalidId() {
		CulturalSite site = culturalSiteService.findOneById(INVALID_ID);

		assertNull(site);
	}

	@Test
	@Transactional
	@Rollback(true)
	public void testDeleteSuccessful() throws Exception {
		int dbSizeBeforeDelete = culturalSiteService.findAll().size();
		
		culturalSiteService.delete(DB_ID);
		
		List<CulturalSite> allSites = culturalSiteService.findAll();
		assertEquals(dbSizeBeforeDelete - 1, allSites.size());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testDeleteInvalidId() throws Exception {
		int dbSizeBeforeDelete = culturalSiteService.findAll().size();
		
		culturalSiteService.delete(INVALID_ID);
		
		List<CulturalSite> allSites = culturalSiteService.findAll();
		assertEquals(dbSizeBeforeDelete, allSites.size());
	}

	@Test
	@Transactional
	@Rollback(true)
	public void testCreateSuccessful() throws Exception {
		CulturalSite newSite = new CulturalSite();
		newSite.setName(NEW_CULTURAL_SITE_NAME);
		newSite.setLat(NEW_CULTURAL_SITE_LAT);
		newSite.setLng(NEW_CULTURAL_SITE_LNG);
		newSite.setAddress(NEW_CULTURAL_SITE_ADDRESS);
		newSite.setCity(NEW_CULTURAL_SITE_CITY);
		newSite.setDescription(NEW_CULTURAL_SITE_DESC);
		
		int dbSizeBeforeAdd = culturalSiteService.findAll().size();
		
		CulturalSite savedSite = culturalSiteService.create(newSite, DB_CATEGORY_ID, DB_TYPE_ID);

		assertNotNull(savedSite);
		List<CulturalSite> allSites = culturalSiteService.findAll();
		assertEquals(dbSizeBeforeAdd + 1, allSites.size());
		// get last cultural site
		savedSite = allSites.get(allSites.size() - 1);
		// validate data
		assertEquals(NEW_CULTURAL_SITE_NAME, savedSite.getName());
		assertTrue(NEW_CULTURAL_SITE_LAT == savedSite.getLat());
		assertTrue(NEW_CULTURAL_SITE_LNG == savedSite.getLng());
		assertEquals(NEW_CULTURAL_SITE_ADDRESS, savedSite.getAddress());
		assertEquals(NEW_CULTURAL_SITE_CITY, savedSite.getCity());
		assertEquals(NEW_CULTURAL_SITE_DESC, savedSite.getDescription());
		assertEquals(DB_CATEGORY_ID, savedSite.getCulturalSiteCategory().getId());
		assertEquals(DB_TYPE_ID, savedSite.getCulturalCategoryType().getId());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testCreateNotExistingCategoryId() throws Exception {
		CulturalSite newSite = new CulturalSite();
		newSite.setName(NEW_CULTURAL_SITE_NAME);
		newSite.setLat(NEW_CULTURAL_SITE_LAT);
		newSite.setLng(NEW_CULTURAL_SITE_LNG);
		newSite.setAddress(NEW_CULTURAL_SITE_ADDRESS);
		newSite.setCity(NEW_CULTURAL_SITE_CITY);
		newSite.setDescription(NEW_CULTURAL_SITE_DESC);
		
		int dbSizeBeforeAdd = culturalSiteService.findAll().size();
		
		CulturalSite savedSite = culturalSiteService.create(newSite, INVALID_ID, DB_TYPE_ID);

		assertNull(savedSite);
		List<CulturalSite> allSites = culturalSiteService.findAll();
		assertEquals(dbSizeBeforeAdd, allSites.size());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testCreateNotExistingTypeId() throws Exception {
		CulturalSite newSite = new CulturalSite();
		newSite.setName(NEW_CULTURAL_SITE_NAME);
		newSite.setLat(NEW_CULTURAL_SITE_LAT);
		newSite.setLng(NEW_CULTURAL_SITE_LNG);
		newSite.setAddress(NEW_CULTURAL_SITE_ADDRESS);
		newSite.setCity(NEW_CULTURAL_SITE_CITY);
		newSite.setDescription(NEW_CULTURAL_SITE_DESC);
		
		int dbSizeBeforeAdd = culturalSiteService.findAll().size();
		
		CulturalSite savedSite = culturalSiteService.create(newSite, DB_CATEGORY_ID, INVALID_ID);

		assertNull(savedSite);
		List<CulturalSite> allSites = culturalSiteService.findAll();
		assertEquals(dbSizeBeforeAdd, allSites.size());
	}
	
	@Test(expected = IncompatibleCategoryAndTypeException.class)
	public void testCreateInvalidCategoryIdAndTypeIdCombination() throws Exception {
		CulturalSite newSite = new CulturalSite();
		newSite.setName(NEW_CULTURAL_SITE_NAME);
		newSite.setLat(NEW_CULTURAL_SITE_LAT);
		newSite.setLng(NEW_CULTURAL_SITE_LNG);
		newSite.setAddress(NEW_CULTURAL_SITE_ADDRESS);
		newSite.setCity(NEW_CULTURAL_SITE_CITY);
		newSite.setDescription(NEW_CULTURAL_SITE_DESC);
		
		int dbSizeBeforeAdd = culturalSiteService.findAll().size();
		
		CulturalSite savedSite = culturalSiteService.create(newSite, DB_CATEGORY_ID, DB_INCOMPATIBLE_TYPE_ID);

		assertNull(savedSite);
		List<CulturalSite> allSites = culturalSiteService.findAll();
		assertEquals(dbSizeBeforeAdd, allSites.size());
	}

	@Test
	@Transactional
	@Rollback(true)
	public void testUpdateSuccessful() throws Exception {
		CulturalSite dbSite = culturalSiteService.findOneById(DB_ID);
		dbSite.setName(UPDATE_CULTURAL_SITE_NAME);
		dbSite.setLat(UPDATE_CULTURAL_SITE_LAT);
		dbSite.setLng(UPDATE_CULTURAL_SITE_LNG);
		dbSite.setAddress(UPDATE_CULTURAL_SITE_ADDRESS);
		dbSite.setCity(UPDATE_CULTURAL_SITE_CITY);
		dbSite.setDescription(UPDATE_CULTURAL_SITE_DESC);
		
		dbSite = culturalSiteService.update(dbSite, DB_ID, UPDATE_CATEGORY_ID, UPDATE_TYPE_ID);
		
		assertNotNull(dbSite);
		// validate data
		dbSite = culturalSiteService.findOneById(DB_ID);
		assertEquals(UPDATE_CULTURAL_SITE_NAME, dbSite.getName());
		assertTrue(UPDATE_CULTURAL_SITE_LAT == dbSite.getLat());
		assertTrue(UPDATE_CULTURAL_SITE_LNG == dbSite.getLng());
		assertEquals(UPDATE_CULTURAL_SITE_ADDRESS, dbSite.getAddress());
		assertEquals(UPDATE_CULTURAL_SITE_CITY, dbSite.getCity());
		assertEquals(UPDATE_CULTURAL_SITE_DESC, dbSite.getDescription());
		assertEquals(UPDATE_CATEGORY_ID, dbSite.getCulturalSiteCategory().getId());
		assertEquals(UPDATE_TYPE_ID, dbSite.getCulturalCategoryType().getId());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testUpdateNotExistingId() throws Exception {
		CulturalSite dbSite = culturalSiteService.findOneById(DB_ID);
		dbSite.setName(UPDATE_CULTURAL_SITE_NAME);
		dbSite.setLat(UPDATE_CULTURAL_SITE_LAT);
		dbSite.setLng(UPDATE_CULTURAL_SITE_LNG);
		dbSite.setAddress(UPDATE_CULTURAL_SITE_ADDRESS);
		dbSite.setCity(UPDATE_CULTURAL_SITE_CITY);
		dbSite.setDescription(UPDATE_CULTURAL_SITE_DESC);
		
		dbSite = culturalSiteService.update(dbSite, INVALID_ID, UPDATE_CATEGORY_ID, UPDATE_TYPE_ID);
		
		assertNull(dbSite);
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testUpdateNotExistingCategoryId() throws Exception {
		CulturalSite dbSite = culturalSiteService.findOneById(DB_ID);
		dbSite.setName(UPDATE_CULTURAL_SITE_NAME);
		dbSite.setLat(UPDATE_CULTURAL_SITE_LAT);
		dbSite.setLng(UPDATE_CULTURAL_SITE_LNG);
		dbSite.setAddress(UPDATE_CULTURAL_SITE_ADDRESS);
		dbSite.setCity(UPDATE_CULTURAL_SITE_CITY);
		dbSite.setDescription(UPDATE_CULTURAL_SITE_DESC);
		
		dbSite = culturalSiteService.update(dbSite, DB_ID, INVALID_ID, UPDATE_TYPE_ID);
		
		assertNull(dbSite);
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testUpdateNotExistingTypeId() throws Exception {
		CulturalSite dbSite = culturalSiteService.findOneById(DB_ID);
		dbSite.setName(UPDATE_CULTURAL_SITE_NAME);
		dbSite.setLat(UPDATE_CULTURAL_SITE_LAT);
		dbSite.setLng(UPDATE_CULTURAL_SITE_LNG);
		dbSite.setAddress(UPDATE_CULTURAL_SITE_ADDRESS);
		dbSite.setCity(UPDATE_CULTURAL_SITE_CITY);
		dbSite.setDescription(UPDATE_CULTURAL_SITE_DESC);
		
		dbSite = culturalSiteService.update(dbSite, DB_ID, UPDATE_CATEGORY_ID, INVALID_ID);
		
		assertNull(dbSite);
	}
	
	@Test(expected = IncompatibleCategoryAndTypeException.class)
	public void testUpdateInvalidCategoryIdAndTypeIdCombination() throws Exception {
		CulturalSite dbSite = culturalSiteService.findOneById(DB_ID);
		dbSite.setName(UPDATE_CULTURAL_SITE_NAME);
		dbSite.setLat(UPDATE_CULTURAL_SITE_LAT);
		dbSite.setLng(UPDATE_CULTURAL_SITE_LNG);
		dbSite.setAddress(UPDATE_CULTURAL_SITE_ADDRESS);
		dbSite.setCity(UPDATE_CULTURAL_SITE_CITY);
		dbSite.setDescription(UPDATE_CULTURAL_SITE_DESC);
		
		dbSite = culturalSiteService.update(dbSite, DB_ID, UPDATE_CATEGORY_ID, DB_INCOMPATIBLE_TYPE_ID);
		
		assertNull(dbSite);
	}

	@Test
	@Transactional
	@Rollback(true)
	public void testUpdateRating() {
		CulturalSite site = culturalSiteService.findOneById(DB_ID);
		double oldRatingValue = site.getRating();
		
		Rating newRating = new Rating(NEW_RATING_VALUE);
		site.addRating(newRating);
		
		double newRatingValue = culturalSiteService.updateRating(site);
		
		assertNotEquals(oldRatingValue, newRatingValue);
		assertTrue((oldRatingValue + NEW_RATING_VALUE)/2 == newRatingValue);
	}
/*
	@Test
	public void testFilterCulturalSites() {
		Pageable pageable = PageRequest.of(DB_PAGEABLE_PAGE, DB_PAGEABLE_SIZE);
		CulturalSiteFilterDTO filterDto = 
				new CulturalSiteFilterDTO(
						DB_FILTER_CATEGORY_NAME, DB_FILTER_TYPE_NAME, DB_FILTER_SITE_NAME, DB_FILTER_CITY_NAME);
		
		Page<CulturalSite> filteredSitesPage = culturalSiteService.filterCulturalSites(pageable, filterDto);
		
		assertEquals(DB_FILTER_NUM, filteredSitesPage.getContent().size());
		assertTrue(filteredSitesPage.getContent().get(0).getCity().contains(DB_FILTER_CITY_NAME));
		assertTrue(filteredSitesPage.getContent().get(0).getName().contains(DB_FILTER_SITE_NAME));
	}

*/
	@Test
	public void testFindAllCities() {
		List<String> cityNames = culturalSiteService.findAllCities();
		
		assertEquals(DB_CITY_NUM, cityNames.size());
	}

	@Test
	public void testFindAllSubscribed() {
		Pageable pageable = PageRequest.of(DB_PAGEABLE_PAGE, DB_PAGEABLE_SIZE);
		Page<CulturalSite> subscribedSitesPage = culturalSiteService.findAllSubscribed(pageable, SUBSCRIBED_USER_ID);
		
		assertEquals(USER_SUBSCRIBED_NUM, subscribedSitesPage.getContent().size());
	}

}
