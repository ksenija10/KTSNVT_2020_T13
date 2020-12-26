package com.kts.nvt.serbioneer.repository;

import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.*;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.DB_CATEGORY_ID;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

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

import com.kts.nvt.serbioneer.model.CulturalCategoryType;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalCategoryTypeRepositoryIntegrationTest {

	@Autowired
	private CulturalCategoryTypeRepository culturalCategoryTypeRepository;
	
	@Test
	public void testFindAllByCulturalSiteCategoryId() {
		List<CulturalCategoryType> allCategorysTypes = culturalCategoryTypeRepository.findAllByCulturalSiteCategoryId(DB_CATEGORY_ID);
		
		assertEquals(DB_CATEGORY_ID_TYPE_NUM, allCategorysTypes.size());
	}
	
	@Test
	public void testFindAllByCulturalSiteCategoryIdInvalid() {
		List<CulturalCategoryType> allCategorysTypes = culturalCategoryTypeRepository.findAllByCulturalSiteCategoryId(INVALID_ID);
		
		assertTrue(allCategorysTypes.isEmpty());
	}
	
	@Test
	public void testFindAllByCulturalSiteCategoryIdPageable() {
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalCategoryType> allCategoriesPage = culturalCategoryTypeRepository.findAllByCulturalSiteCategoryId(DB_CATEGORY_ID, pageable);
	
		assertEquals(PAGEABLE_TOTAL_ELEMENTS, allCategoriesPage.getContent().size());
	}

	@Test
	public void testFindOneByName() {
		CulturalCategoryType categoryType = culturalCategoryTypeRepository.findOneByName(DB_NAME);
		
		assertEquals(DB_NAME, categoryType.getName());
	}

	@Test
	public void testFindOneByNameAndIdNotShouldReturnNull() {
		// should return null (id corresponding with category type name)
		// -> there is no other entity with given name
		// (the name is unique - entity in question excluded)
		CulturalCategoryType categoryType = culturalCategoryTypeRepository.findOneByNameAndIdNot(DB_NAME, DB_ID);
	
		assertNull(categoryType);
	}
	
	@Test
	public void testFindOneByNameAndIdNotShouldReturnEntity() {
		// should return entity (id NOT corresponding with category type name)
		// -> there is another entity with given name
		// (the name is NOT unique)
		CulturalCategoryType categoryType = culturalCategoryTypeRepository.findOneByNameAndIdNot(DB_EXISTING_NAME, DB_ID);
	
		assertNotNull(categoryType);
		assertEquals(DB_EXISTING_NAME, categoryType.getName());
		assertEquals(DB_EXISTING_ID, categoryType.getId());
		assertNotEquals(DB_ID, categoryType.getId());
	}

	@Test
	public void testFindOneByIdAndCulturalSiteCategoryIdShouldReturnNull() {
		CulturalCategoryType categoryType = culturalCategoryTypeRepository.findOneByIdAndCulturalSiteCategoryId(DB_ID, DB_CATEGORY_ID_2);
	
		assertNull(categoryType);
	}
	
	@Test
	public void testFindOneByIdAndCulturalSiteCategoryIdShouldReturnEntity() {
		CulturalCategoryType categoryType = culturalCategoryTypeRepository.findOneByIdAndCulturalSiteCategoryId(DB_ID, DB_CATEGORY_ID);
		
		assertNotNull(categoryType);
		assertEquals(DB_ID, categoryType.getId());
		assertEquals(DB_CATEGORY_ID, categoryType.getCulturalSiteCategory().getId());
	}

}
