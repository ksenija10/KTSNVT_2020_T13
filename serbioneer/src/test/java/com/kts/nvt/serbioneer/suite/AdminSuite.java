package com.kts.nvt.serbioneer.suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.AdminControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.AdminRepositoryIntegationTest;
import com.kts.nvt.serbioneer.service.AdminServiceIntegrationTest;

@RunWith(Suite.class)
@Suite.SuiteClasses({
	AdminRepositoryIntegationTest.class, 
	AdminServiceIntegrationTest.class,
	AdminControllerIntegrationTest.class
})
@TestPropertySource("classpath:test.properties")
public class AdminSuite {
}
