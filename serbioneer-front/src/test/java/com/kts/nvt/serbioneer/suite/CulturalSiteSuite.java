package com.kts.nvt.serbioneer.suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.CulturalSiteControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.CulturalSiteRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.CulturalSiteRepositoryUnitTest;
import com.kts.nvt.serbioneer.service.CulturalSiteServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.CulturalSiteServiceUnitTest;

@RunWith(Suite.class)
@Suite.SuiteClasses({
	CulturalSiteControllerIntegrationTest.class,
	CulturalSiteServiceIntegrationTest.class,
	CulturalSiteServiceUnitTest.class,
	CulturalSiteRepositoryIntegrationTest.class,
	CulturalSiteRepositoryUnitTest.class
})
@TestPropertySource("classpath:test.properties")
public class CulturalSiteSuite {
}
