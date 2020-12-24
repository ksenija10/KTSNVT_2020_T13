package com.kts.nvt.serbioneer.service;

import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.*;
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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.ForeignKeyException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment=WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalSiteCategoryServiceIntegrationTest {

	@Autowired
	private CulturalSiteCategoryService culturalSiteCategoryService;
	
	@Test
	public void testFindAll() {
		List<CulturalSiteCategory> allCategories = culturalSiteCategoryService.findAll();
		
		assertEquals(DB_COUNT, allCategories.size());
	}

	@Test
	public void testFindAllPageable() {
		Pageable pageable = PageRequest.of(DB_PAGEABLE_PAGE, DB_PAGEABLE_SIZE);
		Page<CulturalSiteCategory> categoriesPage = culturalSiteCategoryService.findAll(pageable);
		
		assertEquals(DB_PAGEABLE_NUM, categoriesPage.getContent().size());
	}

	@Test
	public void testFindOneById() {
		CulturalSiteCategory category = culturalSiteCategoryService.findOneById(DB_ID);
	
		assertNotNull(category);
		assertEquals(DB_ID, category.getId());
		assertEquals(DB_NAME, category.getName());
		// only able to get active elements
		assertEquals(true, category.getActive());
	}

	@Test
	@Transactional
	@Rollback(true)
	public void testCreateSuccessful() throws Exception {
		CulturalSiteCategory newCategory = new CulturalSiteCategory();
		newCategory.setName(NEW_CATEGORY_NAME);
		
		int dbSizeBeforeAdd = culturalSiteCategoryService.findAll().size();
		
		CulturalSiteCategory savedCategory = culturalSiteCategoryService.create(newCategory);
		
		assertNotNull(savedCategory);
		List<CulturalSiteCategory> allCategories = culturalSiteCategoryService.findAll();
		assertEquals(dbSizeBeforeAdd + 1, allCategories.size());
		// gets last category
		savedCategory = allCategories.get(allCategories.size() - 1);
		// validate data
		assertEquals(NEW_CATEGORY_NAME, savedCategory.getName());
	}
	
	@Test(expected = ExistentFieldValueException.class)
	public void testCreateExistingName() throws Exception {
		CulturalSiteCategory newCategory = new CulturalSiteCategory();
		newCategory.setName(DB_NAME);
		
		int dbSizeBeforeAdd = culturalSiteCategoryService.findAll().size();

		CulturalSiteCategory savedCategory = culturalSiteCategoryService.create(newCategory);

		assertNull(savedCategory);
		List<CulturalSiteCategory> allCategories = culturalSiteCategoryService.findAll();
		assertEquals(dbSizeBeforeAdd, allCategories.size());
	}
	
	@Test(expected = NullPointerException.class)
	public void testCreateNoName() throws Exception {
		CulturalSiteCategory newCategory = new CulturalSiteCategory();
		newCategory.setName(null);
		
		int dbSizeBeforeAdd = culturalSiteCategoryService.findAll().size();

		CulturalSiteCategory savedCategory = culturalSiteCategoryService.create(newCategory);

		assertNull(savedCategory);
		List<CulturalSiteCategory> allCategories = culturalSiteCategoryService.findAll();
		assertEquals(dbSizeBeforeAdd, allCategories.size());
	}

	@Test
	@Transactional
	@Rollback(true)
	public void testDeleteSuccessful() throws Exception {
		// save new category for delete
		CulturalSiteCategory newCategory = new CulturalSiteCategory();
		newCategory.setName(NEW_CATEGORY_NAME);
		
		newCategory = culturalSiteCategoryService.create(newCategory);
		
		int dbSizeBeforeDelete = culturalSiteCategoryService.findAll().size();
		
		culturalSiteCategoryService.delete(newCategory.getId());
		
		List<CulturalSiteCategory> allCategories = culturalSiteCategoryService.findAll();
		assertEquals(dbSizeBeforeDelete - 1, allCategories.size());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testDeleteNotExistingId() throws Exception {
		int dbSizeBeforeDelete = culturalSiteCategoryService.findAll().size();
		
		culturalSiteCategoryService.delete(INVALID_ID);
		
		List<CulturalSiteCategory> allCategories = culturalSiteCategoryService.findAll();
		assertEquals(dbSizeBeforeDelete, allCategories.size());
	}
	
	@Test(expected = ForeignKeyException.class)
	public void testDeleteCategoryWithCulturalSites() throws Exception {
		int dbSizeBeforeDelete = culturalSiteCategoryService.findAll().size();
		
		culturalSiteCategoryService.delete(DB_ID_REFERENCED);
		
		List<CulturalSiteCategory> allCategories = culturalSiteCategoryService.findAll();
		assertEquals(dbSizeBeforeDelete, allCategories.size());
	}

	@Test
	@Transactional
	@Rollback(true)
	public void testUpdateSuccessful() throws Exception {
		CulturalSiteCategory dbCategory = culturalSiteCategoryService.findOneById(DB_ID);
		dbCategory.setName(UPDATED_CATEGORY_NAME);
		
		dbCategory = culturalSiteCategoryService.update(dbCategory, DB_ID);
		
		assertNotNull(dbCategory);
		// validate data
		dbCategory = culturalSiteCategoryService.findOneById(DB_ID);
		assertEquals(UPDATED_CATEGORY_NAME, dbCategory.getName());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testUpdateNotExistingId() throws Exception {
		CulturalSiteCategory dbCategory = culturalSiteCategoryService.findOneById(DB_ID);
		dbCategory.setName(UPDATED_CATEGORY_NAME);
		
		dbCategory = culturalSiteCategoryService.update(dbCategory, INVALID_ID);
		
		assertNull(dbCategory);
	}
	
	@Test(expected = ExistentFieldValueException.class)
	public void testUpdateExistingName() throws Exception {
		CulturalSiteCategory dbCategory = culturalSiteCategoryService.findOneById(DB_ID);
		dbCategory.setName(DB_NAME_EXISTING);
		
		dbCategory = culturalSiteCategoryService.update(dbCategory, DB_ID);
		
		assertNull(dbCategory);
	}
	
	@Test(expected = NullPointerException.class)
	public void testUpdateNoName() throws Exception {
		CulturalSiteCategory dbCategory = culturalSiteCategoryService.findOneById(DB_ID);
		dbCategory.setName(null);
		
		dbCategory = culturalSiteCategoryService.update(dbCategory, DB_ID);
		
		assertNull(dbCategory);
	}
}
