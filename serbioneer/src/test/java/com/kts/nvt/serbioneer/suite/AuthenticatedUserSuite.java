package com.kts.nvt.serbioneer.suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.AuthenticatedUserControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.AuthenticatedUserRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.service.AuthenticatedUserServiceIntegrationTest;

@RunWith(Suite.class)
@Suite.SuiteClasses({
	AuthenticatedUserRepositoryIntegrationTest.class, 
	AuthenticatedUserServiceIntegrationTest.class,
	AuthenticatedUserControllerIntegrationTest.class
})
@TestPropertySource("classpath:test.properties")
public class AuthenticatedUserSuite {
}
