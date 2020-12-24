package com.kts.nvt.serbioneer.suite;

import com.kts.nvt.serbioneer.service.CommentServiceIntegrationTest;
import com.kts.nvt.serbioneer.service.CommentServiceUnitTest;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

@RunWith(Suite.class)
@Suite.SuiteClasses({CommentServiceIntegrationTest.class})
@TestPropertySource("classpath:test.properties")
public class CommentServiceSuite {
}
