package com.kts.nvt.serbioneer.suite;

import com.kts.nvt.serbioneer.controller.NewsControllerIntegrationTest;
import com.kts.nvt.serbioneer.service.NewsServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.NewsServiceUnitTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

@RunWith(Suite.class)
@Suite.SuiteClasses({NewsRepositorySuite.class, NewsServiceSuite.class, NewsControllerIntegrationTest.class})
@TestPropertySource("classpath:test.properties")
public class NewsSuite {
}
