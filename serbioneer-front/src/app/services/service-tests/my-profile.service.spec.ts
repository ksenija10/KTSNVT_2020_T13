import { HttpClient } from "@angular/common/http";
import { HttpClientTestingModule, HttpTestingController } from "@angular/common/http/testing";
import { fakeAsync, getTestBed, TestBed, tick } from "@angular/core/testing";
import { AuthenticatedUser } from "src/app/model/authenticated-user.model";
import { PasswordDTO } from "src/app/model/password-dto.model";
import { UserUpdateDTO } from "src/app/model/user-update-dto.mpdel";
import { AuthenticationService } from "../authentication.service";
import { MyProfileService } from "../my-profile.service";

describe('My profile service', () => {
    let injector;
    let myProfileService: MyProfileService;
    let httpMock: HttpTestingController;
    let httpClient: HttpClient;
    let authenticationService: AuthenticationService;

    beforeEach(() => {
        let authenticationServiceMock = {
            getLoggedInUserAuthority: jasmine.createSpy('getLoggedInUserAuthority')
        }

        TestBed.configureTestingModule({
            imports: [HttpClientTestingModule],
            providers: [
                MyProfileService,
                { provide: AuthenticationService, useValue: authenticationServiceMock}
            ]
        });

        injector = getTestBed();
        myProfileService = TestBed.inject(MyProfileService);
        httpClient = TestBed.inject(HttpClient);
        httpMock = TestBed.inject(HttpTestingController);
        authenticationService = TestBed.inject(AuthenticationService);
    });

    afterEach(() => {
        httpMock.verify();
    })

    it('should be created', () => {
        expect(myProfileService).toBeTruthy();
    })

    it('should update user personal information', fakeAsync(()=> {
        let user: UserUpdateDTO = {
            email: 'marko.markovic@email.com',
            name: 'Marko',
            surname: 'Markovic'
        }

        let mockUser: UserUpdateDTO = {
            email: 'marko.markovic@email.com',
            name: 'Marko',
            surname: 'Markovic'
        }

        myProfileService.updatePersonalInformation(user)
            .subscribe( data => {
                user = data;
            })

        const req = httpMock.expectOne('http://localhost:8080/api/authenticated-user/updatePersonalInformation');
        expect(req.request.method).toBe('PUT');
        req.flush(mockUser);

        tick();

        expect(user).toBeDefined();
        expect(user.name).toEqual("Marko");
        expect(user.surname).toEqual("Markovic");
        expect(user.email).toEqual("marko.markovic@email.com");
    }))

    it('should update authenticated user password', fakeAsync(()=> {
        let password: PasswordDTO = {
            oldPassword: 'user',
            newPassword: 'new',
            repeatedPassword: 'new'
        }

        myProfileService.updatePassword(password)
            .subscribe(data => {
                let response = data;
            })


        const req = httpMock.expectOne('http://localhost:8080/api/authenticated-user/updatePassword');
        expect(req.request.method).toBe('PUT')
        req.flush({});

        tick();
    }))
})