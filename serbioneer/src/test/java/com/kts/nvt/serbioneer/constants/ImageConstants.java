package com.kts.nvt.serbioneer.constants;

import com.kts.nvt.serbioneer.model.*;

public class ImageConstants {
    public static final String IMAGE_PATH_1 = "sample/path/1";
    public static final String IMAGE_PATH_2 = "sample/path/2";
    public static final String IMAGE_PATH_3 = "sample/path/3";
    public static final String IMAGE_PATH_4 = "sample/path/4";

    public static final String IMAGE_NAME_1 = "name1";
    public static final String IMAGE_NAME_2 = "name2";
    public static final String IMAGE_NAME_3 = "name3";
    public static final String IMAGE_NAME_4 = "name4";

    public static final Long IMAGE_ID = 1L;
    public static final Long IMAGE_ID_DELETE = 2L;
    public static final Long IMAGE_ID_RANDOM = 100L;

    public static final Long NEWS_ID = 1L;
    public static final Long NEWS_ID_NEW = 4L;

    public static final Long COMMENT_ID = 1L;
    public static final Long COMMENT_ID_NEW = 4L;

    public static final Long CULTURAL_SITE_ID = 1L;
    public static final Long CULTURAL_SITE_ID_NEW = 4L;

    public static final Integer PAGEABLE_PAGE = 0;
    public static final Integer PAGEABLE_SIZE = 2;
    public static final Integer PAGEABLE_TOTAL_ELEMENTS = 1;

    public static final Comment COMMENT = new Comment("text");
    public static final News NEWS = new News("information");
    public static final CulturalSite CULTURAL_SITE = new CulturalSite("name", "address", "city",
            new CulturalCategoryType("type"), new CulturalSiteCategory("category"));

    public static final String separator = System.getProperty("file.separator");
    public static final String EXPECTED_PATH_COMMENT = "src" + separator + "test" + separator + "resources" + separator
            + "images" + separator + "comment" + separator + COMMENT_ID + separator + "something";
    public static final String EXPECTED_PATH_NEWS = "src" + separator + "main" + separator + "resources" + separator
            + "images" + separator + "news" + separator + COMMENT_ID + separator + "something";
    public static final String EXPECTED_PATH_CULTURAL_SITE = "src" + separator + "main" + separator + "resources"
            + separator + "images" + separator + "culturalSite" + separator + COMMENT_ID + separator + "something";

    public static final String CREATED_IMAGE_NAME = "something";

    public static final Image CREATED_IMAGE = new Image(CREATED_IMAGE_NAME,
            EXPECTED_PATH_COMMENT, COMMENT);


    public static final String USER_USERNAME = "prvi@user.com";
    public static final String USER_PASSWORD = "user";

    public static final String ADMIN_USERNAME = "admin@admin.com";
    public static final String ADMIN_PASSWORD = "admin";




}
