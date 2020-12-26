package com.kts.nvt.serbioneer.constants;

import com.kts.nvt.serbioneer.model.CulturalCategoryType;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;
import com.kts.nvt.serbioneer.model.Rating;

public class CulturalSiteConstants {

	public static final Long SUBSCRIBED_USER_ID = 2L;
	public static final int USER_SUBSCRIBED_NUM = 3;
	
	public static final long PAGEABLE_TOTAL_ELEMENTS = 3;
	public static final Integer PAGEABLE_PAGE = 0;
	public static final Integer PAGEABLE_SIZE = 5;
	
	// service
	public static final int TOTAL_ELEMENTS = 3;
	
	public static final Long CATEGORY_ID = 10L;
	public static final String CATEGORY_NAME = "Kategorija";
	public static final CulturalSiteCategory CATEGORY = new CulturalSiteCategory(CATEGORY_NAME);
	public static final Long TYPE_ID = 11L;
	public static final String TYPE_NAME = "Tip kategorije";
	public static final CulturalCategoryType TYPE = new CulturalCategoryType(TYPE_NAME);
	
	public static final Long CULTURAL_SITE_ID_1 = 1L;
	public static final Long INVALID_ID = -1L;
	public static final Long INVALID_COMBINATION_ID = 25L;
	
	// existing
	public static final String CULTURAL_SITE_NAME_1 = "Kulturno dobro 1";
	public static final String CULTURAL_SITE_NAME_2 = "Kulturno dobro 2";
	public static final String CULTURAL_SITE_NAME_3 = "Kulturno dobro 3";
	public static final String CULTURAL_SITE_ADDRESS_1 = "Adresa 1";
	public static final String CULTURAL_SITE_ADDRESS_2 = "Adresa 2";
	public static final String CULTURAL_SITE_ADDRESS_3 = "Adresa 3";
	public static final String CULTURAL_SITE_CITY_1 = "Grad 1";
	public static final String CULTURAL_SITE_CITY_2 = "Grad 2";
	public static final String CULTURAL_SITE_CITY_3 = "Grad 3";
	public static final CulturalSite CULTURAL_SITE_1 = 
			new CulturalSite(CULTURAL_SITE_NAME_1, CULTURAL_SITE_ADDRESS_1, CULTURAL_SITE_CITY_1, TYPE, CATEGORY);
	public static final CulturalSite CULTURAL_SITE_2 = 
			new CulturalSite(CULTURAL_SITE_NAME_2, CULTURAL_SITE_ADDRESS_2, CULTURAL_SITE_CITY_2, TYPE, CATEGORY);
	public static final CulturalSite CULTURAL_SITE_3 = 
			new CulturalSite(CULTURAL_SITE_NAME_3, CULTURAL_SITE_ADDRESS_3, CULTURAL_SITE_CITY_3, TYPE, CATEGORY);

	// new
	public static final String NEW_CULTURAL_SITE_NAME = "Novo kulturno dobro";
	public static final String NEW_CULTURAL_SITE_ADDRESS = "Nova adresa";
	public static final String NEW_CULTURAL_SITE_CITY = "Grad";
	public static final double NEW_CULTURAL_SITE_LAT = 44.7556269;
	public static final double NEW_CULTURAL_SITE_LNG = 19.6923025;
	public static final String NEW_CULTURAL_SITE_DESC = null;
	public static CulturalSite NEW_CULTURAL_SITE = 
			new CulturalSite(NEW_CULTURAL_SITE_NAME, NEW_CULTURAL_SITE_LAT, NEW_CULTURAL_SITE_LNG, 
					NEW_CULTURAL_SITE_ADDRESS, NEW_CULTURAL_SITE_CITY, NEW_CULTURAL_SITE_DESC);
	// saved
	public static final Long SAVED_CULTURAL_SITE_ID = 5L;
	public static CulturalSite SAVED_CULTURAL_SITE = 
			new CulturalSite(NEW_CULTURAL_SITE_NAME, NEW_CULTURAL_SITE_LAT, NEW_CULTURAL_SITE_LNG, 
					NEW_CULTURAL_SITE_ADDRESS, NEW_CULTURAL_SITE_CITY, NEW_CULTURAL_SITE_DESC);

	// updated
	public static final String UPDATED_CULTURAL_SITE_NAME = "Izmenjeno kulturno dobro";
	public static CulturalSite UPDATED_CULTURAL_SITE_VALID = 
			new CulturalSite(UPDATED_CULTURAL_SITE_NAME, NEW_CULTURAL_SITE_LAT, NEW_CULTURAL_SITE_LNG, 
					NEW_CULTURAL_SITE_ADDRESS, NEW_CULTURAL_SITE_CITY, NEW_CULTURAL_SITE_DESC);

	// rating
	public static final int RATING_VALUE_1 = 5;
	public static final int RATING_VALUE_2 = 3;
	public static final Rating RATING_1 = new Rating(RATING_VALUE_1);
	public static final Rating RATING_2 = new Rating(RATING_VALUE_2);
	
	public static final double NEW_RATING = 4;
	public static CulturalSite RATING_CULTURAL_SITE = 
			new CulturalSite(NEW_CULTURAL_SITE_NAME, NEW_CULTURAL_SITE_LAT, NEW_CULTURAL_SITE_LNG, 
					NEW_CULTURAL_SITE_ADDRESS, NEW_CULTURAL_SITE_CITY, NEW_CULTURAL_SITE_DESC);

	// filter
	public static final String categoryName = ""; // -> Kategorija
	public static final String typeName = ""; // -> Tip kategorije
	public static final String name = "dobro"; // -> Kulturno dobro 1, Kulturno dobro 2, Kulturno dobro 3
	public static final String city = "1"; // -> Grad 1
	
	
	// integration tests
	public static final int DB_TOTAL_SITES_NUM = 7;
	public static final Integer DB_PAGEABLE_PAGE = 0;
	public static final Integer DB_PAGEABLE_SIZE = 5;
	public static final int DB_PAGEABLE_NUM = 5;
	
	public static final Long DB_ID = 1L;
	public static final String DB_NAME = "Biblioteka šabačka";
	public static final Long DB_CATEGORY_ID = 1L;
	public static final Long DB_TYPE_ID = 1L;
	public static final Long DB_INCOMPATIBLE_TYPE_ID = 3L;
	
	// update
	public static final String UPDATE_CULTURAL_SITE_NAME = "Izmenjeno kulturno dobro";
	public static final String UPDATE_CULTURAL_SITE_ADDRESS = "Izmenjena adresa";
	public static final String UPDATE_CULTURAL_SITE_CITY = "Izmenjen grad";
	public static final double UPDATE_CULTURAL_SITE_LAT = 55;
	public static final double UPDATE_CULTURAL_SITE_LNG = 5;
	public static final String UPDATE_CULTURAL_SITE_DESC = "Izmenjen opis";
	public static final Long UPDATE_CATEGORY_ID = 3L;
	public static final Long UPDATE_TYPE_ID = 5L;
	
	// filter DB
	public static final String DB_FILTER_CATEGORY_NAME = "cija"; // -> Manifestacija, Institucija
	public static final String DB_FILTER_TYPE_NAME = "a"; // -> Biblioteka, Festival, Sajam
	public static final String DB_FILTER_SITE_NAME = "sajam"; // -> Beogradski sajam knjiga, Beogradski sajam automobila
	public static final String DB_FILTER_CITY_NAME = "grad"; // -> Beograd
	public static final int DB_FILTER_NUM = 2;
	
	// update rating
	public static final int NEW_RATING_VALUE = 5;
	
	// find all cities
	public static final int DB_CITY_NUM = 3;

	
	// controller
	public static final String CATEGORY_NAME_CON = "Manifestacija";
	public static final String TYPE_NAME_CON = "Sajam";
	public static final String CITE_NAME = "sajam";
	public static final String LOCATION = "Šabac";
	public static final String NO_LOCATION = "Gornji Milanovac";
	
	public static final long CITES_NUM = 7;
	public static final long FILTER_SAJAM_NUM = 2;
	public static final long FILTER_SABAC_NUM = 3;
	public static final long FILTER_NUM = 2;
	public static final long FILTER_NO_NUM = 0;
	
	public static final String ADMIN_USERNAME = "admin@admin.com";
	public static final String ADMIN_PASSWORD = "admin";
	public static final Long USER_ID = 3L;
	public static final String USER_USERNAME = "drugi@user.com";
	public static final String USER_PASSWORD = "user";
	public static final String USER2_USERNAME = "prvi@user.com";
	public static final String USER2_PASSWORD = "user";
	
	// new
	public static final Long NEW_CATEGORY_ID = 1L;
	public static final Long NEW_TYPE_ID = 1L;
	
	public static final Long CULTURAL_SITE_ID = 2L;
	public static final Long CULTURAL_SITE_UPDATE_ID = 3L;
	
	// delete
	public static final Long DELETE_CATEGORY_ID = 1L;
	public static final Long DELETE_TYPE_ID = 1L;
	public static final String DELETE_CULTURAL_SITE_NAME = "Novo kulturno dobro";
	public static final String DELETE_CULTURAL_SITE_ADDRESS = "Nova adresa";
	public static final String DELETE_CULTURAL_SITE_CITY = "Novi grad";
	public static final double DELETE_CULTURAL_SITE_LAT = 44.7556269;
	public static final double DELETE_CULTURAL_SITE_LNG = 19.6923025;
	public static final String DELETE_CULTURAL_SITE_DESC = "Opis";
	
	// comments
	public static final long NUM_OF_COMMENTS = 1; //jedan nije approved
	public static final long NUM_OF_FALSE_COMMENTS = 2; //svi
	public static final String NEW_COMMENT = "Neki novi komentar";
	
	// news
	public static final Long CULTURAL_SITE_ID2 = 1L;
	public static final long NUM_OF_NEWS = 2;
	public static final String NEW_NEWS = "Neke nove informacije";
	
	public static final long NUM_OF_SUBSCRIBED = 3;
}
