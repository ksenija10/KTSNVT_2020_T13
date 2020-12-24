package com.kts.nvt.serbioneer.constants;

import com.kts.nvt.serbioneer.model.CulturalCategoryType;
import com.kts.nvt.serbioneer.model.CulturalSiteCategory;

public class CulturalCategoryTypeConstants {

	public static final String NEW_CATEGORY_TYPE_NAME_1 = "Tip kategorije 1";
	public static final String NEW_CATEGORY_TYPE_NAME_2 = "Tip kategorije 2";
	public static final Long DB_CATEGORY_TYPE_ID = 1L;
	
	// service
	public static final Long INVALID_ID = -1L;
	public static final Long CATEGORY_TYPE_1_ID = 1L;
	public static CulturalCategoryType CATEGORY_TYPE_1 = new CulturalCategoryType(NEW_CATEGORY_TYPE_NAME_1);
	public static final CulturalCategoryType CATEGORY_TYPE_2 = new CulturalCategoryType(NEW_CATEGORY_TYPE_NAME_2);
	
	public static final long PAGEABLE_TOTAL_ELEMENTS = 2;
	public static final Integer PAGEABLE_PAGE = 0;
	public static final Integer PAGEABLE_SIZE = 2;

	// category which holds category types
	public static final Long CATEGORY_ID = 10L;
	public static final String CATEGORY_NAME = "Kategorija 1";
	public static CulturalSiteCategory CATEGORY = new CulturalSiteCategory(CATEGORY_NAME);

	// create new type
	public static final Long SAVED_TYPE_ID = 11L;
	public static final String UNIQUE_TYPE_NAME = "Jedinstveni tip";
	public static CulturalCategoryType NEW_TYPE = new CulturalCategoryType(UNIQUE_TYPE_NAME);
	public static CulturalCategoryType SAVED_TYPE = new CulturalCategoryType(UNIQUE_TYPE_NAME);

	// delete type with cultural sites
	public static final Long TYPE_WITH_SITES_ID = 12L;
	public static CulturalCategoryType TYPE_WITH_SITES = new CulturalCategoryType(UNIQUE_TYPE_NAME);

	// update existing types
	public static final String UPDATED_TYPE_VALID_NAME = "Izmenjeni tip";
	public static CulturalCategoryType UPDATED_TYPE_VALID = new CulturalCategoryType(UPDATED_TYPE_VALID_NAME);
	public static CulturalCategoryType UPDATED_TYPE_SAME_NAME = new CulturalCategoryType(UNIQUE_TYPE_NAME);
	public static final CulturalCategoryType UPDATED_TYPE_INVALID = new CulturalCategoryType(NEW_CATEGORY_TYPE_NAME_1);

	// integration tests
	public static final Long DB_CATEGORY_ID = 1L;
	public static final Long DB_CATEGORY_ID_2 = 2L;
	public static final int DB_CATEGORY_ID_TYPE_NUM = 2;
	public static final Integer DB_PAGEABLE_PAGE = 0;
	public static final Integer DB_PAGEABLE_SIZE = 3;
	public static final int DB_PAGEABLE_NUM = 3;
	
	public static final Long DB_ID = 1L;
	public static final String DB_NAME = "Biblioteka";
	
	// create
	public static final String NEW_CATEGORY_TYPE_NAME = "Nova kategorija";
	// update
	public static final String UPDATED_CATEGORY_TYPE_NAME = "Izmenjena kategorija";
	public static final String DB_EXISTING_NAME = "Spomenik";
	
}
