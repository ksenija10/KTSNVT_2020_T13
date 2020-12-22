package com.kts.nvt.serbioneer.service;

import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.CATEGORY_ID;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.NEW_CATEGORY_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.PAGEABLE_PAGE;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.PAGEABLE_SIZE;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.PAGEABLE_TOTAL_ELEMENTS;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.SAVED_CATEGORY;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.SAVED_CATEGORY_ID;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.TOTAL_ELEMENTS;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.*;
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
		given(culturalSiteCategoryRepository.findAll(pageable)).willReturn(culturalSiteCategoryPage);
	
		// for existing id
		given(culturalSiteCategoryRepository.findById(CATEGORY_ID)).willReturn(Optional.of(category));
		// for non existing id
		given(culturalSiteCategoryRepository.findById(INVALID_ID)).willReturn(Optional.empty());
	
		given(culturalSiteCategoryRepository.findOneByName(NEW_CATEGORY_NAME)).willReturn(category);
		given(culturalSiteCategoryRepository.findOneByName(UNIQUE_CATEGORY_NAME)).willReturn(null);
		
		// create
		CulturalSiteCategory newCategory = UNIQUE_CATEGORY;
		CulturalSiteCategory savedCategory = SAVED_CATEGORY;
		savedCategory.setId(SAVED_CATEGORY_ID);
		given(culturalSiteCategoryRepository.save(newCategory)).willReturn(savedCategory);
		
		given(culturalSiteCategoryRepository.findById(SAVED_CATEGORY_ID)).willReturn(Optional.of(savedCategory));
		
		// delete
		CulturalSiteCategory categoryWithTypes = CATEGORY_WITH_TYPES;
		CulturalSite culturalSite = new CulturalSite();
		categoryWithTypes.addCulturalSite(culturalSite);
		given(culturalSiteCategoryRepository.findById(CATEGORY_WITH_TYPES_ID)).willReturn(Optional.of(categoryWithTypes));
		
		doNothing().when(culturalSiteCategoryRepository).delete(SAVED_CATEGORY);
		
		// update
		// name and id do not match -> name not unique -> invalid update
		given(culturalSiteCategoryRepository.findOneByNameAndIdNot(NEW_CATEGORY_NAME, SAVED_CATEGORY_ID)).willReturn(category);
		// name is unique -> valid update
		given(culturalSiteCategoryRepository.findOneByNameAndIdNot(UPDATED_CATEGORY_NAME, SAVED_CATEGORY_ID)).willReturn(null);
		// name is unchanged -> valid update
		given(culturalSiteCategoryRepository.findOneByNameAndIdNot(UNIQUE_CATEGORY_NAME, SAVED_CATEGORY_ID)).willReturn(null);
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
	
		verify(culturalSiteCategoryRepository, times(1)).findAll(pageable);
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
		culturalSiteCategoryService.delete(SAVED_CATEGORY_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(SAVED_CATEGORY_ID);
		verify(culturalSiteCategoryRepository, times(1)).delete(SAVED_CATEGORY);
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testDeleteNotExistingId() throws Exception {
		culturalSiteCategoryService.delete(INVALID_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(INVALID_ID);
		verify(culturalSiteCategoryRepository, times(0)).delete(SAVED_CATEGORY);
	}
	
	@Test(expected = ForeignKeyException.class)
	public void testDeleteWithCategoryTypes() throws Exception {
		culturalSiteCategoryService.delete(CATEGORY_WITH_TYPES_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(CATEGORY_WITH_TYPES_ID);
		verify(culturalSiteCategoryRepository, times(0)).delete(SAVED_CATEGORY);
	}

	@Test
	public void testUpdateSuccessful() throws Exception {
		culturalSiteCategoryService.update(UPDATED_CATEGORY_VALID, SAVED_CATEGORY_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(SAVED_CATEGORY_ID);
		verify(culturalSiteCategoryRepository, times(1)).findOneByNameAndIdNot(UPDATED_CATEGORY_NAME, SAVED_CATEGORY_ID);
		verify(culturalSiteCategoryRepository, times(1)).save(SAVED_CATEGORY);
	}
	
	@Test
	public void testUpdateSuccessfulUnchangedName() throws Exception {
		culturalSiteCategoryService.update(UNIQUE_CATEGORY, SAVED_CATEGORY_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(SAVED_CATEGORY_ID);
		verify(culturalSiteCategoryRepository, times(1)).findOneByNameAndIdNot(UNIQUE_CATEGORY_NAME, SAVED_CATEGORY_ID);
		verify(culturalSiteCategoryRepository, times(1)).save(SAVED_CATEGORY);
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testUpdateNotExistingId() throws Exception {
		culturalSiteCategoryService.update(UPDATED_CATEGORY_VALID, INVALID_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(INVALID_ID);
		verify(culturalSiteCategoryRepository, times(0)).findOneByNameAndIdNot(UPDATED_CATEGORY_NAME, INVALID_ID);
		verify(culturalSiteCategoryRepository, times(0)).save(UPDATED_CATEGORY_VALID);
	}
	
	@Test(expected = ExistentFieldValueException.class)
	public void testUpdateWithExistingCategoryName() throws Exception {
		culturalSiteCategoryService.update(UPDATED_CATEGORY_INVALID, SAVED_CATEGORY_ID);
		
		verify(culturalSiteCategoryRepository, times(1)).findById(SAVED_CATEGORY_ID);
		verify(culturalSiteCategoryRepository, times(1)).findOneByNameAndIdNot(NEW_CATEGORY_NAME, SAVED_CATEGORY_ID);
		verify(culturalSiteCategoryRepository, times(0)).save(UPDATED_CATEGORY_INVALID);
	}

}
