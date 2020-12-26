package com.kts.nvt.serbioneer.suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

import com.kts.nvt.serbioneer.controller.RatingControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.RatingRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.service.RatingServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.RatingServiceUnitTest;

@RunWith(Suite.class)
@Suite.SuiteClasses({
	RatingRepositoryIntegrationTest.class, 
	RatingServiceIntegrationTest.class, 
	RatingServiceUnitTest.class,
	RatingControllerIntegrationTest.class
})
public class RatingSuite {
}
