package com.kts.nvt.serbioneer;

import com.kts.nvt.serbioneer.controller.RatingControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.RatingRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.service.*;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.AdminControllerIntegrationTest;
import com.kts.nvt.serbioneer.controller.AuthenticatedUserControllerIntegrationTest;
import com.kts.nvt.serbioneer.controller.CulturalSiteControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.AdminRepositoryIntegationTest;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepositoryIntegrationTest;

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
