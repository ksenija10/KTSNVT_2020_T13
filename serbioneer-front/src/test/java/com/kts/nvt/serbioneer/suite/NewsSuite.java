package com.kts.nvt.serbioneer.suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.NewsControllerIntegrationTest;

@RunWith(Suite.class)
@Suite.SuiteClasses({NewsRepositorySuite.class, NewsServiceSuite.class, NewsControllerIntegrationTest.class})
@TestPropertySource("classpath:test.properties")
public class NewsSuite {
}
