package com.kts.nvt.serbioneer.constants;

import com.kts.nvt.serbioneer.model.*;

import java.util.*;

public class NewsConstants {

    //All news
    public static final int ALL_NEWS = 3;

    //Pagination
    public static final Integer PAGEABLE_PAGE = 0;
    public static final Integer PAGEABLE_SIZE = 4;

    //Existing cultural site
    public static final Long EXISTING_CULTURAL_SITE_ID = 1L;

    //Existing news
    public static final Long EXISTING_NEWS_ID = 1L;

    //Existing user id
    public static final Long EXISTING_USER_ID = 2L;
    //Subscribed news
    public static final int SUBSCRIBED_NEWS_USER_ID_2 = 3;

    //Biblioteka Sabacka
    public static final int NEWS_CULTURAL_SITE_ID_1 = 2;

    //NonExisting ids
    public static final Long NON_EXISTING_NEWS_ID = 10L;
    public static final Long NON_EXISTING_USER_ID = 10L;
    public static final Long NON_EXISTING_CULTURAL_SITE_ID = 10L;

    //New news
    public static final String NEWS_INFORMATION = "Neke nove novosti";
   // public static final Date NEWS_DATE = new GregorianCalendar(2020, Calendar.DECEMBER, 12).getTime();
    //Database after new news
    public static final int NEWS_BY_CULTURAL_SITE_ID_1_ADD = 3;
    public static final int NEWS_BY_CULTURAL_SITES_ADD = 4;

    //Updated news
    public static final String UPDATED_NEWS_INFORMATION = "Promenjene novosti";

    //Unit service testing
    //public static CulturalSiteCategory culturalCategory =  new CulturalSiteCategory("Institucija");
    //public static CulturalCategoryType culturalCategoryType = new CulturalCategoryType("Biblioteka", culturalCategory);
    public static News NEW_NEWS = new News(NEWS_INFORMATION);
    public static News SAVED_NEWS = new News(NEWS_INFORMATION);
    public static final Long NEW_NEWS_ID = 4L;
    public static CulturalSite CULTURAL_SITE = new CulturalSite(EXISTING_CULTURAL_SITE_ID, "Biblioteka šabačka", 44.7556269,19.6923025
    ,"Masarikova 18", "Šabac","Библиотека шабачка је матична установа за све библиотеке на подручју осам општина Мачванског округа." );
    public static News EXISTING_NEWS = new News(EXISTING_NEWS_ID, NEWS_INFORMATION);

    public static AuthenticatedUser EXISTING_AUTHENTICATED_USER = new AuthenticatedUser(EXISTING_USER_ID, "Isidor",
            "Gavric", "prvi@user.com", "$2a$04$Amda.Gm4Q.ZbXz9wcohDHOhOBaNQAkSS1QO26Eh8Hovu3uzEpQvcq", true);

    //subscribed news
    public static News NEWS_1 = new News("Neke novosti za bibl", new GregorianCalendar(2020, Calendar.DECEMBER, 12).getTime(),
            CULTURAL_SITE);
    public static News NEWS_2 = new News("Neke novosti za bibl 2", new GregorianCalendar(2020, Calendar.NOVEMBER, 14).getTime(),
            CULTURAL_SITE);
    public static News NEWS_3 = new News("Neke novosti pt2", new GregorianCalendar(2020, Calendar.NOVEMBER, 12).getTime(),
            CULTURAL_SITE);
}
