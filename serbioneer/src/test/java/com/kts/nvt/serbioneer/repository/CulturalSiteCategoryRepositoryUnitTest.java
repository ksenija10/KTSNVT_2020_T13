package com.kts.nvt.serbioneer.repository;

import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.DB_CATEGORY_ID;
import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.NEW_CATEGORY_NAME;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.model.CulturalSiteCategory;

@RunWith(SpringRunner.class)
@DataJpaTest
@TestPropertySource("classpath:test.properties")
public class CulturalSiteCategoryRepositoryUnitTest {
	
	@Autowired
	private TestEntityManager entityManager;
	
	@Autowired
	private CulturalSiteCategoryRepository culturalSiteCategoryRepository;
	
	private static Long newCategoryId;
	
	@Before
	public void setUp() {
		CulturalSiteCategory newCategory = entityManager.persist(new CulturalSiteCategory(NEW_CATEGORY_NAME));
		newCategoryId = newCategory.getId();
	}
	
	@Test
	public void testFindOneByName() {
		CulturalSiteCategory foundCategory = culturalSiteCategoryRepository.findOneByName(NEW_CATEGORY_NAME);
		
		assertEquals(NEW_CATEGORY_NAME, foundCategory.getName());
	}
	
	@Test
	public void testFindOneByNameAndIdNotShouldReturnNull() {
		// should return null (id corresponding with category name)
		CulturalSiteCategory foundCategory = culturalSiteCategoryRepository.findOneByNameAndIdNot(NEW_CATEGORY_NAME, newCategoryId);
	
		assertNull(foundCategory);
	}
	
	@Test
	public void testFindOneByNameAndIdNotShouldReturnEntity() {
		// should return entity (id NOT corresponding with category name)
		CulturalSiteCategory foundCategory = culturalSiteCategoryRepository.findOneByNameAndIdNot(NEW_CATEGORY_NAME, DB_CATEGORY_ID);
	
		assertNotNull(foundCategory);
		assertEquals(NEW_CATEGORY_NAME, foundCategory.getName());
		assertEquals(newCategoryId, foundCategory.getId());
		assertNotEquals(DB_CATEGORY_ID, foundCategory.getId());
	}
}
