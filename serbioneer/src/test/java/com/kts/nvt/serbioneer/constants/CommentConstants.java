package com.kts.nvt.serbioneer.constants;

import com.kts.nvt.serbioneer.model.*;

public class CommentConstants {

    // new comment info
    public static final Long USER_ID = 2L;
    public static final Long CULTURAL_SITE_ID = 1L;
    public static final String COMMENT_TEXT_1 = "Prvi komentar";
    public static final Boolean APPROVED = true;
    public static final Boolean UNAPPROVED = false;

    //approved and unapproved number of comments
    public static final int APPROVED_COMMENTS_SIZE = 2;
    public static final int UNAPPROVED_COMMENTS_SIZE = 2;

    //page constants
    public static final int PAGEABLE_PAGE = 0;
    public static final int PAGEABLE_SIZE = 3;

    //approved and unapproved number of comments on Biblioteka Šabačka(id: 1)
    public static final int APPROVED_COMMENTS_NUM_CULTURAL_SITE_1 = 0;
    public static final int APPROVED_COMMENTS_NUM_CULTURAL_SITE_1_ADD = 1;
    public static final int UNAPPROVED_COMMENTS_NUM_CULTURAL_SITE_1 = 1;

    //Service new comment for create method
    public static Comment COMMENT = new Comment(COMMENT_TEXT_1);
    //Service saved comment
    public static Comment SAVED_COMMENT = new Comment(COMMENT_TEXT_1);
    //Service saved comment id
    public static final Long SAVED_COMMENT_ID = 2L;

    //Service bad cultural site id
    public static final Long BAD_CULTURAL_SITE_ID = 10L;

    //AuthenticatedUser for service
    public static final Long NEW_USER_ID = 10L;
    public static final String USER_NAME = "Mika";
    public static final String USER_SURNAME = "Antic";
    public static final String USER_EMAIL = "novi@user.com";
    public static final String USER_PASSWORD = "nova";
    public static final Boolean USER_ACTIVATED = true;
    public static final AuthenticatedUser USER = new AuthenticatedUser(USER_ID, USER_NAME, USER_SURNAME, USER_EMAIL,
            USER_PASSWORD, USER_ACTIVATED);

    //Cultural site for service
    /*public static final
    public static final CulturalSite CULTURAL_SITE = new CulturalSite("name", "address", "city",
            new CulturalCategoryType("type"), new CulturalSiteCategory("category"));

    public static final Comment NEW_COMMENT = new Comment(COMMENT_TEXT_1, APPROVED, USER_ID, CULTURAL_SITE_ID);*/
}
