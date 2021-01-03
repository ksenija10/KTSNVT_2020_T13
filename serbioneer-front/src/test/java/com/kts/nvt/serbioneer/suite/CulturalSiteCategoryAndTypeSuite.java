package com.kts.nvt.serbioneer.suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

import com.kts.nvt.serbioneer.controller.CulturalSiteCategoryControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.CulturalCategoryTypeRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.CulturalCategoryTypeRepositoryUnitTest;
import com.kts.nvt.serbioneer.repository.CulturalSiteRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.CulturalSiteRepositoryUnitTest;
import com.kts.nvt.serbioneer.service.CulturalCategoryTypeServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.CulturalCategoryTypeServiceUnitTest;
import com.kts.nvt.serbioneer.service.CulturalSiteCategoryServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.CulturalSiteCategoryServiceUnitTest;

@RunWith(Suite.class)
@Suite.SuiteClasses({
	CulturalCategoryTypeRepositoryIntegrationTest.class, 
	CulturalCategoryTypeRepositoryUnitTest.class,
	CulturalSiteRepositoryIntegrationTest.class,
	CulturalSiteRepositoryUnitTest.class,
	CulturalCategoryTypeServiceIntegrationTest.class,
	CulturalCategoryTypeServiceUnitTest.class,
	CulturalSiteCategoryServiceIntegrationTest.class,
	CulturalSiteCategoryServiceUnitTest.class,
	CulturalSiteCategoryControllerIntegrationTest.class
})
public class CulturalSiteCategoryAndTypeSuite {
}
