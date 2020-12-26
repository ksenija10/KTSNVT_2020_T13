package com.kts.nvt.serbioneer.suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.repository.NewsRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.NewsRepositoryUnitTest;

@RunWith(Suite.class)
@Suite.SuiteClasses({NewsRepositoryIntegrationTest.class, NewsRepositoryUnitTest.class})
@TestPropertySource("classpath:test.properties")
public class NewsRepositorySuite {
}
