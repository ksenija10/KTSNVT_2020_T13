import { ComponentFixture, fakeAsync, TestBed, tick } from "@angular/core/testing";
import { By } from "@angular/platform-browser";
import { Router } from "@angular/router";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { UserUpdateDTO } from "src/app/model/user-update-dto.mpdel";
import { AuthenticationService } from "src/app/services/authentication.service";
import { MyProfileService } from "src/app/services/my-profile.service";
import { MyProfileComponent } from "./my-profile.component";

describe('MyProfileComponent', () =>{
    let component: MyProfileComponent;
    let fixture: ComponentFixture<MyProfileComponent>;
    // injektovani servisi i ostalo
    let myProfileService: any;
    let authenticationService: any;
    let router: any;
    let toastr: any;

    beforeEach(() => {
        let myProfileServiceMock = {
            getCurrentAuthenticatedUser: jasmine.createSpy('getCurrentAuthenticatedUser')
                .and.returnValue(of({
                    email: "admin@admin.com",
                    password: "admin",
                    name: "Ksenija",
                    surname: "Prcic",
                    dateOfBirth: new Date('2016-06-23'),
                    id: 1
                })),
            updatePersonalInformation: jasmine.createSpy('updatePersonalInformation')
                .and.returnValue(of({
                    email: "admin@admin.com",
                    password: "admin",
                    name: "Ksenija",
                    surname: "Jankovic",
                    dateOfBirth: new Date('2016-06-23')
                }))
        };

        let authenticationServiceMock = {
            getLoggedInUserAuthority: jasmine.createSpy('getLoggedInUserAuthority')
                .and.returnValue("ROLE_ADMIN")
        };

        let routerMock = {
            navigate: jasmine.createSpy('navigate')
        }

        let toastrMock = {
            success: jasmine.createSpy('success'),
            error: jasmine.createSpy('error')
        }

        TestBed.configureTestingModule({
            declarations: [MyProfileComponent],
            providers: [
                { provide: MyProfileService, useValue: myProfileServiceMock },
                { provide: AuthenticationService, useValue: authenticationServiceMock },
                { provide: Router, useValue: routerMock },
                { provide: ToastrService, useValue: toastrMock }
            ]
        });

        fixture = TestBed.createComponent(MyProfileComponent);
        component = fixture.componentInstance;
        myProfileService = TestBed.inject(MyProfileService);
        authenticationService = TestBed.inject(AuthenticationService);
        router = TestBed.inject(Router);
        toastr = TestBed.inject(ToastrService);
    })

    it('should fetch currently logged in user', fakeAsync(() => {
        // "pozivamo" metodu koju testiramo
        component.ngOnInit();
        // sta ocekujemo da se pozvalo
        expect(myProfileService.getCurrentAuthenticatedUser).toHaveBeenCalled();

        // cekamo na observablu
        tick();

        // sta ocekujemo da se desilo
        // u ts fajlu
        expect(component.loggedInUser.email).toEqual('admin@admin.com');
        expect(component.loggedInUser.name).toEqual('Ksenija');
        expect(component.loggedInUser.surname).toEqual('Prcic');
        expect(component.loggedInUser.dateOfBirth).toEqual(new Date('2016-06-23'));
        // u html fajlu
        expect(component.myProfileForm.controls['email'].value).toEqual('admin@admin.com');
        expect(component.myProfileForm.controls['name'].value).toEqual('Ksenija');
        expect(component.myProfileForm.controls['surname'].value).toEqual('Prcic');
        expect(component.myProfileForm.controls['dateOfBirth'].value).toEqual(new Date('2016-06-23'));
    }))

    it('should send updated values to back', fakeAsync(() => {
        // popunjavanje forme
        component.myProfileForm.controls['name'].setValue('Ksenija');
        component.myProfileForm.controls['surname'].setValue('Jankovic');
        component.myProfileForm.controls['dateOfBirth'].setValue(new Date('2016-06-23'));
        const userUpdateDto: UserUpdateDTO = 
            new UserUpdateDTO(
                "Ksenija",
                "Jankovic",
                new Date('2016-06-23')
            )
        // "pozivamo" metodu koju testiramo
        component.onSubmit();
        // sta ocekujemo da se pozvalo
        expect(myProfileService.updatePersonalInformation).toHaveBeenCalledWith(userUpdateDto);

        // cekamo na observablu
        tick();

        // sta ocekujemo da se desilo
        // u ts fajlu
        expect(toastr.success).toHaveBeenCalledWith('Personal information updated successfully!');
        expect(router.navigate).toHaveBeenCalledWith(['homepage']);
    }))

    it('should get required name and surname field error message - valid field', fakeAsync(() => {
        // popunjavanje forme
        component.myProfileForm.controls['name'].setValue('Ksenija');
        component.myProfileForm.controls['surname'].setValue('Jankovic');
        // pozivanje metode KOJA IMA POVRATNU VREDNOST -> sacuvamo povratnu vrednost *tinkr tinkr*
        let returned = component.getNameErrorMessage('name');
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('');

        returned = component.getNameErrorMessage('surname');
        expect(returned).toEqual('');
    }))

    it('should get required name and surname field error message - empty field', fakeAsync(() => {
        // PIPNEMO FORMU
        component.myProfileForm.markAllAsTouched();
        // popunjavanje forme
        component.myProfileForm.controls['name'].setValue('');
        component.myProfileForm.controls['surname'].setValue('');
        // pozivanje metode KOJA IMA POVRATNU VREDNOST -> sacuvamo povratnu vrednost *tinkr tinkr*
        let returned = component.getNameErrorMessage('name');
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('Required field');

        returned = component.getNameErrorMessage('surname');
        expect(returned).toEqual('Required field');
    }))

    it('should get required name and surname field error message - not capitalized', fakeAsync(() => {
        // popunjavanje forme
        component.myProfileForm.markAllAsTouched();
        component.myProfileForm.controls['name'].setValue('ksenija');
        component.myProfileForm.controls['surname'].setValue('jankovic');
        // pozivanje metode KOJA IMA POVRATNU VREDNOST -> sacuvamo povratnu vrednost *tinkr tinkr*
        let returned = component.getNameErrorMessage('name');
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('Must start with capital letter');

        returned = component.getNameErrorMessage('surname');
        expect(returned).toEqual('Must start with capital letter');
    }))
    
    it('should get required name and surname field error message - special characters', fakeAsync(() => {
        // popunjavanje forme
        component.myProfileForm.markAllAsTouched();
        component.myProfileForm.controls['name'].setValue('K8');
        component.myProfileForm.controls['surname'].setValue('J%');
        // pozivanje metode KOJA IMA POVRATNU VREDNOST -> sacuvamo povratnu vrednost *tinkr tinkr*
        let returned = component.getNameErrorMessage('name');
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('Cannot contain special characters or numbers');

        returned = component.getNameErrorMessage('surname');
        expect(returned).toEqual('Cannot contain special characters or numbers');
    }))

    it('should get required date field error message - valid field', fakeAsync(() => {
        // popunjavanje forme
        component.myProfileForm.markAllAsTouched();
        component.myProfileForm.controls['dateOfBirth'].setValue(new Date('2016-06-23'));
        // pozivanje metode KOJA IMA POVRATNU VREDNOST -> sacuvamo povratnu vrednost *tinkr tinkr*
        let returned = component.getDateErrorMessage('dateOfBirth');
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('');
    }))
})
