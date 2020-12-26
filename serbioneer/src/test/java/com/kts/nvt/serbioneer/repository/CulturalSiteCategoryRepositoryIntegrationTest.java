package com.kts.nvt.serbioneer.repository;

import static com.kts.nvt.serbioneer.constants.CulturalSiteCategoryConstants.*;
import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.model.CulturalSiteCategory;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalSiteCategoryRepositoryIntegrationTest {

	@Autowired
	private CulturalSiteCategoryRepository culturalSiteCategoryRepository;
	
	@Test
	public void testFindOneByName() {
		CulturalSiteCategory foundCategory = culturalSiteCategoryRepository.findOneByName(DB_NAME);
		
		assertEquals(DB_NAME, foundCategory.getName());
	}

	@Test
	public void testFindOneByNameAndIdNotShouldReturnNull() {
		// should return null (id corresponding with category name)
		CulturalSiteCategory foundCategory = culturalSiteCategoryRepository.findOneByNameAndIdNot(DB_NAME, DB_ID);
	
		assertNull(foundCategory);
	}

	@Test
	public void testFindOneByNameAndIdNotShouldReturnEntity() {
		// should return entity (id NOT corresponding with category name)
		CulturalSiteCategory foundCategory = culturalSiteCategoryRepository.findOneByNameAndIdNot(DB_NAME_EXISTING, DB_ID);
	
		assertNotNull(foundCategory);
		assertEquals(DB_NAME_EXISTING, foundCategory.getName());
		assertEquals(DB_ID_EXISTING, foundCategory.getId());
		assertNotEquals(DB_ID, foundCategory.getId());
	}
}
