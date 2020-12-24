package com.kts.nvt.serbioneer.constants;

import com.kts.nvt.serbioneer.model.CulturalSiteCategory;

public class CulturalSiteCategoryConstants {

	public static final String UNIQUE_CATEGORY_NAME = "Nepostojeca kategorija";
	public static final String NEW_CATEGORY_NAME = "Nova kategorija";
	public static final String UPDATED_CATEGORY_NAME = "Promenjena kategorija";
	public static final String DB_CATEGORY_NAME = "Institucija";
	public static final Long DB_CATEGORY_ID = 1L;
	
	public static final long TOTAL_ELEMENTS = 1;
	
	public static final long PAGEABLE_TOTAL_ELEMENTS = 1;
	public static final Integer PAGEABLE_PAGE = 0;
	public static final Integer PAGEABLE_SIZE = 2;
	
	public static final Long CATEGORY_ID = 25L;
	public static final Long INVALID_ID = -1L;
	public static final Long CATEGORY_WITH_SITES_ID = 26L;
	
	public static final Long SAVED_CATEGORY_ID_1 = 27L;
	public static final Long SAVED_CATEGORY_ID_2 = 28L;
	public static final CulturalSiteCategory EXISTING_CATEGORY = new CulturalSiteCategory(NEW_CATEGORY_NAME);
	public static final CulturalSiteCategory UNIQUE_CATEGORY = new CulturalSiteCategory(UNIQUE_CATEGORY_NAME);
	public static final CulturalSiteCategory UPDATED_CATEGORY_INVALID = new CulturalSiteCategory(NEW_CATEGORY_NAME);
	public static CulturalSiteCategory UPDATED_CATEGORY_VALID = new CulturalSiteCategory(UPDATED_CATEGORY_NAME);
	public static CulturalSiteCategory UPDATED_CATEGORY_SAME_NAME = new CulturalSiteCategory(UNIQUE_CATEGORY_NAME);
	public static CulturalSiteCategory SAVED_CATEGORY_1 = new CulturalSiteCategory(UNIQUE_CATEGORY_NAME);
	public static CulturalSiteCategory SAVED_CATEGORY_2 = new CulturalSiteCategory(UNIQUE_CATEGORY_NAME);
	public static CulturalSiteCategory CATEGORY_WITH_SITES = new CulturalSiteCategory(UNIQUE_CATEGORY_NAME);

	// integration testing
	public static final int DB_COUNT = 3;
	public static final Integer DB_PAGEABLE_PAGE = 1;
	public static final Integer DB_PAGEABLE_SIZE = 2;
	public static final long DB_PAGEABLE_NUM = 1;
	
	public static final String DB_NAME = "Institucija";
	public static final Long DB_ID = 1L;
	public static final Long DB_ID_REFERENCED = DB_ID;
	
	public static final String DB_NAME_EXISTING = "Manifestacija";
}
