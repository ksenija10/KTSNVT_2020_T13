import { async, ComponentFixture, TestBed } from '@angular/core/testing';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { LoginComponent } from './login.component';
import {HarnessLoader} from '@angular/cdk/testing';
import {TestbedHarnessEnvironment} from '@angular/cdk/testing/testbed';
import { of } from 'rxjs';
import { MatInputHarness } from '@angular/material/input/testing';
import { UserLogin } from 'src/app/model/user-login.model';
import { MatFormFieldHarness } from '@angular/material/form-field/testing';

describe('LoginComponent', () => {
    let component: LoginComponent;
    let fixture: ComponentFixture<LoginComponent>;
    // injektovani servisi i ostalo
    let authenticationService: any;
    let router: any;
    let toastr: any;
    let loader: HarnessLoader;

    beforeEach(() => {
        const authenticationServiceMock = {
            login: jasmine.createSpy('login')
                .and.returnValue(of({
                    username: 'admin@admin.com',
                    password: 'admin'
                })),
            setLoggedInUser: jasmine.createSpy('setLoggedInUser'),
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
            declarations: [LoginComponent],
            providers: [
                { provide: AuthenticationService, useValue: authenticationServiceMock },
                { provide: Router, useValue: routerMock },
                { provide: ToastrService, useValue: toastrMock}
            ],
            imports: [
                ReactiveFormsModule,
                FormsModule,
                MatFormFieldModule,
                MatInputModule,
                BrowserAnimationsModule
            ]
        }).compileComponents();

        fixture = TestBed.createComponent(LoginComponent);
        component = fixture.componentInstance;
        authenticationService = TestBed.inject(AuthenticationService);
        router = TestBed.inject(Router);
        toastr = TestBed.inject(ToastrService);
        loader = TestbedHarnessEnvironment.loader(fixture);
    });

    it('should log in user - success', async () => {
        // popunjavanje login forme
        const emailInput = await loader.getHarness(MatInputHarness.with({selector: '#email-input'}));
        await emailInput.setValue('admin@admin.com');
        const passwordInput = await loader.getHarness(MatInputHarness.with({selector: '#password-input'}));
        await passwordInput.setValue('admin');

        const userLoginMockDto = new UserLogin('admin@admin.com', 'admin');

        // "pozivamo" metodu
        component.onSubmit();

        // sta ocekujemo da ce se desiti
        expect(authenticationService.login).toHaveBeenCalledWith(userLoginMockDto);
        expect(toastr.success).toHaveBeenCalledWith('Logged in successfully!');
        expect(authenticationService.setLoggedInUser).toHaveBeenCalled();
        expect(router.navigate).toHaveBeenCalledWith(['homepage']);

        // provera da li je forma ociscenja
        expect(await emailInput.getValue()).toEqual('');
        expect(await passwordInput.getValue()).toEqual('');
    });

    it('should get email error message - required', async () => {
        // popunjavanje login forme
        const emailInput = await loader.getHarness(MatInputHarness.with({selector: '#email-input'}));
        await emailInput.setValue('');
        await emailInput.blur();

        // "pozivamo" metodu
        const errorMessage = component.getEmailErrorMessage();

        // ocekujemo povratne vrednosti
        expect(errorMessage).toEqual('Required field');
        // proveravamo html
        const emailFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#email-form-field'}));
        expect(await emailFormField.getTextErrors()).toEqual(['Required field']);
    });

    it('should get email error message - invalid email', async () => {
        // popunjavanje login forme
        const emailInput = await loader.getHarness(MatInputHarness.with({selector: '#email-input'}));
        await emailInput.setValue('slb');
        await emailInput.blur();

        // "pozivamo" metodu
        const errorMessage = component.getEmailErrorMessage();

        // ocekujemo povratne vrednosti
        expect(errorMessage).toEqual('Not a valid email');
        // proveravamo html
        const emailFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#email-form-field'}));
        expect(await emailFormField.getTextErrors()).toEqual(['Not a valid email']);
    });

    it('should get email error message - valid', async () => {
        // popunjavanje login forme
        const emailInput = await loader.getHarness(MatInputHarness.with({selector: '#email-input'}));
        await emailInput.setValue('admin@admin.com');
        await emailInput.blur();

        // "pozivamo" metodu
        const errorMessage = component.getEmailErrorMessage();

        // ocekujemo povratne vrednosti
        expect(errorMessage).toEqual('');
        // proveravamo html
        const emailFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#email-form-field'}));
        expect(await emailFormField.getTextErrors()).toEqual([]);
    });

    it('should get required field error message - required', async () => {
        // popunjavanje login forme
        const passwordInput = await loader.getHarness(MatInputHarness.with({selector: '#password-input'}));
        await passwordInput.setValue('');
        await passwordInput.blur();

        // "pozivamo" metodu
        const errorMessage = component.getRequiredFieldErrorMessage('password');

        // ocekujemo povratne vrednosti
        expect(errorMessage).toEqual('Required field');
        // proveravamo html
        const passwordFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#password-form-field'}));
        expect(await passwordFormField.getTextErrors()).toEqual(['Required field']);
    });

    it('should get required field error message - valid', async () => {
        // popunjavanje login forme
        const passwordInput = await loader.getHarness(MatInputHarness.with({selector: '#password-input'}));
        await passwordInput.setValue('admin');
        await passwordInput.blur();

        // "pozivamo" metodu
        const errorMessage = component.getRequiredFieldErrorMessage('password');

        // ocekujemo povratne vrednosti
        expect(errorMessage).toEqual('');
        // proveravamo html
        const passwordFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#password-form-field'}));
        expect(await passwordFormField.getTextErrors()).toEqual([]);
    });

});
