package com.kts.nvt.serbioneer;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.repository.CulturalSiteRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.CulturalSiteRepositoryUnitTest;
import com.kts.nvt.serbioneer.service.CulturalSiteServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.CulturalSiteServiceUnitTest;

@RunWith(Suite.class)
@SuiteClasses({
	CulturalSiteRepositoryIntegrationTest.class, CulturalSiteRepositoryUnitTest.class,
	CulturalSiteServiceIntegrationTest.class, CulturalSiteServiceUnitTest.class
})
@TestPropertySource("classpath:test.properties")
public class SuiteAll {

}
