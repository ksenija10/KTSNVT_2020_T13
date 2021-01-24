package com.kts.nvt.serbioneer.service;

import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.CATEGORY_ID;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.CATEGORY_WITH_SITES;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.CATEGORY_WITH_SITES_ID;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.EXISTING_CATEGORY;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.INVALID_ID;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.NEW_CATEGORY_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.PAGEABLE_PAGE;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.PAGEABLE_SIZE;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.PAGEABLE_TOTAL_ELEMENTS;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.SAVED_CATEGORY_1;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.SAVED_CATEGORY_2;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.SAVED_CATEGORY_ID_1;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.SAVED_CATEGORY_ID_2;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.TOTAL_ELEMENTS;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.UNIQUE_CATEGORY;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.UNIQUE_CATEGORY_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.UPDATED_CATEGORY_INVALID;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.UPDATED_CATEGORY_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.UPDATED_CATEGORY_SAME_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.UPDATED_CATEGORY_VALID;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
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

import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.ForeignKeyException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import com.kts.nvt.serbioneer.repository.CulturalSiteCategoryRepository;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment=SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalSiteCategoryServiceUnitTest {

	@Autowired
	private CulturalSiteCategoryService culturalSiteCategoryService;
	
	@MockBean
	private CulturalSiteCategoryRepository culturalSiteCategoryRepository;
	
	@Before
	public void setUp() {
		CulturalSiteCategory category = new CulturalSiteCategory(NEW_CATEGORY_NAME);
		category.setId(CATEGORY_ID);
		
		List<CulturalSiteCategory> culturalSiteCategories = new ArrayList<>();
		culturalSiteCategories.add(category);
		
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSiteCategory> culturalSiteCategoryPage = new PageImpl<>(culturalSiteCategories, pageable, PAGEABLE_TOTAL_ELEMENTS);
	
		given(culturalSiteCategoryRepository.findAll()).willReturn(culturalSiteCategories);
		given(culturalSiteCategoryRepository.findAllByOrderByIdAsc(pageable)).willReturn(culturalSiteCategoryPage);
	
		// for existing id
		given(culturalSiteCategoryRepository.findById(CATEGORY_ID)).willReturn(Optional.of(category));
		// for non existing id
		given(culturalSiteCategoryRepository.findById(INVALID_ID)).willReturn(Optional.empty());
	
		given(culturalSiteCategoryRepository.findOneByName(NEW_CATEGORY_NAME)).willReturn(category);
		given(culturalSiteCategoryRepository.findOneByName(UNIQUE_CATEGORY_NAME)).willReturn(null);
		
		// create
		CulturalSiteCategory newCategory = UNIQUE_CATEGORY;
		CulturalSiteCategory savedCategory = SAVED_CATEGORY_1;
		savedCategory.setId(SAVED_CATEGORY_ID_1);
		given(culturalSiteCategoryRepository.save(newCategory)).willReturn(savedCategory);
		
		given(culturalSiteCategoryRepository.findById(SAVED_CATEGORY_ID_1)).willReturn(Optional.of(savedCategory));
		
		// delete
		CulturalSiteCategory categoryWithSites = CATEGORY_WITH_SITES;
		CulturalSite culturalSite = new CulturalSite();
		categoryWithSites.addCulturalSite(culturalSite);
		given(culturalSiteCategoryRepository.findById(CATEGORY_WITH_SITES_ID)).willReturn(Optional.of(categoryWithSites));
		
		doNothing().when(culturalSiteCategoryRepository).delete(SAVED_CATEGORY_1);
		
		// update
		given(culturalSiteCategoryRepository.findById(SAVED_CATEGORY_ID_2)).willReturn(Optional.of(SAVED_CATEGORY_2));
		// name and id do not match -> name not unique -> invalid update
		given(culturalSiteCategoryRepository.findOneByNameAndIdNot(NEW_CATEGORY_NAME, SAVED_CATEGORY_ID_1)).willReturn(category);
		// name is unique -> valid update
		given(culturalSiteCategoryRepository.findOneByNameAndIdNot(UPDATED_CATEGORY_NAME, SAVED_CATEGORY_ID_1)).willReturn(null);
		// name is unchanged -> valid update
		given(culturalSiteCategoryRepository.findOneByNameAndIdNot(UNIQUE_CATEGORY_NAME, SAVED_CATEGORY_ID_1)).willReturn(null);
		// save updated category
		SAVED_CATEGORY_2.setId(SAVED_CATEGORY_ID_2);
		UPDATED_CATEGORY_VALID.setId(SAVED_CATEGORY_ID_1);
		UPDATED_CATEGORY_SAME_NAME.setId(SAVED_CATEGORY_ID_2);
		given(culturalSiteCategoryRepository.save(SAVED_CATEGORY_1)).willReturn(UPDATED_CATEGORY_VALID);
		given(culturalSiteCategoryRepository.save(SAVED_CATEGORY_2)).willReturn(UPDATED_CATEGORY_SAME_NAME);
	}
	
	@Test
	public void testFindAll() {
		List<CulturalSiteCategory> allCategories = culturalSiteCategoryService.findAll();
		
		// check how many calls to findAll method from repository class have there been
		verify(culturalSiteCategoryRepository, times(1)).findAll();
		assertEquals(TOTAL_ELEMENTS, allCategories.size());
	}
    
	@Test
	public void testFindAllPageable() {
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalSiteCategory> categoriesPage = culturalSiteCategoryService.findAll(pageable);
	
		verify(culturalSiteCategoryRepository, times(1)).findAllByOrderByIdAsc(pageable);
		assertEquals(PAGEABLE_TOTAL_ELEMENTS, categoriesPage.getNumberOfElements());
	}
	
	@Test
	public void testFindOneByIdExistingId() {
		CulturalSiteCategory category = culturalSiteCategoryService.findOneById(CATEGORY_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(CATEGORY_ID);
		assertEquals(CATEGORY_ID, category.getId());
	}
	
	@Test
	public void testFindOneByIdNotExistingId() {
		CulturalSiteCategory category = culturalSiteCategoryService.findOneById(INVALID_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(INVALID_ID);
		assertNull(category);
	}

	@Test
	public void testCreateWithUniqueCategoryName() throws Exception {
		CulturalSiteCategory savedCategory = culturalSiteCategoryService.create(UNIQUE_CATEGORY);
		
		verify(culturalSiteCategoryRepository, times(1)).findOneByName(UNIQUE_CATEGORY_NAME);
		verify(culturalSiteCategoryRepository, times(1)).save(UNIQUE_CATEGORY);
		assertEquals(UNIQUE_CATEGORY_NAME, savedCategory.getName());
		assertNotNull(savedCategory.getId());
	}
	
	@Test(expected = ExistentFieldValueException.class)
	public void testCreateWithExistingCategoryName() throws Exception {
		CulturalSiteCategory savedCategory = culturalSiteCategoryService.create(EXISTING_CATEGORY);
		
		verify(culturalSiteCategoryRepository, times(1)).findOneByName(NEW_CATEGORY_NAME);
		verify(culturalSiteCategoryRepository, times(0)).save(EXISTING_CATEGORY);
		assertNull(savedCategory);
	}

	@Test
	public void testDeleteSuccessful() throws Exception {
		culturalSiteCategoryService.delete(SAVED_CATEGORY_ID_1);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(SAVED_CATEGORY_ID_1);
		verify(culturalSiteCategoryRepository, times(1)).delete(SAVED_CATEGORY_1);
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testDeleteNotExistingId() throws Exception {
		culturalSiteCategoryService.delete(INVALID_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(INVALID_ID);
		verify(culturalSiteCategoryRepository, times(0)).delete(SAVED_CATEGORY_1);
	}
	
	@Test(expected = ForeignKeyException.class)
	public void testDeleteCategoryWithCulturalSites() throws Exception {
		culturalSiteCategoryService.delete(CATEGORY_WITH_SITES_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(CATEGORY_WITH_SITES_ID);
		verify(culturalSiteCategoryRepository, times(0)).delete(SAVED_CATEGORY_1);
	}

	@Test
	public void testUpdateSuccessful() throws Exception {
		CulturalSiteCategory updatedCategory = culturalSiteCategoryService.update(UPDATED_CATEGORY_VALID, SAVED_CATEGORY_ID_1);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(SAVED_CATEGORY_ID_1);
		verify(culturalSiteCategoryRepository, times(1)).findOneByNameAndIdNot(UPDATED_CATEGORY_NAME, SAVED_CATEGORY_ID_1);
		verify(culturalSiteCategoryRepository, times(1)).save(SAVED_CATEGORY_1);
		assertEquals(UPDATED_CATEGORY_NAME, updatedCategory.getName());
	}
	
	@Test
	public void testUpdateSuccessfulUnchangedName() throws Exception {
		CulturalSiteCategory updatedCategory = culturalSiteCategoryService.update(UPDATED_CATEGORY_SAME_NAME, SAVED_CATEGORY_ID_2);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(SAVED_CATEGORY_ID_2);
		verify(culturalSiteCategoryRepository, times(1)).findOneByNameAndIdNot(UNIQUE_CATEGORY_NAME, SAVED_CATEGORY_ID_2);
		verify(culturalSiteCategoryRepository, times(1)).save(SAVED_CATEGORY_2);
		assertEquals(UNIQUE_CATEGORY_NAME, updatedCategory.getName());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testUpdateNotExistingId() throws Exception {
		CulturalSiteCategory updatedCategory = culturalSiteCategoryService.update(UPDATED_CATEGORY_VALID, INVALID_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(INVALID_ID);
		verify(culturalSiteCategoryRepository, times(0)).findOneByNameAndIdNot(UPDATED_CATEGORY_NAME, INVALID_ID);
		verify(culturalSiteCategoryRepository, times(0)).save(UPDATED_CATEGORY_VALID);
		assertNull(updatedCategory);
	}
	
	@Test(expected = ExistentFieldValueException.class)
	public void testUpdateWithExistingCategoryName() throws Exception {
		CulturalSiteCategory updatedCategory = culturalSiteCategoryService.update(UPDATED_CATEGORY_INVALID, SAVED_CATEGORY_ID_1);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(SAVED_CATEGORY_ID_1);
		verify(culturalSiteCategoryRepository, times(1)).findOneByNameAndIdNot(NEW_CATEGORY_NAME, SAVED_CATEGORY_ID_1);
		verify(culturalSiteCategoryRepository, times(0)).save(UPDATED_CATEGORY_INVALID);
		assertNull(updatedCategory);
	}

}
