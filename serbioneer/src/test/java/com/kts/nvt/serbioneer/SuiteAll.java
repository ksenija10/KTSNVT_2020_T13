package com.kts.nvt.serbioneer;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.AdminControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.AdminRepositoryIntegationTest;
import com.kts.nvt.serbioneer.service.AdminServiceIntegrationTest;

@RunWith(Suite.class)
/*AdminServiceIntegrationTest.class, 
		AdminServiceUnitTest.class*/
@SuiteClasses({AdminControllerIntegrationTest.class, AdminRepositoryIntegationTest.class, AdminServiceIntegrationTest.class})
@TestPropertySource("classpath:test.properties")
public class SuiteAll {

}
