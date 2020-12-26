package com.kts.nvt.serbioneer.service;

import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.*;
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

import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.ForeignKeyException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.CulturalCategoryType;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalCategoryTypeServiceIntegrationTest {

	@Autowired
	private CulturalCategoryTypeService culturalCategoryTypeService;
	
	@Test
	public void testFindAllLongSuccessful() throws Exception {
		List<CulturalCategoryType> allCategorysTypes = culturalCategoryTypeService.findAll(DB_CATEGORY_ID);
	
		assertEquals(DB_CATEGORY_ID_TYPE_NUM, allCategorysTypes.size());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testFindAllLongNotExistingId() throws Exception {
		culturalCategoryTypeService.findAll(INVALID_ID);
	}

	@Test
	public void testFindAllPageable() {
		Pageable pageable = PageRequest.of(DB_PAGEABLE_PAGE, DB_PAGEABLE_SIZE);
		Page<CulturalCategoryType> categoryTypesPage = culturalCategoryTypeService.findAll(pageable);
		
		assertEquals(DB_PAGEABLE_NUM, categoryTypesPage.getContent().size());
	}

	@Test
	public void testFindOneById() {
		CulturalCategoryType type = culturalCategoryTypeService.findOneById(DB_ID);
		
		assertNotNull(type);
		assertEquals(DB_ID, type.getId());
		assertEquals(DB_NAME, type.getName());
		// only able to get active elements
		assertEquals(true, type.getActive());
	}
	
	@Test
	public void testFindOneByInvalidId() {
		CulturalCategoryType type = culturalCategoryTypeService.findOneById(INVALID_ID);
		
		assertNull(type);
	}
	
	@Test
	@Transactional
	@Rollback(true)
	public void testCreateSuccessful() throws Exception {
		CulturalCategoryType newType = new CulturalCategoryType();
		newType.setName(NEW_CATEGORY_TYPE_NAME);
		
		int dbSizeBeforeAdd = culturalCategoryTypeService.findAll().size();
		
		CulturalCategoryType savedType = culturalCategoryTypeService.create(DB_CATEGORY_ID, newType);
	
		assertNotNull(savedType);
		List<CulturalCategoryType> allTypes = culturalCategoryTypeService.findAll();
		assertEquals(dbSizeBeforeAdd + 1, allTypes.size());
		// get last category type
		savedType = allTypes.get(allTypes.size() - 1);
		// validate data
		assertEquals(NEW_CATEGORY_TYPE_NAME, savedType.getName());
		assertEquals(DB_CATEGORY_ID, savedType.getCulturalSiteCategory().getId());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testCreateInvalidCategoryId() throws Exception {
		CulturalCategoryType newType = new CulturalCategoryType();
		newType.setName(NEW_CATEGORY_TYPE_NAME);
		
		int dbSizeBeforeAdd = culturalCategoryTypeService.findAll().size();
		
		CulturalCategoryType savedType = culturalCategoryTypeService.create(INVALID_ID, newType);
	
		assertNull(savedType);
		List<CulturalCategoryType> allTypes = culturalCategoryTypeService.findAll();
		assertEquals(dbSizeBeforeAdd, allTypes.size());
	}
	
	@Test(expected = ExistentFieldValueException.class)
	public void testCreateExistingName() throws Exception {
		CulturalCategoryType newType = new CulturalCategoryType();
		newType.setName(DB_NAME);
		
		int dbSizeBeforeAdd = culturalCategoryTypeService.findAll().size();
		
		CulturalCategoryType savedType = culturalCategoryTypeService.create(DB_CATEGORY_ID, newType);
	
		assertNull(savedType);
		List<CulturalCategoryType> allTypes = culturalCategoryTypeService.findAll();
		assertEquals(dbSizeBeforeAdd, allTypes.size());
	}
	
	@Test(expected = NullPointerException.class)
	public void testCreateNoName() throws Exception {
		CulturalCategoryType newType = new CulturalCategoryType();
		newType.setName(null);
		
		int dbSizeBeforeAdd = culturalCategoryTypeService.findAll().size();
		
		CulturalCategoryType savedType = culturalCategoryTypeService.create(DB_CATEGORY_ID, newType);
	
		assertNull(savedType);
		List<CulturalCategoryType> allTypes = culturalCategoryTypeService.findAll();
		assertEquals(dbSizeBeforeAdd, allTypes.size());
	}

	@Test
	public void testDelete() throws Exception {
		// save new type for delete
		CulturalCategoryType newType = new CulturalCategoryType();
		newType.setName(NEW_CATEGORY_TYPE_NAME);
		
		CulturalCategoryType savedType = culturalCategoryTypeService.create(DB_CATEGORY_ID, newType);
		
		int dbSizeBeforeDelete = culturalCategoryTypeService.findAll().size();
		
		culturalCategoryTypeService.delete(savedType.getId());
		
		List<CulturalCategoryType> allTypes = culturalCategoryTypeService.findAll();
		assertEquals(dbSizeBeforeDelete - 1, allTypes.size());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testDeleteNotExistingId() throws Exception {
		int dbSizeBeforeDelete = culturalCategoryTypeService.findAll().size();
		
		culturalCategoryTypeService.delete(INVALID_ID);
		
		List<CulturalCategoryType> allTypes = culturalCategoryTypeService.findAll();
		assertEquals(dbSizeBeforeDelete, allTypes.size());
	}
	
	@Test(expected = ForeignKeyException.class)
	public void testDeleteTypeWithCulturalSites() throws Exception {
		int dbSizeBeforeDelete = culturalCategoryTypeService.findAll().size();
		
		culturalCategoryTypeService.delete(DB_ID);
		
		List<CulturalCategoryType> allTypes = culturalCategoryTypeService.findAll();
		assertEquals(dbSizeBeforeDelete, allTypes.size());
	}

	@Test
	public void testUpdateSuccessful() throws Exception {
		CulturalCategoryType dbType = culturalCategoryTypeService.findOneById(DB_ID);
		dbType.setName(UPDATED_CATEGORY_TYPE_NAME);
		
		dbType = culturalCategoryTypeService.update(dbType, DB_ID);
		
		assertNotNull(dbType);
		// validate data
		dbType = culturalCategoryTypeService.findOneById(DB_ID);
		assertEquals(UPDATED_CATEGORY_TYPE_NAME, dbType.getName());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testUpdateNotExistingId() throws Exception {
		CulturalCategoryType dbType = culturalCategoryTypeService.findOneById(DB_ID);
		dbType.setName(UPDATED_CATEGORY_TYPE_NAME);
		
		dbType = culturalCategoryTypeService.update(dbType, INVALID_ID);
		
		assertNull(dbType);
	}
	
	@Test(expected = ExistentFieldValueException.class)
	public void testUpdateExistingName() throws Exception {
		CulturalCategoryType dbType = culturalCategoryTypeService.findOneById(DB_ID);
		dbType.setName(DB_EXISTING_NAME);
		
		dbType = culturalCategoryTypeService.update(dbType, DB_ID);
		
		assertNull(dbType);
		// validate data -> UNCHANGED
		dbType = culturalCategoryTypeService.findOneById(DB_ID);
		assertEquals(DB_NAME, dbType.getName());
	}
	
	@Test(expected = NullPointerException.class)
	public void testUpdateNoName() throws Exception {
		CulturalCategoryType dbType = culturalCategoryTypeService.findOneById(DB_ID);
		dbType.setName(null);
		
		dbType = culturalCategoryTypeService.update(dbType, DB_ID);
		
		assertNull(dbType);
		// validate data -> UNCHANGED
		dbType = culturalCategoryTypeService.findOneById(DB_ID);
		assertEquals(DB_NAME, dbType.getName());
	}

	@Test
	public void testFindOneByIdAndCategoryIdShouldReturnEntity() {
		CulturalCategoryType type = culturalCategoryTypeService.findOneByIdAndCategoryId(DB_ID, DB_CATEGORY_ID);
		
		assertNotNull(type);
		assertEquals(DB_ID, type.getId());
		assertEquals(DB_CATEGORY_ID, type.getCulturalSiteCategory().getId());
	}
	
	@Test
	public void testFindOneByIdAndCategoryIdShouldReturnNull() {
		CulturalCategoryType type = culturalCategoryTypeService.findOneByIdAndCategoryId(DB_ID, DB_CATEGORY_ID_2);
		
		assertNull(type);
	}
}
