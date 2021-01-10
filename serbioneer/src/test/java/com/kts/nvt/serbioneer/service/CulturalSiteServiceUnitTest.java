package com.kts.nvt.serbioneer.service;

import static com.kts.nvt.serbioneer.constants.CulturalSiteConstants.*;
import static org.junit.Assert.*;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.dto.CulturalSiteFilterDTO;
import com.kts.nvt.serbioneer.helper.exception.IncompatibleCategoryAndTypeException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.repository.CulturalSiteRepository;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment=SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalSiteServiceUnitTest {

	@Autowired
	private CulturalSiteService culturalSiteService;
	
	@MockBean
	private CulturalSiteRepository culturalSiteRepository;
	
	@MockBean
	private CulturalSiteCategoryService culturalSiteCategoryService;
	
	@MockBean
	private CulturalCategoryTypeService culturalCategoryTypeService;
	
	@Before
	public void setUp() {
		// find all
		List<CulturalSite> allSites = new ArrayList<>();
		CULTURAL_SITE_1.setId(CULTURAL_SITE_ID_1);
		allSites.add(CULTURAL_SITE_1);
		allSites.add(CULTURAL_SITE_2);
		allSites.add(CULTURAL_SITE_3);
		given(culturalSiteRepository.findAll()).willReturn(allSites);
		
		// find all pageable
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> sitesPage = new PageImpl<>(allSites, pageable, PAGEABLE_TOTAL_ELEMENTS);
		given(culturalSiteRepository.findAll(pageable)).willReturn(sitesPage);
		
		// find by id
		given(culturalSiteRepository.findById(CULTURAL_SITE_ID_1)).willReturn(Optional.of(CULTURAL_SITE_1));
		given(culturalSiteRepository.findById(INVALID_ID)).willReturn(Optional.empty());
	
		// delete
		doNothing().when(culturalSiteRepository).delete(CULTURAL_SITE_1);

		// create
		// -> successful
		SAVED_CULTURAL_SITE.setId(SAVED_CULTURAL_SITE_ID);
		SAVED_CULTURAL_SITE.setCulturalSiteCategory(CATEGORY);
		SAVED_CULTURAL_SITE.setCulturalCategoryType(TYPE);
		given(culturalSiteCategoryService.findOneById(CATEGORY_ID)).willReturn(CATEGORY);
		given(culturalCategoryTypeService.findOneById(TYPE_ID)).willReturn(TYPE);
		given(culturalCategoryTypeService.findOneByIdAndCategoryId(TYPE_ID, CATEGORY_ID)).willReturn(TYPE);
		given(culturalSiteRepository.save(NEW_CULTURAL_SITE)).willReturn(SAVED_CULTURAL_SITE);
		// -> invalid category id
		given(culturalSiteCategoryService.findOneById(INVALID_ID)).willReturn(null);
		// -> invalid type id
		given(culturalCategoryTypeService.findOneById(INVALID_ID)).willReturn(null);
		// -> invalid category id and type id combination
		given(culturalCategoryTypeService.findOneByIdAndCategoryId(INVALID_COMBINATION_ID, CATEGORY_ID)).willReturn(null);
		given(culturalCategoryTypeService.findOneById(INVALID_COMBINATION_ID)).willReturn(TYPE);
	
		// update
		// -> successful
		UPDATED_CULTURAL_SITE_VALID.setId(SAVED_CULTURAL_SITE_ID);
		UPDATED_CULTURAL_SITE_VALID.setCulturalSiteCategory(CATEGORY);
		UPDATED_CULTURAL_SITE_VALID.setCulturalCategoryType(TYPE);
		given(culturalSiteRepository.findById(SAVED_CULTURAL_SITE_ID)).willReturn(Optional.of(SAVED_CULTURAL_SITE));
		given(culturalSiteRepository.save(SAVED_CULTURAL_SITE)).willReturn(UPDATED_CULTURAL_SITE_VALID);
	
		// update rating
		RATING_CULTURAL_SITE.addRating(RATING_1);
		RATING_CULTURAL_SITE.addRating(RATING_2);
		given(culturalSiteRepository.save(RATING_CULTURAL_SITE)).willReturn(RATING_CULTURAL_SITE);
	
		// filter
		List<CulturalSite> filteredSites = new ArrayList<>();
		filteredSites.add(CULTURAL_SITE_1);
		Page<CulturalSite> filteredSitesPage = new PageImpl<>(filteredSites, pageable, PAGEABLE_TOTAL_ELEMENTS);
		/*given(culturalSiteRepository.
				findAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCase(
						pageable, categoryName, typeName, name, city))
				.willReturn(filteredSitesPage);
		*/
		// find all subscribed
		given(culturalSiteRepository.findAllBySubscribedUsersId(pageable, SUBSCRIBED_USER_ID)).willReturn(sitesPage);
	}
	
	@Test
	public void testFindAll() {
		List<CulturalSite> culturalSites = culturalSiteService.findAll();
		
		verify(culturalSiteRepository, times(1)).findAll();
		assertEquals(TOTAL_ELEMENTS, culturalSites.size());
	}

	@Test
	public void testFindAllPageable() {
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> culturalSitesPageable = culturalSiteService.findAll(pageable);
		
		verify(culturalSiteRepository, times(1)).findAll(pageable);
		assertEquals(PAGEABLE_TOTAL_ELEMENTS, culturalSitesPageable.getContent().size());
	}

	@Test
	public void testFindOneByIdValid() {
		CulturalSite culturalSite = culturalSiteService.findOneById(CULTURAL_SITE_ID_1);
		
		verify(culturalSiteRepository, times(1)).findById(CULTURAL_SITE_ID_1);
		assertNotNull(culturalSite);
		assertEquals(CULTURAL_SITE_ID_1, culturalSite.getId());
	}
	
	@Test
	public void testFindOneByIdInvalid() {
		CulturalSite culturalSite = culturalSiteService.findOneById(INVALID_ID);
		
		verify(culturalSiteRepository, times(1)).findById(INVALID_ID);
		assertNull(culturalSite);
	}

	@Test
	public void testDeleteSuccess() throws Exception {
		culturalSiteService.delete(CULTURAL_SITE_ID_1);
		
		verify(culturalSiteRepository, times(1)).findById(CULTURAL_SITE_ID_1);
		verify(culturalSiteRepository, times(1)).delete(CULTURAL_SITE_1);
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testDeleteNotExistingId() throws Exception {
		culturalSiteService.delete(INVALID_ID);
		
		verify(culturalSiteRepository, times(1)).findById(INVALID_ID);
		verify(culturalSiteRepository, times(0)).delete(CULTURAL_SITE_1);
	}

	@Test
	public void testCreateSuccessful() throws Exception {
		CulturalSite savedCulturalSite = culturalSiteService.create(NEW_CULTURAL_SITE, CATEGORY_ID, TYPE_ID);
		
		verify(culturalSiteCategoryService, times(1)).findOneById(CATEGORY_ID);
		verify(culturalCategoryTypeService, times(1)).findOneById(TYPE_ID);
		verify(culturalCategoryTypeService, times(1)).findOneByIdAndCategoryId(TYPE_ID, CATEGORY_ID);
		verify(culturalSiteRepository, times(1)).save(NEW_CULTURAL_SITE);
		assertNotNull(savedCulturalSite);
		assertEquals(SAVED_CULTURAL_SITE_ID, savedCulturalSite.getId());
		assertEquals(NEW_CULTURAL_SITE_NAME, savedCulturalSite.getName());
		assertEquals(CATEGORY, savedCulturalSite.getCulturalSiteCategory());
		assertEquals(TYPE, savedCulturalSite.getCulturalCategoryType());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testCreateInvalidCategoryId() throws Exception {
		CulturalSite savedCulturalSite = culturalSiteService.create(NEW_CULTURAL_SITE, INVALID_ID, TYPE_ID);
		
		verify(culturalSiteCategoryService, times(1)).findOneById(INVALID_ID);
		verify(culturalCategoryTypeService, times(0)).findOneById(TYPE_ID);
		verify(culturalCategoryTypeService, times(0)).findOneByIdAndCategoryId(TYPE_ID, INVALID_ID);
		verify(culturalSiteRepository, times(0)).save(NEW_CULTURAL_SITE);
		assertNull(savedCulturalSite);
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testCreateInvalidTypeId() throws Exception {
		CulturalSite savedCulturalSite = culturalSiteService.create(NEW_CULTURAL_SITE, CATEGORY_ID, INVALID_ID);
		
		verify(culturalSiteCategoryService, times(1)).findOneById(CATEGORY_ID);
		verify(culturalCategoryTypeService, times(1)).findOneById(INVALID_ID);
		verify(culturalCategoryTypeService, times(0)).findOneByIdAndCategoryId(INVALID_ID, CATEGORY_ID);
		verify(culturalSiteRepository, times(0)).save(NEW_CULTURAL_SITE);
		assertNull(savedCulturalSite);
	}

	@Test(expected = IncompatibleCategoryAndTypeException.class)
	public void testCreateInvalidCategoryIdAndTypeIdCombination() throws Exception {
		CulturalSite savedCulturalSite = culturalSiteService.create(NEW_CULTURAL_SITE, CATEGORY_ID, INVALID_COMBINATION_ID);

		verify(culturalSiteCategoryService, times(1)).findOneById(CATEGORY_ID);
		verify(culturalCategoryTypeService, times(1)).findOneById(INVALID_COMBINATION_ID);
		verify(culturalCategoryTypeService, times(1)).findOneByIdAndCategoryId(INVALID_COMBINATION_ID, CATEGORY_ID);
		verify(culturalSiteRepository, times(0)).save(NEW_CULTURAL_SITE);
		assertNull(savedCulturalSite);
	}
	
	@Test
	public void testUpdateSuccessful() throws Exception {
		CulturalSite updatedSite = culturalSiteService.update(UPDATED_CULTURAL_SITE_VALID, SAVED_CULTURAL_SITE_ID, CATEGORY_ID, TYPE_ID);
	
		verify(culturalSiteRepository, times(1)).findById(SAVED_CULTURAL_SITE_ID);
		verify(culturalSiteCategoryService, times(1)).findOneById(CATEGORY_ID);
		verify(culturalCategoryTypeService, times(1)).findOneById(TYPE_ID);
		//verify(culturalCategoryTypeService, times(1)).findOneByIdAndCategoryId(TYPE_ID, CATEGORY_ID);
		verify(culturalSiteRepository, times(1)).save(SAVED_CULTURAL_SITE);
		assertNotNull(updatedSite);
		assertEquals(SAVED_CULTURAL_SITE_ID, updatedSite.getId());
		assertEquals(UPDATED_CULTURAL_SITE_NAME, updatedSite.getName());
		assertEquals(CATEGORY, updatedSite.getCulturalSiteCategory());
		assertEquals(TYPE, updatedSite.getCulturalCategoryType());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testUpdateInvalidCulturalSiteId() throws Exception {
		CulturalSite updatedSite = culturalSiteService.update(UPDATED_CULTURAL_SITE_VALID, INVALID_ID, CATEGORY_ID, TYPE_ID);
	
		verify(culturalSiteRepository, times(1)).findById(INVALID_ID);
		verify(culturalSiteCategoryService, times(0)).findOneById(CATEGORY_ID);
		verify(culturalCategoryTypeService, times(0)).findOneById(TYPE_ID);
		//verify(culturalCategoryTypeService, times(0)).findOneByIdAndCategoryId(TYPE_ID, CATEGORY_ID);
		verify(culturalSiteRepository, times(0)).save(SAVED_CULTURAL_SITE);
		assertNull(updatedSite);
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testUpdateInvalidCategoryId() throws Exception {
		CulturalSite updatedSite = culturalSiteService.update(UPDATED_CULTURAL_SITE_VALID, SAVED_CULTURAL_SITE_ID, INVALID_ID, TYPE_ID);
	
		verify(culturalSiteRepository, times(1)).findById(SAVED_CULTURAL_SITE_ID);
		verify(culturalSiteCategoryService, times(1)).findOneById(INVALID_ID);
		verify(culturalCategoryTypeService, times(0)).findOneById(TYPE_ID);
		//verify(culturalCategoryTypeService, times(0)).findOneByIdAndCategoryId(TYPE_ID, CATEGORY_ID);
		verify(culturalSiteRepository, times(0)).save(SAVED_CULTURAL_SITE);
		assertNull(updatedSite);
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testUpdateInvalidTypeId() throws Exception {
		CulturalSite updatedSite = culturalSiteService.update(UPDATED_CULTURAL_SITE_VALID, SAVED_CULTURAL_SITE_ID, CATEGORY_ID, INVALID_ID);
	
		verify(culturalSiteRepository, times(1)).findById(SAVED_CULTURAL_SITE_ID);
		verify(culturalSiteCategoryService, times(1)).findOneById(CATEGORY_ID);
		verify(culturalCategoryTypeService, times(1)).findOneById(INVALID_ID);
		//verify(culturalCategoryTypeService, times(0)).findOneByIdAndCategoryId(TYPE_ID, CATEGORY_ID);
		verify(culturalSiteRepository, times(0)).save(SAVED_CULTURAL_SITE);
		assertNull(updatedSite);
	}
	
	@Test(expected = IncompatibleCategoryAndTypeException.class)
	public void testUpdateInvalidCategoryIdAndTypeIdCombination() throws Exception {
		CulturalSite updatedSite = culturalSiteService.update(UPDATED_CULTURAL_SITE_VALID, SAVED_CULTURAL_SITE_ID, CATEGORY_ID, INVALID_COMBINATION_ID);
		
		verify(culturalSiteRepository, times(1)).findById(SAVED_CULTURAL_SITE_ID);
		verify(culturalSiteCategoryService, times(1)).findOneById(CATEGORY_ID);
		verify(culturalCategoryTypeService, times(1)).findOneById(INVALID_COMBINATION_ID);
		verify(culturalCategoryTypeService, times(1)).findOneByIdAndCategoryId(INVALID_COMBINATION_ID, CATEGORY_ID);
		verify(culturalSiteRepository, times(0)).save(SAVED_CULTURAL_SITE);
		assertNull(updatedSite);
	}

	@Test
	public void testUpdateRating() {
		double newRating = culturalSiteService.updateRating(RATING_CULTURAL_SITE);
		
		verify(culturalSiteRepository, times(1)).save(RATING_CULTURAL_SITE);
		assertTrue(NEW_RATING == newRating);
	}
/*
	@Test
	public void testFilterCulturalSites() {
		CulturalSiteFilterDTO filterDto = new CulturalSiteFilterDTO(categoryName, typeName, name, city);
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> filteredSitesPageable = culturalSiteService.filterCulturalSites(pageable, filterDto);
		
		verify(culturalSiteRepository, times(1)).
		findAllByCulturalSiteCategoryNameContainingIgnoreCaseAndCulturalCategoryTypeNameContainingIgnoreCaseAndNameContainingIgnoreCaseAndCityContainingIgnoreCase(
				pageable, categoryName, typeName, name, city);
		assertEquals(1, filteredSitesPageable.getContent().size());
	}
*/
	@Test
	public void testFindAllCities() {
		List<String> cityNames = culturalSiteService.findAllCities();
		
		List<String> expectedCityNames = new ArrayList<>();
		expectedCityNames.add(CULTURAL_SITE_CITY_1);
		expectedCityNames.add(CULTURAL_SITE_CITY_2);
		expectedCityNames.add(CULTURAL_SITE_CITY_3);
		
		assertEquals(expectedCityNames, cityNames);
	}

	@Test
	public void testFindAllSubscribed() {
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSite> subscribedSites = culturalSiteService.findAllSubscribed(pageable, SUBSCRIBED_USER_ID);
		
		verify(culturalSiteRepository, times(1)).findAllBySubscribedUsersId(pageable, SUBSCRIBED_USER_ID);
		assertEquals(PAGEABLE_TOTAL_ELEMENTS, subscribedSites.getContent().size());
	}

}
