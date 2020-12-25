package com.kts.nvt.serbioneer.constants;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

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

    //New news
    public static final String NEWS_INFORMATION = "Neke nove novosti";
   // public static final Date NEWS_DATE = new GregorianCalendar(2020, Calendar.DECEMBER, 12).getTime();
    //Database after new news
    public static final int NEWS_BY_CULTURAL_SITE_ID_1_ADD = 3;
    public static final int NEWS_BY_CULTURAL_SITES_ADD = 4;

    //Updated news
    public static final String UPDATED_NEWS_INFORMATION = "Promenjene novosti";
}
