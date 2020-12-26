package com.kts.nvt.serbioneer.suite;

import com.kts.nvt.serbioneer.controller.AdminControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.AdminRepositoryIntegationTest;
import com.kts.nvt.serbioneer.repository.NewsRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.NewsRepositoryUnitTest;
import com.kts.nvt.serbioneer.service.AdminServiceIntegrationTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

@RunWith(Suite.class)
@Suite.SuiteClasses({NewsRepositoryIntegrationTest.class, NewsRepositoryUnitTest.class})
@TestPropertySource("classpath:test.properties")
public class NewsRepositorySuite {
}
