package com.kts.nvt.serbioneer;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.AdminControllerIntegrationTest;
import com.kts.nvt.serbioneer.controller.AuthenticatedUserControllerIntegrationTest;
import com.kts.nvt.serbioneer.controller.CulturalSiteControllerIntegrationTest;
import com.kts.nvt.serbioneer.controller.RatingControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.AdminRepositoryIntegationTest;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.CulturalSiteRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.CulturalSiteRepositoryUnitTest;
import com.kts.nvt.serbioneer.repository.RatingRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.service.AdminServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.AuthenticatedUserServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.CulturalSiteServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.CulturalSiteServiceUnitTest;
import com.kts.nvt.serbioneer.service.RatingServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.RatingServiceUnitTest;

@RunWith(Suite.class)
@SuiteClasses({
	AdminControllerIntegrationTest.class, AdminServiceIntegrationTest.class, AdminRepositoryIntegationTest.class,
	AuthenticatedUserControllerIntegrationTest.class, AuthenticatedUserServiceIntegrationTest.class, AuthenticatedUserRepositoryIntegrationTest.class,
	RatingServiceUnitTest.class, RatingServiceIntegrationTest.class,
	RatingRepositoryIntegrationTest.class, RatingControllerIntegrationTest.class, 
	CulturalSiteControllerIntegrationTest.class,
	CulturalSiteRepositoryIntegrationTest.class, CulturalSiteRepositoryUnitTest.class,
	CulturalSiteServiceIntegrationTest.class, CulturalSiteServiceUnitTest.class
})
@TestPropertySource("classpath:test.properties")
public class SuiteAll {

}
