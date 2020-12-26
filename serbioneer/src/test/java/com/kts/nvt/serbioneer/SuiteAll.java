package com.kts.nvt.serbioneer;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.CulturalSiteCategoryControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.CulturalCategoryTypeRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.CulturalCategoryTypeRepositoryUnitTest;
import com.kts.nvt.serbioneer.repository.CulturalSiteCategoryRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.CulturalSiteCategoryRepositoryUnitTest;
import com.kts.nvt.serbioneer.service.CulturalCategoryTypeServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.CulturalCategoryTypeServiceUnitTest;
import com.kts.nvt.serbioneer.service.CulturalSiteCategoryServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.CulturalSiteCategoryServiceUnitTest;

@RunWith(Suite.class)
@SuiteClasses({
	CulturalCategoryTypeRepositoryIntegrationTest.class,
	CulturalCategoryTypeRepositoryUnitTest.class,
	CulturalSiteCategoryRepositoryIntegrationTest.class,
	CulturalSiteCategoryRepositoryUnitTest.class,
	CulturalCategoryTypeServiceIntegrationTest.class,
	CulturalCategoryTypeServiceUnitTest.class,
	CulturalSiteCategoryServiceIntegrationTest.class,
	CulturalSiteCategoryServiceUnitTest.class,
	CulturalSiteCategoryControllerIntegrationTest.class
})
@TestPropertySource("classpath:test.properties")
public class SuiteAll {

}
