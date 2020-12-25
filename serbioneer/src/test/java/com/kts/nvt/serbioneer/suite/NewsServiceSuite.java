package com.kts.nvt.serbioneer.suite;

import com.kts.nvt.serbioneer.repository.NewsRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.NewsRepositoryUnitTest;
import com.kts.nvt.serbioneer.service.NewsServiceIntegrationTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

@RunWith(Suite.class)
@Suite.SuiteClasses({NewsServiceIntegrationTest.class})
@TestPropertySource("classpath:test.properties")
public class NewsServiceSuite {
}
