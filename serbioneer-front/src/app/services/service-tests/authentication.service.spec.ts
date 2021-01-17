import { HttpClient, HttpHeaders, HttpResponse } from "@angular/common/http";
import {HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { fakeAsync, flush, getTestBed, TestBed, tick } from "@angular/core/testing";
import { Router } from "@angular/router";
import { AuthenticatedUser } from "src/app/model/authenticated-user.model";
import { AuthenticationService } from "../authentication.service";

class Response {

    constructor(public ok: boolean = false, public status: number = 0, public statusText:string = "",
        public type: number = 0, public url: string = "") {}
}

describe('Authentication service', () => {

    let injector;
    let authenticationService: AuthenticationService;
    let httpMock: HttpTestingController;
    let httpClient: HttpClient;
    let router: any;

    let routerMock = {
        navigate: jasmine.createSpy('navigate')
    }

    beforeEach(() => {

        TestBed.configureTestingModule({
            imports: [HttpClientTestingModule],
            providers: [
                AuthenticationService,
                { provide: Router, useValue: routerMock}
            ]
        });

        injector = getTestBed();
        authenticationService = TestBed.inject(AuthenticationService);
        httpClient = TestBed.inject(HttpClient);
        httpMock = TestBed.inject(HttpTestingController);
        router = TestBed.inject(Router);
    })

    afterEach(() => {
        httpMock.verify();
      });
    
    it('should be created', () => {
        expect(authenticationService).toBeTruthy();
    })

    it('should log in user - login()', fakeAsync(() => {
        const admin = {
            username: "admin@admin.com",
            password: "admin"
        }

        let response: Response = new Response();

        const mockResponse = {
            ok: true,
            status: 200,
            statusText: "OK",
            type: 4,
            url: "http://localhost:8080/login"
        }

        authenticationService.login(admin).subscribe((data) => {
            response = data;
        })

        const req = httpMock.expectOne('http://localhost:8080/login');
        expect(req.request.method).toBe('POST');
        req.flush(mockResponse);

        tick();

        expect(response).toBeDefined();
        expect(response.ok).toBeTrue();
        expect(response.status).toEqual(200);
        expect(response.statusText).toEqual('OK');
        expect(response.type).toEqual(4);
        expect(response.url).toEqual('http://localhost:8080/login');
    }))


    it('should set logged in user to localStorage - setLoggedInUser()', () => {

        let headers: HttpHeaders = new HttpHeaders();
        headers =  headers.set('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoiYWRtaW5AYWRtaW4uY29tIiwiYXVkIjoid2ViIiwiaWF0IjoxNjEwODc3NDc0LCJleHAiOjE2MTA4NzgzNzQsImF1dGhvcml0aWVzIjpbeyJpZCI6MSwibmFtZSI6IlJPTEVfQURNSU4iLCJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RoEMkZsPoreFU-e4I9gA-AhOtBj1GVxT-SukIWkYNCYhomvzcjDMzgtOUIH5IGEh88FspdB2xcnf8C9vPFt5EQ');
        headers = headers.set('Expires-In', '900000');
        let mockResponse = new HttpResponse({ headers: headers});

        authenticationService.setLoggedInUser(mockResponse);

        expect(localStorage.getItem('jwtToken')).not.toBeNull();
        expect(localStorage.getItem('jwtToken')).toEqual('eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoiYWRtaW5AYWRtaW4uY29tIiwiYXVkIjoid2ViIiwiaWF0IjoxNjEwODc3NDc0LCJleHAiOjE2MTA4NzgzNzQsImF1dGhvcml0aWVzIjpbeyJpZCI6MSwibmFtZSI6IlJPTEVfQURNSU4iLCJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RoEMkZsPoreFU-e4I9gA-AhOtBj1GVxT-SukIWkYNCYhomvzcjDMzgtOUIH5IGEh88FspdB2xcnf8C9vPFt5EQ');
        expect(localStorage.getItem('expiresIn')).not.toBeNull();
        expect(localStorage.getItem('expiresIn')).toEqual('900000');
    })

    it('autologin() should emit an event', fakeAsync(()=> {
        let counter: number = 0;
        authenticationService.role$.subscribe(() => counter++);

        authenticationService.autoLogin();
        tick();
        authenticationService.autoLogin();
        tick();

        expect(counter).toBe(3);
    }))

    it('logout() should remove user from localStorage', () => {
        localStorage.setItem('jwtToken', 'eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoiYWRtaW5AYWRtaW4uY29tIiwiYXVkIjoid2ViIiwiaWF0IjoxNjEwODc3NDc0LCJleHAiOjE2MTA4NzgzNzQsImF1dGhvcml0aWVzIjpbeyJpZCI6MSwibmFtZSI6IlJPTEVfQURNSU4iLCJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RoEMkZsPoreFU-e4I9gA-AhOtBj1GVxT-SukIWkYNCYhomvzcjDMzgtOUIH5IGEh88FspdB2xcnf8C9vPFt5EQ');
        localStorage.setItem('expiresIn', '900000');

        authenticationService.logout();
        
        expect(localStorage.getItem('jwtToken')).toBeNull();
        expect(localStorage.getItem('expiresIn')).toBeNull();
        expect(router.navigate).toHaveBeenCalledWith(
            ['login-register/login']);
    })

    it('loggedInUser() should return current user role', () => {
        localStorage.setItem('jwtToken', 'eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoiYWRtaW5AYWRtaW4uY29tIiwiYXVkIjoid2ViIiwiaWF0IjoxNjEwODc3NDc0LCJleHAiOjE2MTA4NzgzNzQsImF1dGhvcml0aWVzIjpbeyJpZCI6MSwibmFtZSI6IlJPTEVfQURNSU4iLCJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RoEMkZsPoreFU-e4I9gA-AhOtBj1GVxT-SukIWkYNCYhomvzcjDMzgtOUIH5IGEh88FspdB2xcnf8C9vPFt5EQ');

        let role: string = authenticationService.loggedInUser();

        expect(role).toEqual('ROLE_ADMIN');

    })

    it('register() should register new authenticated user', fakeAsync(() => {
        let newUser: AuthenticatedUser = new AuthenticatedUser(
            "new@email.com", 
            "pass", 
            "Name", 
            "Surname" 
            )

        let mockRegisteredUser: AuthenticatedUser = new AuthenticatedUser(
            "new@email.com", 
            "pass", 
            "Name", 
            "Surname", 
            1
            )

        authenticationService.register(newUser).subscribe(
            data => {
                newUser = data;
            }
        )

        const req = httpMock.expectOne('http://localhost:8080/api/register');
        expect(req.request.method).toBe('POST')
        req.flush(mockRegisteredUser);

        expect(newUser).toBeDefined();
        expect(newUser.id).toEqual(1);
        expect(newUser.email).toEqual('new@email.com');
        expect(newUser.password).toEqual('pass');
        expect(newUser.name).toEqual('Name');
        expect(newUser.surname).toEqual('Surname');
    }))
})