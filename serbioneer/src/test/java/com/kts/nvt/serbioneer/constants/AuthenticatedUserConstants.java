package com.kts.nvt.serbioneer.constants;

public class AuthenticatedUserConstants {
	//logovanje admina i prebrojavanje user-a
	public static final String ADMIN_USERNAME = "admin@admin.com";
	public static final String ADMIN_PASSWORD = "admin";
	//page 0 size 3
	public static final long FIND_PAGEABLE_USERS = 3;
	
	//logovanje user-a
	public static final Long USER_ID = 3L;
	public static final String USER_USERNAME = "drugi@user.com";
	public static final String USER_PASSWORD = "user";
	
	//update user-a
	public static final String UPDATE_NAME = "Magdalena";
	public static final String UPDATE_SURNAME = "Rakovic";
	
	//login user2 i menjanje sifre
	public static final Long USER2_ID = 5L;
	public static final String USER2_USERNAME = "dolanovkatarina@gmail.com";
	public static final String USER2_PASSWORD = "katarina1!";
	public static final String UPDATE_PASSWORD = "kaca";
	public static final String UPDATE_REPEATED_PASSWORD = "kaca";
	
	//subscribe
	public static final Long CULTURAL_SITE_ID = 5L;
	
	//login user3 i unsubscribe 
	public static final Long USER3_ID = 2L;
	public static final String USER3_USERNAME = "prvi@user.com";
	public static final String USER3_PASSWORD = "user";
	public static final Long CULTURAL_SITE_ID2 = 1L;
	
	//repository findOneByEmail
	public static final String USER_EMAIL = "drugi@user.com";
	public static final String USER_EMAIL_NULL = "neki@user.com";
	public static final String USER_NOT_ACTIVATED = "treci@user.com";
	
	//service integration test
	public static final long ALL_USERS = 5;
	public static final String CREATE_USERNAME = "neki@user.com";
	public static final String CREATE_PASSWORD = "user";
	public static final String CREATE_NAME = "Magdalena";
	public static final String CREATE_SURNAME = "Rakovic";
	public static final String DELETE_USERNAME = "neki@user.com";
	public static final Long USER4_ID = 4L;
	public static final String USER4_PASSWORD = "srdjabroj1";
	public static final String UPDATE4_PASSWORD = "srdja";
	public static final String UPDATE4_REPEATED_PASSWORD = "srdja";
	public static final Long USER8_ID = 8L;
	public static final Long CULTURAL_SITE_ID3 = 1L;
	public static final Long CULTURAL_SITE_ID4 = 2L;
	public static final Long CULTURAL_SITE_ID5 = 5L;
	public static final Long CULTURAL_SITE_ID6 = 4L;
	
	//service unit testovi
	
}
