import { ComponentFixture, fakeAsync, TestBed, tick } from '@angular/core/testing';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { MyProfileService } from 'src/app/services/my-profile.service';
import { MyProfileComponent } from './my-profile.component';
import {HarnessLoader} from '@angular/cdk/testing';
import {TestbedHarnessEnvironment} from '@angular/cdk/testing/testbed';
import {MatInputHarness} from '@angular/material/input/testing';
import { UserUpdateDTO } from 'src/app/model/user-update-dto.mpdel';
import { MatFormFieldHarness} from '@angular/material/form-field/testing';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';

describe('MyProfileComponent', () => {
    let component: MyProfileComponent;
    let fixture: ComponentFixture<MyProfileComponent>;
    // injektovani servisi i ostalo
    let myProfileService: MyProfileService;
    let authenticationService: AuthenticationService;
    let router: Router;
    let toastr: ToastrService;
    let loader: HarnessLoader;

    beforeEach(() => {
        const myProfileServiceMock = {
            getCurrentAuthenticatedUser: jasmine.createSpy('getCurrentAuthenticatedUser')
                .and.returnValue(of({
                    email: 'admin@admin.com',
                    password: 'admin',
                    name: 'Ksenija',
                    surname: 'Prcic',
                    dateOfBirth: new Date('2016-06-23'),
                    id: 1
                })),
            updatePersonalInformation: jasmine.createSpy('updatePersonalInformation')
                .and.returnValue(of({
                    email: 'admin@admin.com',
                    password: 'admin',
                    name: 'Ksenija',
                    surname: 'Jankovic',
                    dateOfBirth: new Date('2016-06-23')
                }))
        };

        const authenticationServiceMock = {
            getLoggedInUserAuthority: jasmine.createSpy('getLoggedInUserAuthority')
                .and.returnValue('ROLE_ADMIN')
        };

        const routerMock = {
            navigate: jasmine.createSpy('navigate')
        };

        const toastrMock = {
            success: jasmine.createSpy('success'),
            error: jasmine.createSpy('error')
        };

        TestBed.configureTestingModule({
            declarations: [MyProfileComponent],
            providers: [
                { provide: MyProfileService, useValue: myProfileServiceMock },
                { provide: AuthenticationService, useValue: authenticationServiceMock },
                { provide: Router, useValue: routerMock },
                { provide: ToastrService, useValue: toastrMock }
            ],
            imports: [
                ReactiveFormsModule,
                FormsModule,
                MatFormFieldModule,
                MatInputModule,
                BrowserAnimationsModule
            ]
        }).compileComponents();

        fixture = TestBed.createComponent(MyProfileComponent);
        component = fixture.componentInstance;
        myProfileService = TestBed.inject(MyProfileService);
        authenticationService = TestBed.inject(AuthenticationService);
        router = TestBed.inject(Router);
        toastr = TestBed.inject(ToastrService);
        loader = TestbedHarnessEnvironment.loader(fixture);
    });

    afterEach(() => {
        component.myProfileForm.reset();
        fixture.detectChanges();
    });

    it('should fetch currently logged in user', async () => {

        expect(component.myProfileForm.invalid).toBeTruthy();
        // "pozivamo" metodu koju testiramo
        component.ngOnInit();
        // sta ocekujemo da se pozvalo
        expect(myProfileService.getCurrentAuthenticatedUser).toHaveBeenCalled();

        // sta ocekujemo da se desilo
        // u ts fajlu
        expect(component.loggedInUser.email).toEqual('admin@admin.com');
        expect(component.loggedInUser.name).toEqual('Ksenija');
        expect(component.loggedInUser.surname).toEqual('Prcic');
        expect(component.loggedInUser.dateOfBirth).toEqual(new Date('2016-06-23'));
        // u formi
        expect(component.myProfileForm.controls.email.value).toEqual('admin@admin.com');
        expect(component.myProfileForm.controls.name.value).toEqual('Ksenija');
        expect(component.myProfileForm.controls.surname.value).toEqual('Prcic');
        expect(component.myProfileForm.controls.dateOfBirth.value).toEqual(new Date('2016-06-23'));

        // provera validnosti forme
        expect(component.myProfileForm.invalid).toBeFalse();
        // expect(await saveBtn.isDisabled()).toBeFalse();

        // u htmlu
        const emailInput = await loader.getHarness(MatInputHarness.with({selector: '#email-input'}));
        expect(await emailInput.getValue()).toEqual('admin@admin.com');
        const namelInput = await loader.getHarness(MatInputHarness.with({selector: '#name-input'}));
        expect(await namelInput.getValue()).toEqual('Ksenija');
        const surnameInput = await loader.getHarness(MatInputHarness.with({selector: '#surname-input'}));
        expect(await surnameInput.getValue()).toEqual('Prcic');
        const dateInput = await loader.getHarness(MatInputHarness.with({selector: '#date-input'}));
        expect(await dateInput.getValue()).toEqual((new Date('2016-06-23')).toString());
    });

    it('should send updated values to back', async () => {
        // popunjavanje forme u htmlu
        const emailInput = await loader.getHarness(MatInputHarness.with({selector: '#email-input'}));
        await emailInput.setValue('admin@admin.com');
        const namelInput = await loader.getHarness(MatInputHarness.with({selector: '#name-input'}));
        await namelInput.setValue('Ksenija');
        const surnameInput = await loader.getHarness(MatInputHarness.with({selector: '#surname-input'}));
        await surnameInput.setValue('Markovic');
        const dateInput = await loader.getHarness(MatInputHarness.with({selector: '#date-input'}));
        await dateInput.setValue((new Date('2016-06-23')).toString());

        const userUpdateDto: UserUpdateDTO =
            new UserUpdateDTO(
                'Ksenija',
                'Markovic',
                new Date('2016-06-23')
            );
        // "pozivamo" metodu koju testiramo
        component.onSubmit();
        // sta ocekujemo da se pozvalo
        expect(myProfileService.updatePersonalInformation).toHaveBeenCalledWith(userUpdateDto);
        expect(toastr.success).toHaveBeenCalledWith('Personal information updated successfully!');

        // provera da li je ociscena forma - myProfileForm.reset()
        expect(await emailInput.getValue()).toEqual('');
        expect(await namelInput.getValue()).toEqual('');
        expect(await surnameInput.getValue()).toEqual('');

        expect(router.navigate).toHaveBeenCalledWith(['homepage']);
    });

    it('should not get name and surname field error message - valid field', async () => {
        // popunjavanje forme
        const namelInput = await loader.getHarness(MatInputHarness.with({selector: '#name-input'}));
        await namelInput.setValue('Ksenija');
        const surnameInput = await loader.getHarness(MatInputHarness.with({selector: '#surname-input'}));
        await surnameInput.setValue('Prcic');
        // pozivanje metode KOJA IMA POVRATNU VREDNOST -> sacuvamo povratnu vrednost *tinkr tinkr*
        let returned = component.getNameErrorMessage('name');
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual([]);

        returned = component.getNameErrorMessage('surname');
        expect(returned).toEqual('');

        const surnameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#surname-form-field'}));
        expect(await surnameFormField.getTextErrors()).toEqual([]);
    });

    it('should get name and surname field error message - empty field', async () => {
        // popunjavanje forme
        const namelInput = await loader.getHarness(MatInputHarness.with({selector: '#name-input'}));
        await namelInput.setValue('');
        const surnameInput = await loader.getHarness(MatInputHarness.with({selector: '#surname-input'}));
        await surnameInput.setValue('');
        const dateInput = await loader.getHarness(MatInputHarness.with({selector: '#date-input'}));
        await dateInput.setValue('2016-06-23');

        // pozivanje metode KOJA IMA POVRATNU VREDNOST -> sacuvamo povratnu vrednost *tinkr tinkr*
        let returned = component.getNameErrorMessage('name');
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('Required field');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual(['Required field']);

        returned = component.getNameErrorMessage('surname');
        expect(returned).toEqual('Required field');

        const surnameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#surname-form-field'}));
        expect(await surnameFormField.getTextErrors()).toEqual(['Required field']);
    });

    it('should get name and surname field error message - not capitalized', async () => {
        // popunjavanje forme
        const namelInput = await loader.getHarness(MatInputHarness.with({selector: '#name-input'}));
        await namelInput.setValue('ksenija');
        const surnameInput = await loader.getHarness(MatInputHarness.with({selector: '#surname-input'}));
        await surnameInput.setValue('prcic');
        const dateInput = await loader.getHarness(MatInputHarness.with({selector: '#date-input'}));
        await dateInput.setValue('2016-06-23');

        // pozivanje metode KOJA IMA POVRATNU VREDNOST -> sacuvamo povratnu vrednost *tinkr tinkr*
        let returned = component.getNameErrorMessage('name');
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('Must start with capital letter');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual(['Must start with capital letter']);

        returned = component.getNameErrorMessage('surname');
        expect(returned).toEqual('Must start with capital letter');

        const surnameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#surname-form-field'}));
        expect(await surnameFormField.getTextErrors()).toEqual(['Must start with capital letter']);
    });

    it('should get name and surname field error message - special charater', async () => {
        // popunjavanje forme
        const namelInput = await loader.getHarness(MatInputHarness.with({selector: '#name-input'}));
        await namelInput.setValue('K8senija');
        const surnameInput = await loader.getHarness(MatInputHarness.with({selector: '#surname-input'}));
        await surnameInput.setValue('P%rcic');
        const dateInput = await loader.getHarness(MatInputHarness.with({selector: '#date-input'}));
        await dateInput.setValue('2016-06-23');

        // pozivanje metode KOJA IMA POVRATNU VREDNOST -> sacuvamo povratnu vrednost *tinkr tinkr*
        let returned = component.getNameErrorMessage('name');
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('Cannot contain special characters or numbers');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual(['Cannot contain special characters or numbers']);

        returned = component.getNameErrorMessage('surname');
        expect(returned).toEqual('Cannot contain special characters or numbers');

        const surnameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#surname-form-field'}));
        expect(await surnameFormField.getTextErrors()).toEqual(['Cannot contain special characters or numbers']);
    });

    it('should get date field error message - valid field', async () => {
        // popunjavanje forme
        const dateInput = await loader.getHarness(MatInputHarness.with({selector: '#date-input'}));
        await dateInput.setValue('2016-06-23');
        const namelInput = await loader.getHarness(MatInputHarness.with({selector: '#name-input'}));
        await namelInput.setValue('Ksenija');
        const surnameInput = await loader.getHarness(MatInputHarness.with({selector: '#surname-input'}));
        await surnameInput.setValue('Prcic');

        // pozivanje metode KOJA IMA POVRATNU VREDNOST -> sacuvamo povratnu vrednost *tinkr tinkr*
        const returned = component.getDateErrorMessage('dateOfBirth');
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('');
    });
});
