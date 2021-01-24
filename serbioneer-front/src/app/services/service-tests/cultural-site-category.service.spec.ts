import { HttpClient } from "@angular/common/http";
import { HttpClientTestingModule, HttpTestingController } from "@angular/common/http/testing";
import { fakeAsync, getTestBed, TestBed, tick } from "@angular/core/testing";
import { CulturalCategoryType } from "src/app/model/cultural-category-type.model";
import { CulturalSiteCategory } from "src/app/model/cultural-site-category.model";
import { environment } from "src/environments/environment";
import { CulturalCategoryTypeData, CulturalSiteCategoryData, CulturalSiteCategoryService } from "../cultural-site-category.service";

describe('Cultural site category service', () => {
    let injector;
    let culturalSiteCategoryService: CulturalSiteCategoryService;
    let httpMock: HttpTestingController;
    let httpClient: HttpClient;

    beforeEach(() => {
        TestBed.configureTestingModule({
            imports: [HttpClientTestingModule],
            providers: [CulturalSiteCategoryService]
        })

        injector = getTestBed();
        culturalSiteCategoryService = TestBed.inject(CulturalSiteCategoryService);
        httpClient = TestBed.inject(HttpClient);
        httpMock = TestBed.inject(HttpTestingController);
    })

    afterEach(() => {
        httpMock.verify();
    })

    it('should be created', () => {
        expect(culturalSiteCategoryService).toBeTruthy();
    })

    it('should get all cultural site categories', fakeAsync(() => {
        let mockCulturalSiteCategories: CulturalSiteCategory[] =
            [
                {
                    id: 1,
                    name: 'Institucija'
                },
                {
                    id: 2,
                    name: 'Manifestacija'
                }
            ];
        
        let response: CulturalSiteCategory[] = [];

        culturalSiteCategoryService.getAllCulturalSiteCategorys().subscribe(
            data => {
                response = data;
            }
        )

        const req = httpMock.expectOne('http://localhost:8080/api/cultural-site-category');
        expect(req.request.method).toBe('GET');
        req.flush(mockCulturalSiteCategories);

        tick();

        expect(response.length).toEqual(2);
        expect(response[0].id).toEqual(1);
        expect(response[0].name).toEqual('Institucija');
        expect(response[1].id).toEqual(2);
        expect(response[1].name).toEqual('Manifestacija');
    }))

    it('should get all cultural site categories paged', fakeAsync(() => {
        let categories: CulturalSiteCategory[] =
            [
                {
                    id: 1,
                    name: 'Institucija'
                },
                {
                    id: 2,
                    name: 'Manifestacija'
                }
            ];
        
        let mockCategoriesData: CulturalSiteCategoryData = {
            content: categories,
            totalPages: 1,
            totalElements: 2,
            size: 2
        }

        let response: CulturalSiteCategoryData = {
            content: [],
            totalPages: 0,
            totalElements: 0,
            size: 0
        };

        culturalSiteCategoryService.getAllByPage(0, 2).subscribe(
            data => {
                response = data;
            }
        )

        const req = httpMock.expectOne('http://localhost:8080/api/cultural-site-category/by-page?page=0&size=2');
        expect(req.request.method).toBe('GET');
        req.flush(mockCategoriesData);

        tick();

        expect(response.content.length).toEqual(2);
        expect(response.totalPages).toEqual(1);
        expect(response.totalElements).toEqual(2);
        expect(response.size).toEqual(2);
        expect(response.content[0].id).toEqual(1);
        expect(response.content[0].name).toEqual('Institucija');
        expect(response.content[1].id).toEqual(2);
        expect(response.content[1].name).toEqual('Manifestacija');
    }))

    it('should get all category types for category given by id', fakeAsync(() => {
        let mockTypes: CulturalCategoryType[] =
            [
                {
                    id: 1,
                    name: 'Biblioteka'
                },
                {
                    id: 2,
                    name: 'Pozoriste'
                }
            ];

        let response: CulturalCategoryType[] = [];

        culturalSiteCategoryService.getAllCategoryTypes(1).subscribe(
            data => {
                response = data;
            }
        )

        const req = httpMock.expectOne('http://localhost:8080/api/cultural-site-category/1/type');
        expect(req.request.method).toBe('GET');
        req.flush(mockTypes);

        tick();

        expect(response.length).toEqual(2);
        expect(response[0].id).toEqual(1);
        expect(response[0].name).toEqual('Biblioteka');
        expect(response[1].id).toEqual(2);
        expect(response[1].name).toEqual('Pozoriste');
    }))

    it('should get paged category types for category given by id', fakeAsync(() => {
        let types: CulturalCategoryType[] =
            [
                {
                    id: 1,
                    name: 'Biblioteka'
                },
                {
                    id: 2,
                    name: 'Pozoriste'
                }
            ];
        
        let mockCategoriesData: CulturalCategoryTypeData = {
            content: types,
            totalPages: 1,
            totalElements: 2,
            size: 2
        }

        let response: CulturalCategoryTypeData = {
            content: [],
            totalPages: 0,
            totalElements: 0,
            size: 0
        };

        culturalSiteCategoryService.getAllCategoryTypesByPage(1, 0, 2).subscribe(
            data => {
                response = data;
            }
        )

        const req = httpMock.expectOne('http://localhost:8080/api/cultural-site-category/1/type/by-page?page=0&size=2');
        expect(req.request.method).toBe('GET');
        req.flush(mockCategoriesData);

        tick();

        expect(response.content.length).toEqual(2);
        expect(response.totalPages).toEqual(1);
        expect(response.totalElements).toEqual(2);
        expect(response.size).toEqual(2);
        expect(response.content[0].id).toEqual(1);
        expect(response.content[0].name).toEqual('Biblioteka');
        expect(response.content[1].id).toEqual(2);
        expect(response.content[1].name).toEqual('Pozoriste');
    }))

    it('should create cultural site category', fakeAsync(() => {
        let culturalSiteCategory: CulturalSiteCategory = 
            new CulturalSiteCategory('Nova kateogrija');
        
        let mockCulturalSiteCategory: CulturalSiteCategory = 
        {
            id: 1,
            name: 'Nova kateogrija'
        };

        let response: CulturalSiteCategory = 
        {
            id: 0,
            name: ''
        };

        culturalSiteCategoryService.createCulturalSiteCategory(culturalSiteCategory)
            .subscribe(
                (data: CulturalSiteCategory) => {
                    response = data;
                }
            )
        
        const req = httpMock.expectOne('http://localhost:8080/api/cultural-site-category');
        expect(req.request.method).toBe('POST');
        req.flush(mockCulturalSiteCategory);

        tick();

        expect(response.id).toEqual(1);
        expect(response.name).toEqual('Nova kateogrija');
    }))

    it('should create cultural category type for category given by id', fakeAsync(() => {
        let culturalCategoryType: CulturalCategoryType = 
            new CulturalCategoryType('Novi tip');
        
        let mockCulturalCategoryType: CulturalCategoryType = 
        {
            id: 1,
            name: 'Novi tip'
        };

        let response: CulturalCategoryType = 
        {
            id: 0,
            name: ''
        };

        culturalSiteCategoryService.createCulturalCategoryType(1, culturalCategoryType)
            .subscribe(
                (data: CulturalCategoryType) => {
                    response = data;
                }
            )
        
        const req = httpMock.expectOne('http://localhost:8080/api/cultural-site-category/1/type');
        expect(req.request.method).toBe('POST');
        req.flush(mockCulturalCategoryType);

        tick();

        expect(response.id).toEqual(1);
        expect(response.name).toEqual('Novi tip');
    }))

    it('should delete cultural site category', fakeAsync(()=> {
    
        culturalSiteCategoryService.deleteCulturalSiteCategory(1).subscribe(data => {
            let response = data;
        })
 
        const req = httpMock.expectOne('http://localhost:8080/api/cultural-site-category/1');
        expect(req.request.method).toBe('DELETE');
        req.flush({});
 
        tick();
    }))

    it('should delete cultural category type', fakeAsync(()=> {
    
        culturalSiteCategoryService.deleteCulturalSiteType(1).subscribe(data => {
            let response = data;
        })
 
        const req = httpMock.expectOne('http://localhost:8080/api/cultural-site-category/type/1');
        expect(req.request.method).toBe('DELETE');
        req.flush({});
 
        tick();
    }))

    it('should update cultural site category', fakeAsync(() => {
        let updatedCulturalSiteCategory: CulturalSiteCategory = 
        {
            id: 1,
            name: 'Izmenjena kategorija'
        }
        
        let mockCulturalSiteCategory: CulturalSiteCategory = 
        {
            id: 1,
            name: 'Izmenjena kategorija'
        };

        let response: CulturalSiteCategory = 
        {
            id: 0,
            name: ''
        };

        culturalSiteCategoryService.updateCulturalSiteCategory(1, updatedCulturalSiteCategory)
            .subscribe(
                (data: CulturalSiteCategory) => {
                    response = data;
                }
            )
        
        const req = httpMock.expectOne('http://localhost:8080/api/cultural-site-category/1');
        expect(req.request.method).toBe('PUT');
        req.flush(mockCulturalSiteCategory);

        tick();

        expect(response.id).toEqual(1);
        expect(response.name).toEqual('Izmenjena kategorija');
    }))

    it('should update cultural category type', fakeAsync(() => {
        let updatedCulturalCategoryType: CulturalCategoryType = 
        {
            id: 1,
            name: 'Izmenjeni tip'
        }
        
        let mockCulturalCategoryType: CulturalCategoryType = 
        {
            id: 1,
            name: 'Izmenjeni tip'
        };

        let response: CulturalCategoryType = 
        {
            id: 0,
            name: ''
        };

        culturalSiteCategoryService.updateCulturalCategoryType(1, updatedCulturalCategoryType)
            .subscribe(
                (data: CulturalCategoryType) => {
                    response = data;
                }
            )
        
        const req = httpMock.expectOne('http://localhost:8080/api/cultural-site-category/type/1');
        expect(req.request.method).toBe('PUT');
        req.flush(mockCulturalCategoryType);

        tick();

        expect(response.id).toEqual(1);
        expect(response.name).toEqual('Izmenjeni tip');
    }))
})