package com.kts.nvt.serbioneer.suite;

import com.kts.nvt.serbioneer.repository.CommentRepositoryIntegrationTest;
import com.kts.nvt.serbioneer.repository.CommentRepositoryUnitTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

@RunWith(Suite.class)
@Suite.SuiteClasses({CommentRepositoryIntegrationTest.class, CommentRepositoryUnitTest.class})
@TestPropertySource("classpath:test.properties")
public class CommentRepositorySuite {
}
