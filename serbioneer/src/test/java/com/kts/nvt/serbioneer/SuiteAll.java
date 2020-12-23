package com.kts.nvt.serbioneer;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.AdminControllerIntegrationTest;
import com.kts.nvt.serbioneer.controller.AuthenticatedUserControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.AdminRepositoryIntegationTest;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.service.AdminServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.AuthenticatedUserServiceIntegrationTest;

@RunWith(Suite.class)
@SuiteClasses({AdminControllerIntegrationTest.class, AdminRepositoryIntegationTest.class, AdminServiceIntegrationTest.class,
	AuthenticatedUserControllerIntegrationTest.class, AuthenticatedUserRepositoryIntegrationTest.class,
	AuthenticatedUserServiceIntegrationTest.class})
@TestPropertySource("classpath:test.properties")
public class SuiteAll {

}
