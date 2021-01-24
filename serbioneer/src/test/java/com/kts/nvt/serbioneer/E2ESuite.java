package com.kts.nvt.serbioneer;

import com.kts.nvt.serbioneer.e2e.*;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.springframework.test.context.TestPropertySource;

@RunWith(Suite.class)
@Suite.SuiteClasses({
        CategoriesE2ETest.class,
        CategoryTypesE2ETests.class,
        ChangePasswordAdminE2ETest.class,
        HeaderE2ETest.class,
        HomepageE2ETest.class,
        LoginE2ETest.class,
        LoginRegisterE2ETest.class,
        LogoutE2ETest.class,
        MyProfileAdminE2ETest.class,
        MyProfileAuthenticatedUserE2ETest.class,
        NewAdminE2ETest.class,
        NewCulturalSiteE2ETEst.class,
        NewsfeedE2ETest.class,
        PendingCommentsE2ETest.class,
        RegisterE2ETest.class,
        SubscribedE2ETests.class,
        ViewAdminE2ETest.class,
        ViewCulturalSiteAuthenticatedUserE2ETest.class,
        ViewCulturalSiteAdminE2ETest.class,
        ViewCulturalSiteUnauthenticatedUserE2ETest.class
})
@TestPropertySource("classpath:test.properties")
public class E2ESuite {
}
