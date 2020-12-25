package com.kts.nvt.serbioneer.constants;

import com.kts.nvt.serbioneer.model.*;

public class RatingConstants {

    public static final Integer PAGEABLE_PAGE = 0;
    public static final Integer PAGEABLE_SIZE = 2;
    public static final Integer PAGEABLE_TOTAL_ELEMENTS = 1;

    public static final Long CULTURAL_SITE_ID = 1L;
    public static final Long CULTURAL_SITE_ID_RANDOM = 100L;
    public static final Long USER_ID = 2L;
    public static final Long RATING_ID = 1L;
    public static final Long RATING_ID_RANDOM = 100L;


    public static final CulturalSite CULTURAL_SITE = new CulturalSite("site1", "address1", "city1",
            new CulturalCategoryType("categoryType1"),
            new CulturalSiteCategory("category1")
    );

    public static final String USER_USERNAME = "prvi@user.com";
    public static final String USER_PASSWORD = "user";

    public static final AuthenticatedUser AUTHENTICATED_USER = new AuthenticatedUser(2L,"","",USER_USERNAME,
            "",true);

    public static final Rating NEW_RATING = new Rating(4, CULTURAL_SITE, AUTHENTICATED_USER);

    public static final Rating RATING = new Rating(5,
            new CulturalSite("site1", "address1", "city1",
                    new CulturalCategoryType("categoryType1"),
                    new CulturalSiteCategory("category1")
            ),
            AUTHENTICATED_USER
    );

    public static final Integer NEW_VALUE = 5;
    public static final Integer NEW_CULTURAL_SITE = 3;
    public static final String NEW_USER_USERNAME = "srdjanmilic12@gmail.com";
    public static final String NEW_USER_PASSWORD = "srdjabroj1";


}
