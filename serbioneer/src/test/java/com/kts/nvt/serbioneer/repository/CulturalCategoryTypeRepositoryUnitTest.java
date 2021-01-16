package com.kts.nvt.serbioneer.repository;

import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.DB_CATEGORY_TYPE_ID;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.NEW_CATEGORY_TYPE_NAME_1;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.NEW_CATEGORY_TYPE_NAME_2;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.PAGEABLE_PAGE;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.PAGEABLE_SIZE;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.PAGEABLE_TOTAL_ELEMENTS;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.DB_CATEGORY_ID;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.util.List;

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

import com.kts.nvt.serbioneer.model.CulturalCategoryType;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;

@RunWith(SpringRunner.class)
@DataJpaTest
@TestPropertySource("classpath:test.properties")
public class CulturalCategoryTypeRepositoryUnitTest {

	@Autowired
	private TestEntityManager entityManager;
	
	@Autowired
	private CulturalCategoryTypeRepository culturalCategoryTypeRepository;
	
	private static int categoryTypesSizeDB;
	private static Long categoryType1Id;
	
	@Before
	public void setUp() {
		CulturalSiteCategory category = entityManager.find(CulturalSiteCategory.class, DB_CATEGORY_ID);
		
		categoryTypesSizeDB = category.getCulturalCategoryTypes().size();
		
		CulturalCategoryType categoryType1 = new CulturalCategoryType(NEW_CATEGORY_TYPE_NAME_1);
		categoryType1.setCulturalSiteCategory(category);
		categoryType1 = entityManager.persist(categoryType1);
		categoryType1Id = categoryType1.getId();
		
		CulturalCategoryType categoryType2 = new CulturalCategoryType(NEW_CATEGORY_TYPE_NAME_2);
		categoryType2.setCulturalSiteCategory(category);
		entityManager.persist(categoryType2);
	}
	
	@Test
	public void testFindAllByCulturalSiteCategoryId() {
		List<CulturalCategoryType> allCategorysTypes = culturalCategoryTypeRepository.findAllByCulturalSiteCategoryId(DB_CATEGORY_ID);
		
		assertEquals(categoryTypesSizeDB + 2, allCategorysTypes.size());
	}
	
	@Test
	public void testFindAllByCulturalSiteCategoryIdPageable() {
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalCategoryType> allCategoriesPage = culturalCategoryTypeRepository.findAllByCulturalSiteCategoryIdOrderByIdAsc(DB_CATEGORY_ID, pageable);
	
		assertEquals(PAGEABLE_TOTAL_ELEMENTS, allCategoriesPage.getContent().size());
	}

	@Test
	public void testFindOneByName() {
		CulturalCategoryType categoryType = culturalCategoryTypeRepository.findOneByName(NEW_CATEGORY_TYPE_NAME_1);
		
		assertEquals(NEW_CATEGORY_TYPE_NAME_1, categoryType.getName());
	}

	@Test
	public void testFindOneByNameAndIdNotShouldReturnNull() {
		// should return null (id corresponding with category type name)
		// -> there is no other entity with given name
		// (the name is unique - entity in question excluded)
		CulturalCategoryType categoryType = culturalCategoryTypeRepository.findOneByNameAndIdNot(NEW_CATEGORY_TYPE_NAME_1, categoryType1Id);
	
		assertNull(categoryType);
	}
	
	@Test
	public void testFindOneByNameAndIdNotShouldReturnEntity() {
		// should return entity (id NOT corresponding with category type name)
		// -> there is another entity with given name
		// (the name is NOT unique)
		CulturalCategoryType categoryType = culturalCategoryTypeRepository.findOneByNameAndIdNot(NEW_CATEGORY_TYPE_NAME_1, DB_CATEGORY_TYPE_ID);
	
		assertNotNull(categoryType);
		assertEquals(NEW_CATEGORY_TYPE_NAME_1, categoryType.getName());
		assertEquals(categoryType1Id, categoryType.getId());
		assertNotEquals(DB_CATEGORY_TYPE_ID, categoryType.getId());
	}

	@Test
	public void testFindOneByIdAndCulturalSiteCategoryIdShouldReturnNull() {
		CulturalCategoryType categoryType = culturalCategoryTypeRepository.findOneByIdAndCulturalSiteCategoryId(categoryType1Id, DB_CATEGORY_ID + 1);
	
		assertNull(categoryType);
	}
	
	@Test
	public void testFindOneByIdAndCulturalSiteCategoryIdShouldReturnEntity() {
		CulturalCategoryType categoryType = culturalCategoryTypeRepository.findOneByIdAndCulturalSiteCategoryId(categoryType1Id, DB_CATEGORY_ID);
		
		assertNotNull(categoryType);
		assertEquals(categoryType1Id, categoryType.getId());
		assertEquals(DB_CATEGORY_ID, categoryType.getCulturalSiteCategory().getId());
	}

}
