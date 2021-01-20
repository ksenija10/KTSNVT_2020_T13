import { ComponentFixture, TestBed } from "@angular/core/testing";
import { ChangePasswordComponent } from "./change-password.component"
import {HarnessLoader} from '@angular/cdk/testing';
import {TestbedHarnessEnvironment} from '@angular/cdk/testing/testbed';
import { of } from "rxjs";
import { MyProfileService } from "src/app/services/my-profile.service";
import { AuthenticationService } from "src/app/services/authentication.service";
import { ToastrService } from "ngx-toastr";
import { Router } from "@angular/router";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatInputModule } from "@angular/material/input";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { MatInputHarness} from '@angular/material/input/testing';
import { PasswordDTO } from "src/app/model/password-dto.model";
import { MatFormFieldHarness } from '@angular/material/form-field/testing';

describe('ChangePasswordComponent', () => {
    let component: ChangePasswordComponent;
    let fixture: ComponentFixture<ChangePasswordComponent>;
    //injektovani servisi i ostalo
    let myProfileService: any;
    let authenticationService: any;
    let toastr: any;
    let router: any;
    let loader: HarnessLoader;

    beforeEach(() => {
        let myProfileServiceMock = {
            updatePassword: jasmine.createSpy('updatePassword')
                .and.returnValue(of({}))
        };

        let authenticationServiceMock = {
            setLoggedInUser: jasmine.createSpy('setLoggedInUser')
        };

        let toastrMock = {
            success: jasmine.createSpy('success'),
            error: jasmine.createSpy('error')
        };

        let routerMock = {
            navigate: jasmine.createSpy('navigate')
        };

        TestBed.configureTestingModule({
            declarations: [ChangePasswordComponent],
            providers: [
                { provide: MyProfileService, useValue: myProfileServiceMock },
                { provide: AuthenticationService, useValue: authenticationServiceMock },
                { provide: ToastrService, useValue: toastrMock },
                { provide: Router, useValue: routerMock}
            ],
            imports: [
                ReactiveFormsModule,
                FormsModule,
                MatFormFieldModule,
                MatInputModule,
                BrowserAnimationsModule
            ]
        }).compileComponents();

        fixture = TestBed.createComponent(ChangePasswordComponent);
        component = fixture.componentInstance;
        myProfileService = TestBed.inject(MyProfileService);
        authenticationService = TestBed.inject(AuthenticationService);
        router = TestBed.inject(Router);
        toastr = TestBed.inject(ToastrService);
        loader = TestbedHarnessEnvironment.loader(fixture);
    })

    it('should change password - success', async () => {
        expect(component.changePasswordForm.invalid).toBeTruthy();

        //popunjavanje forme u htmlu
        const oldPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#old-password'}))
        await oldPasswordInput.setValue('admin')
        const newPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#new-password'}))
        await newPasswordInput.setValue('new')
        const repeatPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#repeat-password'}))
        await repeatPasswordInput.setValue('new')
        
        const passwordDto: PasswordDTO = 
            new PasswordDTO(
                'admin',
                'new',
                'new'
            )

        // "pozivamo" metodu koju testiramo
        component.onSubmit();

        // sta ocekujemo da se pozvalo
        expect(myProfileService.updatePassword).toHaveBeenCalledWith(passwordDto);
        expect(toastr.success).toHaveBeenCalledWith('Password updated successfully!');

        expect(router.navigate).toHaveBeenCalledWith(['homepage']);
    })

    it('should not get required field error message - valid field', async () => {
        expect(component.changePasswordForm.invalid).toBeTruthy();

        //popunjavanje forme u htmlu
        const oldPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#old-password'}))
        await oldPasswordInput.setValue('admin')
        const newPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#new-password'}))
        await newPasswordInput.setValue('new')
        const repeatPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#repeat-password'}))
        await repeatPasswordInput.setValue('new')
        
        // "pozivamo" metode koje testiramo
        let returned = component.getRequiredFieldErrorMessage('oldPassword');
        expect(returned).toEqual('');
        const oldPasswordFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#oldPassword-form-field'}))
        expect(await oldPasswordFormField.getTextErrors()).toEqual([])

        returned = component.getPasswordRequiredFieldErrorMessage('password');
        expect(returned).toEqual('');
        const newPasswordFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#newPassword-form-field'}))
        expect(await newPasswordFormField.getTextErrors()).toEqual([])
        
        returned = component.getPasswordRequiredFieldErrorMessage('confirmPassword');
        expect(returned).toEqual('');
        const repeatPasswordFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#repeatPassword-form-field'}))
        expect(await repeatPasswordFormField.getTextErrors()).toEqual([])
    })

    it('should get required field error message - empty field', async () => {
        expect(component.changePasswordForm.invalid).toBeTruthy();

        //popunjavanje forme u htmlu
        const oldPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#old-password'}))
        await oldPasswordInput.setValue('')
        const newPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#new-password'}))
        await newPasswordInput.setValue('')
        const repeatPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#repeat-password'}))
        await repeatPasswordInput.setValue('')
        await newPasswordInput.setValue('')
        
        // "pozivamo" metode koje testiramo
        let returned = component.getRequiredFieldErrorMessage('oldPassword');
        expect(returned).toEqual('Required field');
        const oldPasswordFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#oldPassword-form-field'}))
        expect(await oldPasswordFormField.getTextErrors()).toEqual(['Required field'])

        returned = component.getPasswordRequiredFieldErrorMessage('password');
        expect(returned).toEqual('Required field');
        const newPasswordFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#newPassword-form-field'}))
        expect(await newPasswordFormField.getTextErrors()).toEqual(['Required field'])
        
        returned = component.getPasswordRequiredFieldErrorMessage('confirmPassword');
        expect(returned).toEqual('Required field');
        const repeatPasswordFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#repeatPassword-form-field'}))
        expect(await repeatPasswordFormField.getTextErrors()).toEqual(['Required field'])
    })

    it('should get passwords dont match error message', async () => {
        expect(component.changePasswordForm.invalid).toBeTruthy();

        //popunjavanje forme u htmlu
        const newPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#new-password'}))
        await newPasswordInput.setValue('dont')
        const repeatPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#repeat-password'}))
        await repeatPasswordInput.setValue('match')
        const oldPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#old-password'}))
        await oldPasswordInput.setValue('admin')
        
        // "pozivamo" metode koje testiramo
        let returned = component.getPasswordsMatch();
        expect(returned).toEqual('Passwords must match');

        const repeatPasswordFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#repeatPassword-form-field'}))
        expect(await repeatPasswordFormField.getTextErrors()).toEqual(['Passwords must match'])
    })

})