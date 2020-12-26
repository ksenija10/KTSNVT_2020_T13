package com.kts.nvt.serbioneer.suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.controller.CommentControllerIntegrationTest;

@RunWith(Suite.class)
@Suite.SuiteClasses({CommentRepositorySuite.class, CommentServiceSuite.class, CommentControllerIntegrationTest.class})
@TestPropertySource("classpath:test.properties")
public class CommentSuite {
}
