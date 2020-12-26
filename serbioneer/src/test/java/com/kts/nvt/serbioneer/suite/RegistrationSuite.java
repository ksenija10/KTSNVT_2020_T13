package com.kts.nvt.serbioneer.suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

import com.kts.nvt.serbioneer.controller.RefreshControllerIntegrationTest;
import com.kts.nvt.serbioneer.controller.RegistrationControllerIntegrationTest;
import com.kts.nvt.serbioneer.service.SecureUserDetailsServiceIntegrationTest;

@RunWith(Suite.class)
@Suite.SuiteClasses({
	SecureUserDetailsServiceIntegrationTest.class, 
	RefreshControllerIntegrationTest.class, 
	RegistrationControllerIntegrationTest.class
})
public class RegistrationSuite {
}
