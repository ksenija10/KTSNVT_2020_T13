import { HttpClient } from "@angular/common/http";
import { HttpClientTestingModule, HttpTestingController } from "@angular/common/http/testing";
import { fakeAsync, getTestBed, TestBed, tick } from "@angular/core/testing";
import { AuthenticatedUserService } from "../auth-user.service";
import { CommentService } from "../comment.service";

describe('Authenticated user service', ()=>{
    let injector;
    let authenticatedUserService: AuthenticatedUserService;
    let httpMock: HttpTestingController;
    let httpClient: HttpClient;

    beforeEach(()=>{

        TestBed.configureTestingModule({
            imports: [HttpClientTestingModule],
            providers: [CommentService]
        })

        injector = getTestBed();
        authenticatedUserService = TestBed.inject(AuthenticatedUserService);
        httpClient = TestBed.inject(HttpClient);
        httpMock = TestBed.inject(HttpTestingController);
    })

    afterEach(() => {
        httpMock.verify();
    })

    it('should be created', () => {
        expect(authenticatedUserService).toBeTruthy();
    })

    it('should be subscribed to a cultural site', fakeAsync(() => {
        authenticatedUserService.subscribe(1).subscribe(data => {
            let response = data;
        })
 
        const req = httpMock.expectOne('http://localhost:8080/api/authenticated-user/subscribe/1');
        expect(req.request.method).toBe('POST');
        req.flush({});
 
        tick();
    }))


    it('should be unsubscribed from a cultural site', fakeAsync(() => {
        authenticatedUserService.unsubscribe(1).subscribe(data => {
            let response = data;
        })
 
        const req = httpMock.expectOne('http://localhost:8080/api/authenticated-user/unsubscribe/1');
        expect(req.request.method).toBe('POST');
        req.flush({});
 
        tick();
    }))

})