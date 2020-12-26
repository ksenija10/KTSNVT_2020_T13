package com.kts.nvt.serbioneer.suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

import com.kts.nvt.serbioneer.controller.ImageControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.ImageRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.ImageRepositoryUnitTest;
import com.kts.nvt.serbioneer.service.ImageServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.ImageServiceUnitTest;

@RunWith(Suite.class)
@Suite.SuiteClasses({
	ImageRepositoryIntegrationTest.class, 
	ImageRepositoryUnitTest.class,
	ImageServiceIntegrationTest.class, 
	ImageServiceUnitTest.class,
	ImageControllerIntegrationTest.class
})
public class ImageSuite {
}
