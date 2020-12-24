package com.kts.nvt.serbioneer.constants;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class NewsConstants {

    public static final String NEWS_INFORMATION = "Neke nove novosti";

    public static final Date NEWS_DATE = new GregorianCalendar(2020, Calendar.DECEMBER, 12).getTime();

    public static final Long CULTURAL_SITE_ID = 1L;

    public static final int NEWS_BY_CULTURAL_SITE_ID_1_ADD_SIZE = 3;
    public static final int NEWS_BY_CULTURAL_SITE_ID_1_SIZE = 2;

    public static final Integer PAGEABLE_PAGE = 0;
    public static final Integer PAGEABLE_SIZE = 4;

    public static final Long AUTHENTICATED_USER_ID = 2L;

    public static final int NEWS_BY_CULTURAL_SITES_ADD_SIZE = 4;
    public static final int NEWS_BY_CULTURAL_SITES_SIZE = 3;
}
