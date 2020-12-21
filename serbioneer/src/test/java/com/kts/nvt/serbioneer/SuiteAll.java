package com.kts.nvt.serbioneer;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.AdminControllerIntegrationTest;

@RunWith(Suite.class)
/*, AdminRepositoryIntegationTest.class, AdminServiceIntegrationTest.class, 
		AdminServiceUnitTest.class*/
@SuiteClasses({AdminControllerIntegrationTest.class})
@TestPropertySource("classpath:test.properties")
public class SuiteAll {

}
