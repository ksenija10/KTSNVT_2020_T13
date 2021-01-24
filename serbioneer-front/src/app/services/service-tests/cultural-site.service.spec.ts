import { HttpClient } from "@angular/common/http";
import { HttpClientTestingModule, HttpTestingController } from "@angular/common/http/testing";
import { fakeAsync, getTestBed, TestBed, tick } from "@angular/core/testing";
import { filter } from "rxjs/operators";
import { Comment } from "src/app/model/comment.model";
import { CulturalSiteView, SubscribedCulturalSiteDTO } from "src/app/model/cultural-site.model";
import { FilterDTO } from "src/app/model/filter-cultural-site.model";
import { NewsDTO } from "src/app/model/news.model";
import { CommentData } from "../comment.service";
import { CommentDto, CulturalSiteData, CulturalSiteService, NewsData } from "../cultural-site.service";
import { NewsDto } from "../image.service";

describe('Cultural site service', ()=>{
    let injector;
    let culturalSiteService: CulturalSiteService;
    let httpMock: HttpTestingController;
    let httpClient: HttpClient;

    beforeEach(()=>{

        TestBed.configureTestingModule({
            imports: [HttpClientTestingModule],
            providers: [CulturalSiteService]
        })

        injector = getTestBed();
        culturalSiteService = TestBed.inject(CulturalSiteService);
        httpClient = TestBed.inject(HttpClient);
        httpMock = TestBed.inject(HttpTestingController);
    })

    afterEach(() => {
        httpMock.verify();
    })

    it('should be created', () => {
        expect(culturalSiteService).toBeTruthy();
    })

    it('should find all by page', fakeAsync( () => {
        let sites = [
            {
                id: 1,
                name: "CulturalSite1",
                categoryId: 1,
                category: "Category1",
                categoryTypeId: 1,
                categoryType: "CategoryType1",
                lat: 44.823028,
                lng: 20.447694,
                address: "Address1",
                city: "City1",
                description: "Description1",
                rating: 4.5
            },
            {
                id: 2,
                name: "CulturalSite2",
                categoryId: 1,
                category: "Category1",
                categoryTypeId: 2,
                categoryType: "CategoryType2",
                lat: 43.823028,
                lng: 21.447694,
                address: "Address2",
                city: "City2",
                description: "Description2",
                rating: 3.0
            }
        ]

        let mockSiteData : CulturalSiteData = {
            content : sites,
            totalPages: 1,
            totalElements : 2,
            size : 2
        }

        let response : CulturalSiteData = {
            content : [],
            totalPages: 0,
            totalElements : 0,
            size : 0
        }

        culturalSiteService.findAllByPage(0,2).subscribe(
            data => {
                response = data;
            }
        )
        
        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/by-page?page=0&size=2");
        expect(req.request.method).toBe('GET');
        req.flush(mockSiteData);

        tick();

        expect(response.content.length).toEqual(2);

        expect(response.content[0].id).toEqual(1);
        expect(response.content[0].name).toEqual("CulturalSite1");
        expect(response.content[0].categoryId).toEqual(1);
        expect(response.content[0].category).toEqual("Category1");
        expect(response.content[0].categoryTypeId).toEqual(1);
        expect(response.content[0].categoryType).toEqual("CategoryType1");
        expect(response.content[0].lat).toEqual(44.823028);
        expect(response.content[0].lng).toEqual(20.447694);
        expect(response.content[0].address).toEqual("Address1");
        expect(response.content[0].city).toEqual("City1");
        expect(response.content[0].description).toEqual("Description1");
        expect(response.content[0].rating).toEqual(4.5);

        expect(response.content[1].id).toEqual(2);
        expect(response.content[1].name).toEqual("CulturalSite2");
        expect(response.content[1].categoryId).toEqual(1);
        expect(response.content[1].category).toEqual("Category1");
        expect(response.content[1].categoryTypeId).toEqual(2);
        expect(response.content[1].categoryType).toEqual("CategoryType2");
        expect(response.content[1].lat).toEqual(43.823028);
        expect(response.content[1].lng).toEqual(21.447694);
        expect(response.content[1].address).toEqual("Address2");
        expect(response.content[1].city).toEqual("City2");
        expect(response.content[1].description).toEqual("Description2");
        expect(response.content[1].rating).toEqual(3.0);
    }))

    it('should find all subscribed by page', fakeAsync( () => {
        let sites = [
            {
                id: 1,
                name: "CulturalSite1",
                categoryId: 1,
                category: "Category1",
                categoryTypeId: 1,
                categoryType: "CategoryType1",
                lat: 44.823028,
                lng: 20.447694,
                address: "Address1",
                city: "City1",
                description: "Description1",
                rating: 4.5
            }
        ]

        let mockSiteData : CulturalSiteData = {
            content : sites,
            totalPages: 1,
            totalElements : 1,
            size : 1
        }

        let response : CulturalSiteData = {
            content : [],
            totalPages: 0,
            totalElements : 0,
            size : 0
        }

        culturalSiteService.findAllSubscribedByPage(0,2, 'prvi@user.com').subscribe(
            data => {
                response = data;
            }
        )
        
        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/subscribed/by-page?page=0&size=2&userEmail=prvi@user.com");
        expect(req.request.method).toBe('GET');
        req.flush(mockSiteData);

        tick();

        expect(response.content.length).toEqual(1);

        expect(response.content[0].id).toEqual(1);
        expect(response.content[0].name).toEqual("CulturalSite1");
        expect(response.content[0].categoryId).toEqual(1);
        expect(response.content[0].category).toEqual("Category1");
        expect(response.content[0].categoryTypeId).toEqual(1);
        expect(response.content[0].categoryType).toEqual("CategoryType1");
        expect(response.content[0].lat).toEqual(44.823028);
        expect(response.content[0].lng).toEqual(20.447694);
        expect(response.content[0].address).toEqual("Address1");
        expect(response.content[0].city).toEqual("City1");
        expect(response.content[0].description).toEqual("Description1");
        expect(response.content[0].rating).toEqual(4.5);
    }))

    it('should filter by category name', fakeAsync( () => {
        let sites = [
            {
                id: 1,
                name: "CulturalSite1",
                categoryId: 1,
                category: "Category1",
                categoryTypeId: 1,
                categoryType: "CategoryType1",
                lat: 44.823028,
                lng: 20.447694,
                address: "Address1",
                city: "City1",
                description: "Description1",
                rating: 4.5
            },
            {
                id: 2,
                name: "CulturalSite2",
                categoryId: 1,
                category: "Category1",
                categoryTypeId: 2,
                categoryType: "CategoryType2",
                lat: 43.823028,
                lng: 21.447694,
                address: "Address2",
                city: "City2",
                description: "Description2",
                rating: 3.0
            }
        ]

        let mockSiteData : CulturalSiteData = {
            content : sites,
            totalPages: 1,
            totalElements : 2,
            size : 2
        }

        let response : CulturalSiteData = {
            content : [],
            totalPages: 0,
            totalElements : 0,
            size : 0
        }

        let filterDto : FilterDTO = {
            categoryNames : ["Category1"],
            culturalSiteName : "",
            location : ""
        }

        culturalSiteService.filterByPage(0,2, filterDto).subscribe(
            data => {
                response = data;
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/filter/by-page?page=0&size=2");
        expect(req.request.method).toBe('POST');
        req.flush(mockSiteData);

        tick();

        expect(response.content.length).toEqual(2);

        expect(response.content[0].id).toEqual(1);
        expect(response.content[0].name).toEqual("CulturalSite1");
        expect(response.content[0].categoryId).toEqual(1);
        expect(response.content[0].category).toEqual("Category1");
        expect(response.content[0].categoryTypeId).toEqual(1);
        expect(response.content[0].categoryType).toEqual("CategoryType1");
        expect(response.content[0].lat).toEqual(44.823028);
        expect(response.content[0].lng).toEqual(20.447694);
        expect(response.content[0].address).toEqual("Address1");
        expect(response.content[0].city).toEqual("City1");
        expect(response.content[0].description).toEqual("Description1");
        expect(response.content[0].rating).toEqual(4.5);

        expect(response.content[1].id).toEqual(2);
        expect(response.content[1].name).toEqual("CulturalSite2");
        expect(response.content[1].categoryId).toEqual(1);
        expect(response.content[1].category).toEqual("Category1");
        expect(response.content[1].categoryTypeId).toEqual(2);
        expect(response.content[1].categoryType).toEqual("CategoryType2");
        expect(response.content[1].lat).toEqual(43.823028);
        expect(response.content[1].lng).toEqual(21.447694);
        expect(response.content[1].address).toEqual("Address2");
        expect(response.content[1].city).toEqual("City2");
        expect(response.content[1].description).toEqual("Description2");
        expect(response.content[1].rating).toEqual(3.0);
    }))

    it('should filter by cultural site name', fakeAsync( () => {
        let sites = [
            {
                id: 1,
                name: "CulturalSite1",
                categoryId: 1,
                category: "Category1",
                categoryTypeId: 1,
                categoryType: "CategoryType1",
                lat: 44.823028,
                lng: 20.447694,
                address: "Address1",
                city: "City1",
                description: "Description1",
                rating: 4.5
            }
        ]

        let mockSiteData : CulturalSiteData = {
            content : sites,
            totalPages: 1,
            totalElements : 1,
            size : 2
        }

        let response : CulturalSiteData = {
            content : [],
            totalPages: 0,
            totalElements : 0,
            size : 0
        }

        let filterDto : FilterDTO = {
            categoryNames : [],
            culturalSiteName : "CulturalSite1",
            location : ""
        }

        culturalSiteService.filterByPage(0,2, filterDto).subscribe(
            data => {
                response = data;
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/filter/by-page?page=0&size=2");
        expect(req.request.method).toBe('POST');
        req.flush(mockSiteData);

        tick();

        expect(response.content.length).toEqual(1);

        expect(response.content[0].id).toEqual(1);
        expect(response.content[0].name).toEqual("CulturalSite1");
        expect(response.content[0].categoryId).toEqual(1);
        expect(response.content[0].category).toEqual("Category1");
        expect(response.content[0].categoryTypeId).toEqual(1);
        expect(response.content[0].categoryType).toEqual("CategoryType1");
        expect(response.content[0].lat).toEqual(44.823028);
        expect(response.content[0].lng).toEqual(20.447694);
        expect(response.content[0].address).toEqual("Address1");
        expect(response.content[0].city).toEqual("City1");
        expect(response.content[0].description).toEqual("Description1");
        expect(response.content[0].rating).toEqual(4.5);
    }))

    it('should filter by location', fakeAsync( () => {
        let sites = [
            {
                id: 2,
                name: "CulturalSite2",
                categoryId: 1,
                category: "Category1",
                categoryTypeId: 2,
                categoryType: "CategoryType2",
                lat: 43.823028,
                lng: 21.447694,
                address: "Address2",
                city: "City2",
                description: "Description2",
                rating: 3.0
            }
        ]

        let mockSiteData : CulturalSiteData = {
            content : sites,
            totalPages: 1,
            totalElements : 2,
            size : 2
        }

        let response : CulturalSiteData = {
            content : [],
            totalPages: 0,
            totalElements : 0,
            size : 0
        }

        let filterDto : FilterDTO = {
            categoryNames : [],
            culturalSiteName : "",
            location : "City2"
        }

        culturalSiteService.filterByPage(0,2, filterDto).subscribe(
            data => {
                response = data;
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/filter/by-page?page=0&size=2");
        expect(req.request.method).toBe('POST');
        req.flush(mockSiteData);

        tick();

        expect(response.content.length).toEqual(1);

        expect(response.content[0].id).toEqual(2);
        expect(response.content[0].name).toEqual("CulturalSite2");
        expect(response.content[0].categoryId).toEqual(1);
        expect(response.content[0].category).toEqual("Category1");
        expect(response.content[0].categoryTypeId).toEqual(2);
        expect(response.content[0].categoryType).toEqual("CategoryType2");
        expect(response.content[0].lat).toEqual(43.823028);
        expect(response.content[0].lng).toEqual(21.447694);
        expect(response.content[0].address).toEqual("Address2");
        expect(response.content[0].city).toEqual("City2");
        expect(response.content[0].description).toEqual("Description2");
        expect(response.content[0].rating).toEqual(3.0);
    }))

    it('should filter subscribed by cultural site name', fakeAsync( () => {
        let sites = [
            {
                id: 1,
                name: "CulturalSite1",
                categoryId: 1,
                category: "Category1",
                categoryTypeId: 1,
                categoryType: "CategoryType1",
                lat: 44.823028,
                lng: 20.447694,
                address: "Address1",
                city: "City1",
                description: "Description1",
                rating: 4.5
            }
        ]

        let mockSiteData : CulturalSiteData = {
            content : sites,
            totalPages: 1,
            totalElements : 1,
            size : 2
        }

        let response : CulturalSiteData = {
            content : [],
            totalPages: 0,
            totalElements : 0,
            size : 0
        }

        let filterDto : FilterDTO = {
            categoryNames : [],
            culturalSiteName : "CulturalSite1",
            location : ""
        }

        culturalSiteService.filterSubscribedByPage(0,2, "prvi@user.com", filterDto).subscribe(
            data => {
                response = data;
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/subscribed/filter/by-page?page=0&size=2&userEmail=prvi@user.com");
        expect(req.request.method).toBe('POST');
        req.flush(mockSiteData);

        tick();

        expect(response.content.length).toEqual(1);

        expect(response.content[0].id).toEqual(1);
        expect(response.content[0].name).toEqual("CulturalSite1");
        expect(response.content[0].categoryId).toEqual(1);
        expect(response.content[0].category).toEqual("Category1");
        expect(response.content[0].categoryTypeId).toEqual(1);
        expect(response.content[0].categoryType).toEqual("CategoryType1");
        expect(response.content[0].lat).toEqual(44.823028);
        expect(response.content[0].lng).toEqual(20.447694);
        expect(response.content[0].address).toEqual("Address1");
        expect(response.content[0].city).toEqual("City1");
        expect(response.content[0].description).toEqual("Description1");
        expect(response.content[0].rating).toEqual(4.5);
    }))

    it('should filter subscribed by location', fakeAsync( () => {
        let sites = [
            {
                id: 2,
                name: "CulturalSite2",
                categoryId: 1,
                category: "Category1",
                categoryTypeId: 2,
                categoryType: "CategoryType2",
                lat: 43.823028,
                lng: 21.447694,
                address: "Address2",
                city: "City2",
                description: "Description2",
                rating: 3.0
            }
        ]

        let mockSiteData : CulturalSiteData = {
            content : sites,
            totalPages: 1,
            totalElements : 2,
            size : 2
        }

        let response : CulturalSiteData = {
            content : [],
            totalPages: 0,
            totalElements : 0,
            size : 0
        }

        let filterDto : FilterDTO = {
            categoryNames : [],
            culturalSiteName : "",
            location : "City2"
        }

        culturalSiteService.filterSubscribedByPage(0,2, "prvi@user.com", filterDto).subscribe(
            data => {
                response = data;
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/subscribed/filter/by-page?page=0&size=2&userEmail=prvi@user.com");
        expect(req.request.method).toBe('POST');
        req.flush(mockSiteData);

        tick();

        expect(response.content.length).toEqual(1);

        expect(response.content[0].id).toEqual(2);
        expect(response.content[0].name).toEqual("CulturalSite2");
        expect(response.content[0].categoryId).toEqual(1);
        expect(response.content[0].category).toEqual("Category1");
        expect(response.content[0].categoryTypeId).toEqual(2);
        expect(response.content[0].categoryType).toEqual("CategoryType2");
        expect(response.content[0].lat).toEqual(43.823028);
        expect(response.content[0].lng).toEqual(21.447694);
        expect(response.content[0].address).toEqual("Address2");
        expect(response.content[0].city).toEqual("City2");
        expect(response.content[0].description).toEqual("Description2");
        expect(response.content[0].rating).toEqual(3.0);
    }))

    it('should find all locations', fakeAsync( () => {
        let mockLocations : string[] = [
            "City1",
            "City2",
            "City3"
        ]

        let response : string[] = []

        culturalSiteService.findAllLocations().subscribe(
            data => {
                response = data;
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/locations");
        expect(req.request.method).toBe('GET');
        req.flush(mockLocations);

        tick();

        expect(response.length).toEqual(3);

        expect(response[0]).toEqual("City1");
        expect(response[1]).toEqual("City2");
        expect(response[2]).toEqual("City3");
    }))

    it('should create news for cultural site', fakeAsync( () => {
        let news : NewsDTO = {
            information : "News about CulturalSite1",
            dateTime : new Date('January 18 1990'),
            culturalSiteName : "CulturalSite1",
            images : []
        }

        let mockNews : NewsDto = {
            id: 1,
            information : "News about CulturalSite1",
        }

        let response : NewsDto = {
            id: 0,
            information: ""
        }

        culturalSiteService.createNews(news, 1).subscribe(
            data => {
                response = data
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/1/news");
        expect(req.request.method).toBe('POST');
        req.flush(mockNews);

        tick();

        expect(response.id).toEqual(1);
        expect(response.information).toEqual("News about CulturalSite1");
    }))

    it('should get cultural site', fakeAsync( () => {
        let mockCulturalSite : CulturalSiteView = {
            id: 1,
            name: "CulturalSite1",
            categoryId: 1,
            category: "Category1",
            categoryTypeId: 1,
            categoryType: "CategoryType1",
            lat: 44.823028,
            lng: 20.447694,
            address: "Address1",
            city: "City1",
            description: "Description1",
            rating: 4.5,
            images: []
        }

        let response : CulturalSiteView = {
            id: 0,
            name: "",
            categoryId: 0,
            category: "",
            categoryTypeId: 0,
            categoryType: "",
            lat: 0,
            lng: 0,
            address: "",
            city: "",
            description: "",
            rating: 0,
            images: []
        }

        culturalSiteService.getCulturalSite(1).subscribe(
            data => {
                response = data
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/1");
        expect(req.request.method).toBe('GET');
        req.flush(mockCulturalSite);

        tick();

        expect(response.id).toEqual(1);
        expect(response.name).toEqual("CulturalSite1");
        expect(response.categoryId).toEqual(1);
        expect(response.category).toEqual("Category1");
        expect(response.categoryTypeId).toEqual(1);
        expect(response.categoryType).toEqual("CategoryType1");
        expect(response.lat).toEqual(44.823028);
        expect(response.lng).toEqual(20.447694);
        expect(response.address).toEqual("Address1");
        expect(response.city).toEqual("City1");
        expect(response.description).toEqual("Description1");
        expect(response.rating).toEqual(4.5);
        expect(response.images?.length).toEqual(0);
    }))

    it('should get all news for cultural site', fakeAsync( () => {
        let news: NewsDTO[] = [
            {
                information : "News1 about CulturalSite1",
                dateTime : new Date('January 18 1990'),
                culturalSiteName : "CulturalSite1",
                images : []
            },
            {
                information : "News2 about CulturalSite1",
                dateTime : new Date('January 19 1990'),
                culturalSiteName : "CulturalSite1",
                images : []
            }
        ]

        let mockNews : NewsData = {
            content: news,
            totalPages: 1,
            totalElements: 2,
            size: 2,
        }

        let response : NewsData = {
            content: [],
            totalPages: 0,
            totalElements: 0,
            size: 0,
        }

        culturalSiteService.getAllCulturalSiteNews(1, 0, 2).subscribe(
            data => {
                response = data
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/1/news/by-page?page=0&size=2");
        expect(req.request.method).toBe('GET');
        req.flush(mockNews);

        tick();

        expect(response.content.length).toEqual(2);

        expect(response.content[0].information).toEqual("News1 about CulturalSite1");
        expect(response.content[0].dateTime).toEqual(new Date('January 18 1990'));
        expect(response.content[0].culturalSiteName).toEqual("CulturalSite1");
        expect(response.content[0].images.length).toEqual(0);

        expect(response.content[1].information).toEqual("News2 about CulturalSite1");
        expect(response.content[1].dateTime).toEqual(new Date('January 19 1990'));
        expect(response.content[1].culturalSiteName).toEqual("CulturalSite1");
        expect(response.content[1].images.length).toEqual(0);
    }))

    it('should get comments for cultular site', fakeAsync(() => {
        let comments: Comment[] = [
            {
                id: 1,
                name: "Nameuser",
                surname: "Surnameuser",
                username: "user@user.com",
                culturalSiteName: "CulturalSite1",
                text: "CulturalSite1 was good.",
                approved: true,
                images: []
            },
            {
                id: 2,
                name: "Nameuser",
                surname: "Surnameuser",
                username: "user@user.com",
                culturalSiteName: "CulturalSite1",
                text: "CulturalSite1 was terrible.",
                approved: true,
                images: []
            }
        ]

        let mockComments : CommentData = {
            content: comments,
            totalPages: 1,
            totalElements: 2,
            size: 2,
        }

        let response : CommentData = {
            content: [],
            totalPages: 0,
            totalElements: 0,
            size: 0,
        }

        culturalSiteService.getAllCulturalSiteComments(1, 0, 2).subscribe(
            data => {
                response = data
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/1/comment/by-page?page=0&size=2");
        expect(req.request.method).toBe('GET');
        req.flush(mockComments);

        tick();

        expect(response.content.length).toEqual(2);

        expect(response.content[0].id).toEqual(1);
        expect(response.content[0].name).toEqual("Nameuser");
        expect(response.content[0].surname).toEqual("Surnameuser");
        expect(response.content[0].username).toEqual("user@user.com");
        expect(response.content[0].culturalSiteName).toEqual("CulturalSite1");
        expect(response.content[0].text).toEqual("CulturalSite1 was good.");
        expect(response.content[0].approved).toEqual(true);
        expect(response.content[0].images!.length).toEqual(0);

        expect(response.content[1].id).toEqual(2);
        expect(response.content[1].name).toEqual("Nameuser");
        expect(response.content[1].surname).toEqual("Surnameuser");
        expect(response.content[1].username).toEqual("user@user.com");
        expect(response.content[1].culturalSiteName).toEqual("CulturalSite1");
        expect(response.content[1].text).toEqual("CulturalSite1 was terrible.");
        expect(response.content[1].approved).toEqual(true);
        expect(response.content[1].images!.length).toEqual(0);
    }))

    it('should  check if user is subscribed to cultural site', fakeAsync( () => {
        let userSubscription : SubscribedCulturalSiteDTO = {
            subscribed : false,
            userEmail : "user@user.com",
            culturalSiteId : 1
        }

        let mockUser : SubscribedCulturalSiteDTO = {
            subscribed : true,
            userEmail : "user@user.com",
            culturalSiteId : 1
        }

        let response : SubscribedCulturalSiteDTO = {
            subscribed : false,
            userEmail : "",
            culturalSiteId : 0
        }

        culturalSiteService.getUserCulturalSite(userSubscription).subscribe(
            data => {
                response = data;
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/subsribed-on-site");
        expect(req.request.method).toBe('POST');
        req.flush(mockUser);

        tick();

        expect(response.subscribed).toEqual(true);
        expect(response.userEmail).toEqual("user@user.com");
        expect(response.culturalSiteId).toEqual(1);
    }))

    it('should create comment', fakeAsync( () => {
        let mockComment : CommentDto = 
        {
            id: 1,
            name: "Nameuser",
            surname: "Surnameuser",
            culturalSiteName: "CulturalSite1",
            text: "CulturalSite1 was good.",
            approved: true,
            images: []
        }

        let response : CommentDto = {
            id: 0,
            name: "",
            surname: "",
            culturalSiteName: "",
            text: "",
            approved: false,
            images: []
        }

        culturalSiteService.createComment(1,"CulturalSite1 was good.").subscribe(
            data => {
                response = data
            }
        )

        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/1/comment");
        expect(req.request.method).toBe('POST');
        req.flush(mockComment);

        tick();

        expect(response.id).toEqual(1);
        expect(response.name).toEqual("Nameuser");
        expect(response.surname).toEqual("Surnameuser");
        expect(response.culturalSiteName).toEqual("CulturalSite1");
        expect(response.text).toEqual("CulturalSite1 was good.");
        expect(response.approved).toEqual(true);
        expect(response.images!.length).toEqual(0);
    }))

    it('should create cultural site', fakeAsync(() => {
        let culturalSiteDto: CulturalSiteView = 
        {
            name: "Novo kulturno dobro",
            categoryId: 1,
            categoryTypeId: 1,
            lat: 45,
            lng: 20,
            address: "Ilije Bircanina 45",
            city: "Krusevac",
            rating: 0,
            images: []
        }

        let mockCulturalSite: CulturalSiteView = 
        {
            id: 1,
            name: "Novo kulturno dobro",
            categoryId: 1,
            categoryTypeId: 1,
            lat: 45,
            lng: 20,
            address: "Ilije Bircanina 45",
            city: "Krusevac",
            rating: 0,
            images: []
        }

        let response: CulturalSiteView = 
        {
            id: 0,
            name: "",
            categoryId: 0,
            categoryTypeId: 0,
            lat: 0,
            lng: 0,
            address: "",
            city: "",
            rating: 0,
            images: []
        }

        culturalSiteService.createCulturalSite(culturalSiteDto)
            .subscribe(
                (data: CulturalSiteView) => {
                    response = data;
                }
            )
        
        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site");
        expect(req.request.method).toBe('POST');
        req.flush(mockCulturalSite);

        tick();

        expect(response.id).toEqual(1);
        expect(response.name).toEqual("Novo kulturno dobro");
        expect(response.categoryId).toEqual(1);
        expect(response.categoryTypeId).toEqual(1);
        expect(response.lat).toEqual(45);
        expect(response.lng).toEqual(20);
        expect(response.address).toEqual("Ilije Bircanina 45");
        expect(response.city).toEqual("Krusevac");
        expect(response.rating).toEqual(0);
        expect(response.images?.length).toEqual(0);
    }))

    it('should update cultural site', fakeAsync(() => {
        let updateCulturalSiteDto: CulturalSiteView = 
        {
            name: "Izmenjeno kulturno dobro",
            categoryId: 1,
            categoryTypeId: 1,
            lat: 45,
            lng: 20,
            address: "Marije Antoanete 3",
            city: "Zrenjanin",
            rating: 3,
            images: []
        }

        let mockCulturalSite: CulturalSiteView = 
        {
            id: 1,
            name: "Izmenjeno kulturno dobro",
            categoryId: 1,
            categoryTypeId: 1,
            lat: 45,
            lng: 20,
            address: "Marije Antoanete 3",
            city: "Zrenjanin",
            rating: 3,
            images: []
        }

        let response: CulturalSiteView = 
        {
            id: 0,
            name: "",
            categoryId: 0,
            categoryTypeId: 0,
            lat: 0,
            lng: 0,
            address: "",
            city: "",
            rating: 0,
            images: []
        }

        culturalSiteService.updateCulturalSite(1, updateCulturalSiteDto)
            .subscribe(
                (data: CulturalSiteView) => {
                    response = data;
                }
            )
        
        const req = httpMock.expectOne("http://localhost:8080/api/cultural-site/1");
        expect(req.request.method).toBe('PUT');
        req.flush(mockCulturalSite);

        tick();

        expect(response.id).toEqual(1);
        expect(response.name).toEqual("Izmenjeno kulturno dobro");
        expect(response.categoryId).toEqual(1);
        expect(response.categoryTypeId).toEqual(1);
        expect(response.lat).toEqual(45);
        expect(response.lng).toEqual(20);
        expect(response.address).toEqual("Marije Antoanete 3");
        expect(response.city).toEqual("Zrenjanin");
        expect(response.rating).toEqual(3);
        expect(response.images?.length).toEqual(0);
    }))

    it('should delete cultural site', fakeAsync(()=> {
    
        culturalSiteService.deleteCulturalSite(1).subscribe(data => {
            let response = data;
        })
 
        const req = httpMock.expectOne('http://localhost:8080/api/cultural-site/1');
        expect(req.request.method).toBe('DELETE');
        req.flush({});
 
        tick();
     }))
})