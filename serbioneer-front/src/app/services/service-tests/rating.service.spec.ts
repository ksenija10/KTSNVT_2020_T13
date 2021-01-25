import { HttpClient } from '@angular/common/http';
import { HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { fakeAsync, getTestBed, TestBed, tick } from '@angular/core/testing';
import { RatingBackDTO, RatingDTO, RatingService } from '../rating.service';

describe('Rating service', () => {
    let injector;
    let ratingService: RatingService;
    let httpMock: HttpTestingController;
    let httpClient: HttpClient;

    beforeEach(() => {

        TestBed.configureTestingModule({
            imports: [HttpClientTestingModule],
            providers: [RatingService]
        });

        injector = getTestBed();
        ratingService = TestBed.inject(RatingService);
        httpClient = TestBed.inject(HttpClient);
        httpMock = TestBed.inject(HttpTestingController);
    });

    afterEach(() => {
        httpMock.verify();
    });

    it('should be created', () => {
        expect(ratingService).toBeTruthy();
    });

    it('should return user rating', fakeAsync(() => {

        const mockRating: RatingDTO = {
            id: 1,
            value: 5,
            culturalSiteId: 1,
            authenticatedUserId: 2
        };

        let response: RatingDTO = {
            id: 0,
            value: 0,
            culturalSiteId: 0,
            authenticatedUserId: 0
        };

        ratingService.getUserRatingForCulturalSite(1, 'prvi@user.com')
            .subscribe((data) => {
                response = data;
            });

        const req = httpMock.expectOne('https://localhost:8080/api/rating/user-site-rating/');
        expect(req.request.method).toBe('POST');
        req.flush(mockRating);

        tick();

        expect(response).toBeDefined();
        expect(response.id).toEqual(1);
        expect(response.value).toEqual(5);
        expect(response.culturalSiteId).toEqual(1);
        expect(response.authenticatedUserId).toEqual(2);

     }));

    it('should create user rating', fakeAsync(() => {

        const mockRating: RatingDTO = {
            id: 1,
            value: 5,
            culturalSiteId: 1,
            authenticatedUserId: 2
        };

        let response: RatingDTO = {
            id: 0,
            value: 0,
            culturalSiteId: 0,
            authenticatedUserId: 0
        };

        ratingService.createRating(1, 5)
            .subscribe((data) => {
                response = data;
            });

        const req = httpMock.expectOne('https://localhost:8080/api/rating/cultural-site/1');
        expect(req.request.method).toBe('POST');
        req.flush(mockRating);

        tick();

        expect(response).toBeDefined();
        expect(response.id).toEqual(1);
        expect(response.value).toEqual(5);
        expect(response.culturalSiteId).toEqual(1);
        expect(response.authenticatedUserId).toEqual(2);

     }));

    it('should update user rating', fakeAsync(() => {

        const mockRating: RatingDTO = {
            id: 1,
            value: 5,
            culturalSiteId: 1,
            authenticatedUserId: 2
        };

        let response: RatingDTO = {
            id: 0,
            value: 0,
            culturalSiteId: 0,
            authenticatedUserId: 0
        };

        ratingService.updateRating(1, 5, 1)
            .subscribe((data) => {
                response = data;
            });

        const req = httpMock.expectOne('https://localhost:8080/api/rating');
        expect(req.request.method).toBe('PUT');
        req.flush(mockRating);

        tick();

        expect(response).toBeDefined();
        expect(response.id).toEqual(1);
        expect(response.value).toEqual(5);
        expect(response.culturalSiteId).toEqual(1);
        expect(response.authenticatedUserId).toEqual(2);

     }));
});
