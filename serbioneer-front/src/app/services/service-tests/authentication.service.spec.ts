import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http';
import {HttpClientTestingModule, HttpTestingController } from '@angular/common/http/testing';
import { fakeAsync, flush, getTestBed, TestBed, tick } from '@angular/core/testing';
import { Router } from '@angular/router';
import { AuthenticatedUser } from 'src/app/model/authenticated-user.model';
import { AuthenticationService } from '../authentication.service';

class Response {

    constructor(public ok: boolean = false, public status: number = 0, public statusText: string = '',
                public type: number = 0, public url: string = '') {}
}

describe('Authentication service', () => {

    let injector;
    let authenticationService: AuthenticationService;
    let httpMock: HttpTestingController;
    let httpClient: HttpClient;
    let router: any;

    const routerMock = {
        navigate: jasmine.createSpy('navigate')
    };

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
    });

    afterEach(() => {
        localStorage.removeItem('jwtToken');
        localStorage.removeItem('expiresIn');
        httpMock.verify();
      });


    it('should be created', () => {
        expect(authenticationService).toBeTruthy();
    });


    it('should register new authenticated user', fakeAsync(() => {
        let newUser: AuthenticatedUser = new AuthenticatedUser(
            'new@email.com',
            'pass',
            'Name',
            'Surname'
            );

        const mockRegisteredUser: AuthenticatedUser = new AuthenticatedUser(
            'new@email.com',
            'pass',
            'Name',
            'Surname',
            1
            );

        authenticationService.register(newUser).subscribe(
            data => {
                newUser = data;
            }
        );

        const req = httpMock.expectOne('https://localhost:8080/api/register');
        expect(req.request.method).toBe('POST');
        req.flush(mockRegisteredUser);

        expect(newUser).toBeDefined();
        expect(newUser.id).toEqual(1);
        expect(newUser.email).toEqual('new@email.com');
        expect(newUser.password).toEqual('pass');
        expect(newUser.name).toEqual('Name');
        expect(newUser.surname).toEqual('Surname');
    }));

    it('should fail to register new authenticated user - email already exists', fakeAsync(() => {
        let response = '';

        const newUser: AuthenticatedUser = new AuthenticatedUser(
            'admin@admin.com',
            'pass',
            'Name',
            'Surname'
            );

        const mockResponse = 'User with given email already exists.';

        authenticationService.register(newUser).subscribe(
            data => {
                response = data;
            }
        );

        const req = httpMock.expectOne('https://localhost:8080/api/register');
        expect(req.request.method).toBe('POST');
        req.flush(mockResponse);

        tick();

        expect(response).toEqual('User with given email already exists.');
    }));

    it('should log in user', fakeAsync(() => {
        const admin = {
            username: 'admin@admin.com',
            password: 'admin'
        };

        let response = new HttpResponse();

        let headers: HttpHeaders = new HttpHeaders();
        headers =  headers.set('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoiYWRtaW5AYWRtaW4uY29tIiwiYXVkIjoid2ViIiwiaWF0IjoxNjEwODc3NDc0LCJleHAiOjE2MTA4NzgzNzQsImF1dGhvcml0aWVzIjpbeyJpZCI6MSwibmFtZSI6IlJPTEVfQURNSU4iLCJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RoEMkZsPoreFU-e4I9gA-AhOtBj1GVxT-SukIWkYNCYhomvzcjDMzgtOUIH5IGEh88FspdB2xcnf8C9vPFt5EQ');
        headers = headers.set('Expires-In', '900000');
        const mockResponse = new HttpResponse({ headers});

        authenticationService.login(admin).subscribe((data) => {
            response = data;
        });

        const req = httpMock.expectOne('https://localhost:8080/login');
        expect(req.request.method).toBe('POST');
        req.flush(mockResponse);

        tick();

        expect(response).toBeDefined();
        expect(response.status).toEqual(200);
        expect(response.statusText).toEqual('OK');
        expect(response.url).toEqual('https://localhost:8080/login');
        expect(response.ok).toEqual(true);
    }));

    it('should fail to log in user - invalid password', fakeAsync(() => {
        let response = new HttpResponse();

        const admin = {
            username: 'admin@admin.com',
            password: 'invalid'
        };

        const mockResponse = 'User with given email already exists.';

        authenticationService.login(admin).subscribe(data => {
            response = data;
        });

        const req = httpMock.expectOne('https://localhost:8080/login');
        expect(req.request.method).toBe('POST');
        req.flush(mockResponse);

        tick();

        expect(response).toBeDefined();
        expect(response.body).toEqual('User with given email already exists.');
    }));

    it('should fail to log in user - invalid email', fakeAsync(() => {
        let response = new HttpResponse();

        const admin = {
            username: 'invalid@email.com',
            password: 'admin'
        };

        const mockError = 'Incorrect email or password.';

        authenticationService.login(admin).subscribe((data) => {
            response = data;
        });

        const req = httpMock.expectOne('https://localhost:8080/login');
        expect(req.request.method).toBe('POST');
        req.flush(mockError);

        tick();

        expect(response).toBeDefined();
        expect(response.body).toEqual('Incorrect email or password.');
    }));

    it('should remove user from localStorage - logout', () => {
        localStorage.setItem('jwtToken', 'eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoiYWRtaW5AYWRtaW4uY29tIiwiYXVkIjoid2ViIiwiaWF0IjoxNjEwODc3NDc0LCJleHAiOjE2MTA4NzgzNzQsImF1dGhvcml0aWVzIjpbeyJpZCI6MSwibmFtZSI6IlJPTEVfQURNSU4iLCJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RoEMkZsPoreFU-e4I9gA-AhOtBj1GVxT-SukIWkYNCYhomvzcjDMzgtOUIH5IGEh88FspdB2xcnf8C9vPFt5EQ');
        localStorage.setItem('expiresIn', '900000');

        authenticationService.logout();

        expect(localStorage.getItem('jwtToken')).toBeNull();
        expect(localStorage.getItem('expiresIn')).toBeNull();
        expect(router.navigate).toHaveBeenCalledWith(
            ['login-register/login']);
        // poziv metode stopRefreshTokenTimer()
    });

    it('should set logged in user', () => {

        let headers: HttpHeaders = new HttpHeaders();
        headers =  headers.set('Authorization', 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoiYWRtaW5AYWRtaW4uY29tIiwiYXVkIjoid2ViIiwiaWF0IjoxNjEwODc3NDc0LCJleHAiOjE2MTA4NzgzNzQsImF1dGhvcml0aWVzIjpbeyJpZCI6MSwibmFtZSI6IlJPTEVfQURNSU4iLCJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RoEMkZsPoreFU-e4I9gA-AhOtBj1GVxT-SukIWkYNCYhomvzcjDMzgtOUIH5IGEh88FspdB2xcnf8C9vPFt5EQ');
        headers = headers.set('Expires-In', '900000');
        const mockResponse = new HttpResponse({ headers});

        authenticationService.setLoggedInUser(mockResponse);

        expect(localStorage.getItem('jwtToken')).not.toBeNull();
        expect(localStorage.getItem('jwtToken')).toEqual('eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoiYWRtaW5AYWRtaW4uY29tIiwiYXVkIjoid2ViIiwiaWF0IjoxNjEwODc3NDc0LCJleHAiOjE2MTA4NzgzNzQsImF1dGhvcml0aWVzIjpbeyJpZCI6MSwibmFtZSI6IlJPTEVfQURNSU4iLCJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RoEMkZsPoreFU-e4I9gA-AhOtBj1GVxT-SukIWkYNCYhomvzcjDMzgtOUIH5IGEh88FspdB2xcnf8C9vPFt5EQ');
        expect(localStorage.getItem('expiresIn')).not.toBeNull();
        expect(localStorage.getItem('expiresIn')).toEqual('900000');
        // expect(authenticationService.startRefreshTokenTimer).toHaveBeenCalledOnceWith()
    });


    it('should get no user logged in', () => {

        const token = authenticationService.getLoggedInUser();

        expect(token).not.toBeNull();
        expect(token).toEqual('');

    });

    it('should get logged in admin', () => {
        localStorage.setItem('jwtToken', 'eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoiYWRtaW5AYWRtaW4uY29tIiwiYXVkIjoid2ViIiwiaWF0IjoxNjEwODc3NDc0LCJleHAiOjE2MTA4NzgzNzQsImF1dGhvcml0aWVzIjpbeyJpZCI6MSwibmFtZSI6IlJPTEVfQURNSU4iLCJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RoEMkZsPoreFU-e4I9gA-AhOtBj1GVxT-SukIWkYNCYhomvzcjDMzgtOUIH5IGEh88FspdB2xcnf8C9vPFt5EQ');

        const token = authenticationService.getLoggedInUser();

        expect(token).not.toBeNull();
        expect(token.iss).toEqual('serbioneer');
        expect(token.sub).toEqual('admin@admin.com');
        expect(token.aud).toEqual('web');
        expect(token.iat).toEqual(1610877474);
        expect(token.exp).toEqual(1610878374);
        expect(token.authorities[0]).not.toBeNull();
        expect(token.authorities[0].id).toEqual(1);
        expect(token.authorities[0].name).toEqual('ROLE_ADMIN');
        expect(token.authorities[0].authority).toEqual('ROLE_ADMIN');

    });

    it('should get logged in authenticated user', () => {
        localStorage.setItem('jwtToken', 'eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoicHJ2aUB1c2VyLmNvbSIsImF1ZCI6IndlYiIsImlhdCI6MTYxMDg5NTQ2NSwiZXhwIjoxNjEwODk2MzY1LCJhdXRob3JpdGllcyI6W3siaWQiOjIsIm5hbWUiOiJST0xFX1VTRVIiLCJhdXRob3JpdHkiOiJST0xFX1VTRVIifV19.uk5FWUKAKaiw3IJRG9Z_b4xto_n0Iw7eaOFDsSs7fuHqRAH1-lNe6SosR9sgVfH0stkt6buN6zCVASnZ6gZ0mQ');

        const token = authenticationService.getLoggedInUser();

        expect(token).not.toBeNull();
        expect(token.iss).toEqual('serbioneer');
        expect(token.sub).toEqual('prvi@user.com');
        expect(token.aud).toEqual('web');
        expect(token.iat).toEqual(1610895465);
        expect(token.exp).toEqual(1610896365);
        expect(token.authorities[0]).not.toBeNull();
        expect(token.authorities[0].id).toEqual(2);
        expect(token.authorities[0].name).toEqual('ROLE_USER');
        expect(token.authorities[0].authority).toEqual('ROLE_USER');

    });

    it('should return current logged in user role no user logged in', () => {

        const role: string = authenticationService.getLoggedInUserAuthority();

        expect(role).not.toBeNull();
        expect(role).toEqual('');

    });

    it('should return current logged in user role admin', () => {
        localStorage.setItem('jwtToken', 'eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoiYWRtaW5AYWRtaW4uY29tIiwiYXVkIjoid2ViIiwiaWF0IjoxNjEwODc3NDc0LCJleHAiOjE2MTA4NzgzNzQsImF1dGhvcml0aWVzIjpbeyJpZCI6MSwibmFtZSI6IlJPTEVfQURNSU4iLCJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RoEMkZsPoreFU-e4I9gA-AhOtBj1GVxT-SukIWkYNCYhomvzcjDMzgtOUIH5IGEh88FspdB2xcnf8C9vPFt5EQ');

        const role: string = authenticationService.getLoggedInUserAuthority();

        expect(role).not.toBeNull();
        expect(role).toEqual('ROLE_ADMIN');

    });

    it('should return current logged in user role user', () => {
        localStorage.setItem('jwtToken', 'eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoicHJ2aUB1c2VyLmNvbSIsImF1ZCI6IndlYiIsImlhdCI6MTYxMDg5NTQ2NSwiZXhwIjoxNjEwODk2MzY1LCJhdXRob3JpdGllcyI6W3siaWQiOjIsIm5hbWUiOiJST0xFX1VTRVIiLCJhdXRob3JpdHkiOiJST0xFX1VTRVIifV19.uk5FWUKAKaiw3IJRG9Z_b4xto_n0Iw7eaOFDsSs7fuHqRAH1-lNe6SosR9sgVfH0stkt6buN6zCVASnZ6gZ0mQ');

        const role: string = authenticationService.getLoggedInUserAuthority();

        expect(role).not.toBeNull();
        expect(role).toEqual('ROLE_USER');

    });

    it('should get current logged in user email', () => {
        localStorage.setItem('jwtToken', 'eyJhbGciOiJIUzUxMiJ9.eyJpc3MiOiJzZXJiaW9uZWVyIiwic3ViIjoiYWRtaW5AYWRtaW4uY29tIiwiYXVkIjoid2ViIiwiaWF0IjoxNjEwODc3NDc0LCJleHAiOjE2MTA4NzgzNzQsImF1dGhvcml0aWVzIjpbeyJpZCI6MSwibmFtZSI6IlJPTEVfQURNSU4iLCJhdXRob3JpdHkiOiJST0xFX0FETUlOIn1dfQ.RoEMkZsPoreFU-e4I9gA-AhOtBj1GVxT-SukIWkYNCYhomvzcjDMzgtOUIH5IGEh88FspdB2xcnf8C9vPFt5EQ');

        const email: string = authenticationService.getLoggedInUserEmail();

        expect(email).not.toBeNull();
        expect(email).toEqual('admin@admin.com');
    });

    it('should get current logged in user email no user logged in', () => {

        const email: string = authenticationService.getLoggedInUserEmail();

        expect(email).not.toBeNull();
        expect(email).toEqual('');
    });
});
