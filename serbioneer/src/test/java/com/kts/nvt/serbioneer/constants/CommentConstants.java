package com.kts.nvt.serbioneer.constants;

import com.kts.nvt.serbioneer.model.*;
import lombok.NonNull;

public class CommentConstants {

    //All, approved and unapproved comments
    public static final int ALL_COMMENTS_SIZE = 3;
    public static final int APPROVED_COMMENTS_SIZE = 1;
    public static final int UNAPPROVED_COMMENTS_SIZE = 2;

    //Pagination
    public static final int PAGEABLE_PAGE = 0;
    public static final int PAGEABLE_SIZE = 3;

    //Approved and unapproved
    public static final Boolean APPROVED = true;
    public static final Boolean UNAPPROVED = false;

    //Srpsko narodno pozorište
    public static Long EXISTING_CULTURAL_SITE_ID = 2L;
    public static final int APPROVED_COMMENTS_NUM_CULTURAL_SITE_2 = 1;
    public static final int UNAPPROVED_COMMENTS_NUM_CULTURAL_SITE_2 = 1;

    //Existing user
    public static final Long EXISTING_USER_ID = 3L;

    //Existing approved and unapproved comment
    public static Long EXISTING_APPROVED_COMMENT_ID = 2L;
    public static Long EXISTING_UNAPPROVED_COMMENT_ID = 3L;

    //New comment info

    public static final String NEW_COMMENT_TEXT_1 = "Novi komentar";
    //Db state after adding new comment
    public static final int ALL_COMMENTS_SIZE_AFTER_ADD = 4;
    public static final int APPROVED_COMMENTS_SIZE_AFTER_ADD = 2;
    public static final int UNAPPROVED_COMMENTS_SIZE_AFTER_ADD = 2;
    public static final int APPROVED_COMMENTS_SIZE_AFTER_ADD_CULTURAL_SITE_2 = 2;

    //Non existing ids
    public static final Long NON_EXISTING_COMMENT_ID = 10L;
    public static final Long NON_EXISTING_USER_ID = 10L;
    public static final Long NON_EXISTING_CULTURAL_SITE_ID = 10L;


    //Updated text
    public static final String UPDATED_TEXT = "Promenjen komentar";
    public static final String OLD_TEXT_APPROVED = "Zište";
    public static final String OLD_TEXT_UNAPPROVED = "Ovaj komentar odbij!";

    //Service unit test new comment
    public static CulturalSite EXISTING_CULTURAL_SITE = new CulturalSite(EXISTING_CULTURAL_SITE_ID, "Biblioteka šabačka", 44.7556269,19.6923025
            ,"Masarikova 18", "Šabac","Библиотека шабачка је матична установа за све библиотеке на подручју осам општина Мачванског округа." );
    public static AuthenticatedUser EXISTING_AUTHENTICATED_USER = new AuthenticatedUser(EXISTING_USER_ID, "Isidor",
            "Gavric", "prvi@user.com", "$2a$04$Amda.Gm4Q.ZbXz9wcohDHOhOBaNQAkSS1QO26Eh8Hovu3uzEpQvcq", true);
    public static Comment NEW_COMMENT = new Comment(NEW_COMMENT_TEXT_1);
    public static Comment SAVED_COMMENT = NEW_COMMENT;
    public static final Long SAVED_COMMENT_ID = 2L;

    public static Comment COMMENT_TO_UPDATE = new Comment("Komentar za update", true,
            EXISTING_AUTHENTICATED_USER, EXISTING_CULTURAL_SITE);
    public static Long COMMENT_TO_UPDATE_ID = 4L;


    //Existing approved comment for service unit delete
    public static Comment EXISTING_APPROVED_COMMENT = new Comment("Tekst komentara",
            true, EXISTING_AUTHENTICATED_USER, EXISTING_CULTURAL_SITE);
    public static Comment EXISTING_UNAPPROVED_COMMENT = new Comment("Tekst neodobrenog komentara",
            false, EXISTING_AUTHENTICATED_USER, EXISTING_CULTURAL_SITE);
    public static Comment EXISTING_UNAPPROVED_COMMENT_APPROVED = new Comment("Tekst neodobrenog komentara",
            true, EXISTING_AUTHENTICATED_USER, EXISTING_CULTURAL_SITE);
    public static Long EXISTING_UNAPPROVED_COMMENT_FOR_REJECT_ID = 5L;
    public static Comment EXISTING_UNAPPROVED_COMMENT_FOR_REJECT = new Comment("Tekst neodobrenog komentara",
            false, EXISTING_AUTHENTICATED_USER, EXISTING_CULTURAL_SITE);
    public static Long EXISTING_UNAPPROVED_COMMENT_FOR_DELETE_ID = 6L;
    public static Comment EXISTING_UNAPPROVED_COMMENT_FOR_DELETE = new Comment("Tekst neodobrenog komentara",
            false, EXISTING_AUTHENTICATED_USER, EXISTING_CULTURAL_SITE);
    // new comment info
    /*public static final Long USER_ID = 2L;
    public static final Long CULTURAL_SITE_ID = 1L;
    public static final Long COMMENT_ID = 1L;



    //approved and unapproved number of comments on Biblioteka Šabačka(id: 1)

    public static final int APPROVED_COMMENTS_NUM_CULTURAL_SITE_1_ADD = 1;
    public static final int UNAPPROVED_COMMENTS_NUM_CULTURAL_SITE_1 = 1;

    //Service new comment for create method
    public static Comment COMMENT = new Comment(COMMENT_TEXT_1);
    //Service saved comment
    public static Comment SAVED_COMMENT = new Comment(COMMENT_TEXT_1);
    //Service saved comment id


    //AuthenticatedUser for service
    public static final Long NEW_USER_ID = 10L;
    public static final String USER_NAME = "Mika";
    public static final String USER_SURNAME = "Antic";
    public static final String USER_EMAIL = "novi@user.com";
    public static final String USER_PASSWORD = "nova";
    public static final Boolean USER_ACTIVATED = true;
    public static final AuthenticatedUser USER = new AuthenticatedUser(USER_ID, USER_NAME, USER_SURNAME, USER_EMAIL,
            USER_PASSWORD, USER_ACTIVATED);



    public static final Long NEW_COMMENT_ID = 4L;
*/

}
