package com.kts.nvt.serbioneer.suite;

import com.kts.nvt.serbioneer.controller.CommentControllerIntegrationTest;
import com.kts.nvt.serbioneer.repository.CommentRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.CommentRepositoryUnitTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

@RunWith(Suite.class)
@Suite.SuiteClasses({CommentRepositorySuite.class, CommentServiceSuite.class, CommentControllerIntegrationTest.class})
@TestPropertySource("classpath:test.properties")
public class CommentSuite {
}
