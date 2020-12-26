package com.kts.nvt.serbioneer;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
import org.springframework.test.context.TestPropertySource;

import com.kts.nvt.serbioneer.suite.AdminSuite;
import com.kts.nvt.serbioneer.suite.AuthenticatedUserSuite;
import com.kts.nvt.serbioneer.suite.CommentSuite;
import com.kts.nvt.serbioneer.suite.CulturalSiteCategoryAndTypeSuite;
import com.kts.nvt.serbioneer.suite.CulturalSiteSuite;
import com.kts.nvt.serbioneer.suite.ImageSuite;
import com.kts.nvt.serbioneer.suite.NewsSuite;
import com.kts.nvt.serbioneer.suite.RatingSuite;
import com.kts.nvt.serbioneer.suite.RegistrationSuite;

@RunWith(Suite.class)
@SuiteClasses({
	AdminSuite.class,
	AuthenticatedUserSuite.class,
	CommentSuite.class,
	CulturalSiteCategoryAndTypeSuite.class,
	CulturalSiteSuite.class,
	ImageSuite.class,
	NewsSuite.class,
	RatingSuite.class,
	RegistrationSuite.class
})
@TestPropertySource("classpath:test.properties")
public class SuiteAll {

}
