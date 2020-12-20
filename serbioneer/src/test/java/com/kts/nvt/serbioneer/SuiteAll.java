package com.kts.nvt.serbioneer;

import com.kts.nvt.serbioneer.repository.ImageRepositoryUnitTest;
import com.kts.nvt.serbioneer.service.ImageServiceUnitTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.AdminControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.AdminRepositoryIntegationTest;
import com.kts.nvt.serbioneer.service.AdminServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.AdminServiceUnitTest;

@RunWith(Suite.class)
@SuiteClasses({AdminControllerIntegrationTest.class, AdminRepositoryIntegationTest.class, AdminServiceIntegrationTest.class, 
		AdminServiceUnitTest.class, ImageRepositoryUnitTest.class, ImageServiceUnitTest.class})
@TestPropertySource("classpath:test.properties")
public class SuiteAll {

}