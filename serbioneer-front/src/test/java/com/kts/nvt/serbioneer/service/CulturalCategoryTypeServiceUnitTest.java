package com.kts.nvt.serbioneer.service;

import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.CATEGORY;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.CATEGORY_ID;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.CATEGORY_TYPE_1;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.CATEGORY_TYPE_1_ID;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.CATEGORY_TYPE_2;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.INVALID_ID;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.NEW_CATEGORY_TYPE_NAME_1;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.NEW_TYPE;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.PAGEABLE_PAGE;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.PAGEABLE_SIZE;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.PAGEABLE_TOTAL_ELEMENTS;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.SAVED_TYPE;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.SAVED_TYPE_ID;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.TYPE_WITH_SITES;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.TYPE_WITH_SITES_ID;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.UNIQUE_TYPE_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.UPDATED_TYPE_INVALID;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.UPDATED_TYPE_SAME_NAME;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.UPDATED_TYPE_VALID;
import static com.kts.nvt.serbioneer.constants.CulturalCategoryTypeConstants.UPDATED_TYPE_VALID_NAME;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;
import static org.mockito.BDDMockito.given;
import static org.mockito.Mockito.doNothing;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

import com.kts.nvt.serbioneer.helper.exception.ExistentFieldValueException;
import com.kts.nvt.serbioneer.helper.exception.ForeignKeyException;
import com.kts.nvt.serbioneer.helper.exception.NonexistentIdException;
import com.kts.nvt.serbioneer.model.CulturalCategoryType;
import com.kts.nvt.serbioneer.model.CulturalSite;
import com.kts.nvt.serbioneer.repository.CulturalCategoryTypeRepository;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment=SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource("classpath:test.properties")
public class CulturalCategoryTypeServiceUnitTest {

	@Autowired
	private CulturalCategoryTypeService culturalCategoryTypeService;
	
	@MockBean
	private CulturalCategoryTypeRepository culturalCategoryTypeRepository;
	
	@MockBean
	private CulturalSiteCategoryService culturalSiteCategoryService;
	
	@Before
	public void setUp() {
		// setup category and types
		CATEGORY.setId(CATEGORY_ID);
		CATEGORY_TYPE_1.setId(CATEGORY_TYPE_1_ID);
		CATEGORY.addCulturalCategoryType(CATEGORY_TYPE_1);
		SAVED_TYPE.setId(SAVED_TYPE_ID);
		TYPE_WITH_SITES.setId(TYPE_WITH_SITES_ID);
		CulturalSite site = new CulturalSite();
		TYPE_WITH_SITES.addCulturalSite(site);
		
		// find all for given category id
		List<CulturalCategoryType> categoryTypes = new ArrayList<>();
		categoryTypes.add(CATEGORY_TYPE_1);
		categoryTypes.add(CATEGORY_TYPE_2);
		given(culturalCategoryTypeRepository.findAllByCulturalSiteCategoryId(CATEGORY_ID)).willReturn(categoryTypes);
		given(culturalCategoryTypeRepository.findAllByCulturalSiteCategoryId(INVALID_ID)).willReturn(null);
		
		// find all
		given(culturalCategoryTypeRepository.findAll()).willReturn(categoryTypes);
		
		// find all pageable
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalCategoryType> typesPage = new PageImpl<>(categoryTypes, pageable, PAGEABLE_TOTAL_ELEMENTS);
		given(culturalCategoryTypeRepository.findAll(pageable)).willReturn(typesPage);

		// find one by id -> valid
		given(culturalCategoryTypeRepository.findById(CATEGORY_TYPE_1_ID)).willReturn(Optional.of(CATEGORY_TYPE_1));
		// find one by id -> invalid
		given(culturalCategoryTypeRepository.findById(INVALID_ID)).willReturn(Optional.empty());
	
		// find one by id and category id
		given(culturalCategoryTypeRepository.findOneByIdAndCulturalSiteCategoryId(CATEGORY_TYPE_1_ID, CATEGORY_ID)).willReturn(CATEGORY_TYPE_1);
	
		// create -> find category by id
		given(culturalSiteCategoryService.findOneById(CATEGORY_ID)).willReturn(CATEGORY);
		given(culturalSiteCategoryService.findOneById(INVALID_ID)).willReturn(null);
		// create -> find type by name -> unique
		given(culturalCategoryTypeRepository.findOneByName(UNIQUE_TYPE_NAME)).willReturn(null);
		// create -> find type by name -> existing
		given(culturalCategoryTypeRepository.findOneByName(NEW_CATEGORY_TYPE_NAME_1)).willReturn(CATEGORY_TYPE_1);
		// create -> save
		given(culturalCategoryTypeRepository.save(NEW_TYPE)).willReturn(SAVED_TYPE);
	
		// delete -> find type by id
		given(culturalCategoryTypeRepository.findById(TYPE_WITH_SITES_ID)).willReturn(Optional.of(TYPE_WITH_SITES));
		// delete type
		doNothing().when(culturalCategoryTypeRepository).delete(CATEGORY_TYPE_1);
		
		// update type
		given(culturalCategoryTypeRepository.findById(SAVED_TYPE_ID)).willReturn(Optional.of(SAVED_TYPE));
		// find by name and id not
		// name and id do not match -> name not unique -> invalid update
		given(culturalCategoryTypeRepository.findOneByNameAndIdNot(NEW_CATEGORY_TYPE_NAME_1, SAVED_TYPE_ID)).willReturn(SAVED_TYPE);
		// name is unique -> valid update
		given(culturalCategoryTypeRepository.findOneByNameAndIdNot(UPDATED_TYPE_VALID_NAME, CATEGORY_TYPE_1_ID)).willReturn(null);
		// name is unchanged -> valid update
		given(culturalCategoryTypeRepository.findOneByNameAndIdNot(UNIQUE_TYPE_NAME, SAVED_TYPE_ID)).willReturn(null);
		// save updated type
		UPDATED_TYPE_VALID.setId(CATEGORY_TYPE_1_ID);
		UPDATED_TYPE_SAME_NAME.setId(SAVED_TYPE_ID);
		given(culturalCategoryTypeRepository.save(CATEGORY_TYPE_1)).willReturn(UPDATED_TYPE_VALID);
		given(culturalCategoryTypeRepository.save(SAVED_TYPE)).willReturn(UPDATED_TYPE_SAME_NAME);
	}
	
	@Test
	public void testFindAllLongSuccessful() throws Exception {
		List<CulturalCategoryType> categoryTypes = culturalCategoryTypeService.findAll(CATEGORY_ID);
		
		verify(culturalCategoryTypeRepository, times(1)).findAllByCulturalSiteCategoryId(CATEGORY_ID);
		assertEquals(2, categoryTypes.size());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testFindAllLongNotExistingId() throws Exception {
		List<CulturalCategoryType> categoryTypes = culturalCategoryTypeService.findAll(INVALID_ID);
		
		verify(culturalCategoryTypeRepository, times(1)).findAllByCulturalSiteCategoryId(INVALID_ID);
		assertNull(categoryTypes);
	}
	
	@Test
	public void testFindAll() {
		List<CulturalCategoryType> categoryTypes = culturalCategoryTypeService.findAll();
		
		verify(culturalCategoryTypeRepository, times(1)).findAll();
		assertEquals(2, categoryTypes.size());
	}

	@Test
	public void testFindAllPageable() {
		Pageable pageable = PageRequest.of(PAGEABLE_PAGE, PAGEABLE_SIZE);
		Page<CulturalCategoryType> typesPage = culturalCategoryTypeService.findAll(pageable);
		
		verify(culturalCategoryTypeRepository, times(1)).findAll(pageable);
		assertEquals(2, typesPage.getNumberOfElements());
	}

	@Test
	public void testFindOneByIdExistingId() {
		CulturalCategoryType categoryType = culturalCategoryTypeService.findOneById(CATEGORY_TYPE_1_ID);
		
		verify(culturalCategoryTypeRepository, times(1)).findById(CATEGORY_TYPE_1_ID);
		assertEquals(CATEGORY_TYPE_1_ID, categoryType.getId());
	}
	
	@Test
	public void testFindOneByIdNotExistingId() {
		CulturalCategoryType categoryType = culturalCategoryTypeService.findOneById(INVALID_ID);
		
		verify(culturalCategoryTypeRepository, times(1)).findById(INVALID_ID);
		assertNull(categoryType);
	}
	
	@Test
	public void testFindOneByIdAndCategoryId() {
		CulturalCategoryType categoryType = culturalCategoryTypeService.findOneByIdAndCategoryId(CATEGORY_TYPE_1_ID, CATEGORY_ID);
	
		verify(culturalCategoryTypeRepository, times(1)).findOneByIdAndCulturalSiteCategoryId(CATEGORY_TYPE_1_ID, CATEGORY_ID);
		assertEquals(CATEGORY_ID, categoryType.getCulturalSiteCategory().getId());
	}

	@Test
	public void testCreateSuccesful() throws Exception {
		CulturalCategoryType categoryType = culturalCategoryTypeService.create(CATEGORY_ID, NEW_TYPE);
		
		verify(culturalSiteCategoryService, times(1)).findOneById(CATEGORY_ID);
		verify(culturalCategoryTypeRepository, times(1)).findOneByName(UNIQUE_TYPE_NAME);
		verify(culturalCategoryTypeRepository, times(1)).save(NEW_TYPE);
		assertEquals(SAVED_TYPE_ID, categoryType.getId());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testCreateNotExistingCategoryId() throws Exception {
		CulturalCategoryType categoryType = culturalCategoryTypeService.create(INVALID_ID, NEW_TYPE);
		
		verify(culturalSiteCategoryService, times(1)).findOneById(INVALID_ID);
		verify(culturalCategoryTypeRepository, times(0)).findOneByName(UNIQUE_TYPE_NAME);
		verify(culturalCategoryTypeRepository, times(0)).save(NEW_TYPE);
		assertNull(categoryType);
	}
	
	@Test(expected = ExistentFieldValueException.class)
	public void testCreateWithExistingCategoryTypeName() throws Exception {
		CulturalCategoryType categoryType = culturalCategoryTypeService.create(CATEGORY_ID, CATEGORY_TYPE_1);
		
		verify(culturalSiteCategoryService, times(1)).findOneById(CATEGORY_ID);
		verify(culturalCategoryTypeRepository, times(1)).findOneByName(NEW_CATEGORY_TYPE_NAME_1);
		verify(culturalCategoryTypeRepository, times(0)).save(CATEGORY_TYPE_1);
		assertNull(categoryType);
	}

	@Test
	public void testDeleteSuccesful() throws Exception {
		culturalCategoryTypeService.delete(CATEGORY_TYPE_1_ID);
		
		verify(culturalCategoryTypeRepository, times(1)).findById(CATEGORY_TYPE_1_ID);
		verify(culturalCategoryTypeRepository, times(1)).delete(CATEGORY_TYPE_1);
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testDeleteNotExistingTypeId() throws Exception {
		culturalCategoryTypeService.delete(INVALID_ID);
		
		verify(culturalCategoryTypeRepository, times(1)).findById(INVALID_ID);
		verify(culturalCategoryTypeRepository, times(0)).delete(CATEGORY_TYPE_1);
	}
	
	@Test(expected = ForeignKeyException.class)
	public void testDeleteTypeWithCulturalSites() throws Exception {
		culturalCategoryTypeService.delete(TYPE_WITH_SITES_ID);
		
		verify(culturalCategoryTypeRepository, times(1)).findById(TYPE_WITH_SITES_ID);
		verify(culturalCategoryTypeRepository, times(0)).delete(TYPE_WITH_SITES);
	}

	@Test
	public void testUpdateSuccesful() throws Exception {
		CulturalCategoryType updatedType = culturalCategoryTypeService.update(UPDATED_TYPE_VALID, CATEGORY_TYPE_1_ID);
	
		verify(culturalCategoryTypeRepository, times(1)).findById(CATEGORY_TYPE_1_ID);
		verify(culturalCategoryTypeRepository, times(1)).findOneByNameAndIdNot(UPDATED_TYPE_VALID_NAME, CATEGORY_TYPE_1_ID);
		verify(culturalCategoryTypeRepository, times(1)).save(CATEGORY_TYPE_1);
		assertEquals(UPDATED_TYPE_VALID_NAME, updatedType.getName());
	}
	
	@Test
	public void testUpdateSuccesfulUnchangedName() throws Exception {
		CulturalCategoryType updatedType = culturalCategoryTypeService.update(UPDATED_TYPE_SAME_NAME, SAVED_TYPE_ID);

		verify(culturalCategoryTypeRepository, times(1)).findById(SAVED_TYPE_ID);
		verify(culturalCategoryTypeRepository, times(1)).findOneByNameAndIdNot(UNIQUE_TYPE_NAME, SAVED_TYPE_ID);
		verify(culturalCategoryTypeRepository, times(1)).save(SAVED_TYPE);
		assertEquals(UNIQUE_TYPE_NAME, updatedType.getName());
	}
	
	@Test(expected = NonexistentIdException.class)
	public void testUpdateNotExistingTypeId() throws Exception {
		CulturalCategoryType updatedType = culturalCategoryTypeService.update(UPDATED_TYPE_VALID, INVALID_ID);

		verify(culturalCategoryTypeRepository, times(1)).findById(INVALID_ID);
		verify(culturalCategoryTypeRepository, times(0)).findOneByNameAndIdNot(UPDATED_TYPE_VALID_NAME, INVALID_ID);
		verify(culturalCategoryTypeRepository, times(0)).save(CATEGORY_TYPE_1);
		assertNull(updatedType);
	}
	
	@Test(expected = ExistentFieldValueException.class)
	public void testUpdateWithExistingTypeName() throws Exception {
		CulturalCategoryType updatedType = culturalCategoryTypeService.update(UPDATED_TYPE_INVALID, SAVED_TYPE_ID);

		verify(culturalCategoryTypeRepository, times(1)).findById(SAVED_TYPE_ID);
		verify(culturalCategoryTypeRepository, times(1)).findOneByNameAndIdNot(NEW_CATEGORY_TYPE_NAME_1, SAVED_TYPE_ID);
		verify(culturalCategoryTypeRepository, times(0)).save(SAVED_TYPE);
		assertNull(updatedType);
	}

}
