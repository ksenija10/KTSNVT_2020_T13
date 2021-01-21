import { HarnessLoader } from '@angular/cdk/testing';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MatInputHarness } from '@angular/material/input/testing';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { Admin } from 'src/app/model/admin.model';
import { AdminService } from 'src/app/services/admin.service';
import { NewAdminComponent } from './new-admin.component';

import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatFormFieldHarness } from '@angular/material/form-field/testing';

describe('NewAdminComponent', () => {
  let component: NewAdminComponent;
  let fixture: ComponentFixture<NewAdminComponent>;

  let adminService: AdminService;
  let router: Router;
  let toastr: ToastrService;
  let loader: HarnessLoader;

  beforeEach(() => {
    let adminServiceMock = {
      createAdmin: jasmine.createSpy('createAdmin').and.returnValue(
        of({
          email: 'new@mail.com',
          password: 'new',
          name: 'Novi',
          surname: 'Korisnik',
          dateOfBirth: new Date(2020, 0, 1),
          id: 100,
        })
      ),
    };

    let routerMock = {
      navigate: jasmine.createSpy('navigate'),
    };

    let toastrMock = {
      success: jasmine.createSpy('success'),
      error: jasmine.createSpy('error'),
    };

    TestBed.configureTestingModule({
      declarations: [NewAdminComponent],
      providers: [
        { provide: AdminService, useValue: adminServiceMock },
        { provide: Router, useValue: routerMock },
        { provide: ToastrService, useValue: toastrMock },
      ],
      imports: [
        MatDatepickerModule,
        MatNativeDateModule,
        ReactiveFormsModule,
        FormsModule,
        MatFormFieldModule,
        MatInputModule,
        BrowserAnimationsModule,
      ],
    }).compileComponents();

    fixture = TestBed.createComponent(NewAdminComponent);
    component = fixture.componentInstance;

    adminService = TestBed.inject(AdminService);
    router = TestBed.inject(Router);
    toastr = TestBed.inject(ToastrService);
    loader = TestbedHarnessEnvironment.loader(fixture);
  });

  it('shoult create new admin - success', async () => {
    const emailInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#email-input' })
    );
    await emailInput.setValue('new@mail.com');
    const passwordInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#password-input' })
    );
    await passwordInput.setValue('new');
    const confirmPasswordInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#confirm-password-input' })
    );
    await confirmPasswordInput.setValue('new');
    const nameInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#name-input' })
    );
    await nameInput.setValue('Novi');
    const surnameInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#surname-input' })
    );
    await surnameInput.setValue('Korisnik');
    const dateOfBirthInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#date-of-birth-input' })
    );
    await dateOfBirthInput.setValue('1/1/2020');

    const admin: Admin = new Admin(
      'new@mail.com',
      'new',
      'Novi',
      'Korisnik',
      new Date(2020, 0, 1)
    );

    component.onSubmit();

    expect(adminService.createAdmin).toHaveBeenCalledWith(admin);
    expect(toastr.success).toHaveBeenCalledWith('Successfully added new admin');
    expect(router.navigate).toHaveBeenCalledWith(['/view-admin']);

    expect(await emailInput.getValue()).toEqual('');
    expect(await passwordInput.getValue()).toEqual('');
    expect(await confirmPasswordInput.getValue()).toEqual('');
    expect(await nameInput.getValue()).toEqual('');
    expect(await surnameInput.getValue()).toEqual('');
    expect(await dateOfBirthInput.getValue()).toEqual('');
  });

  it('should get email error message - required', async () => {
    const emailInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#email-input' })
    );
    await emailInput.setValue('');
    await emailInput.blur();

    let errorMessage = component.getEmailErrorMessage();
    expect(errorMessage).toEqual('Required field');

    const emailFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#email-form-field' })
    );
    expect(await emailFormField.getTextErrors()).toEqual(['Required field']);
  });

  it('should get email error message - valid', async () => {
    const emailInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#email-input' })
    );
    await emailInput.setValue('admin@admin.com');
    await emailInput.blur();

    let errorMessage = component.getEmailErrorMessage();

    expect(errorMessage).toEqual('');
    const emailFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#email-form-field' })
    );
    expect(await emailFormField.getTextErrors()).toEqual([]);
  });

  it('should get required field error message - required', async () => {
    const passwordInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#password-input' })
    );
    await passwordInput.setValue('');
    await passwordInput.blur();

    let errorMessage = component.getRequiredFieldErrorMessage('password');

    expect(errorMessage).toEqual('Required field');
    const passwordFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#password-form-field' })
    );
    expect(await passwordFormField.getTextErrors()).toEqual(['Required field']);
  });

  it('should get required field error message - valid', async () => {
    const passwordInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#password-input' })
    );
    await passwordInput.setValue('admin');
    await passwordInput.blur();

    let errorMessage = component.getRequiredFieldErrorMessage('password');

    expect(errorMessage).toEqual('');
    const passwordFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#password-form-field' })
    );
    expect(await passwordFormField.getTextErrors()).toEqual([]);
  });

  it('should get passwords dont match error message', async () => {
    const passwordInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#password-input' })
    );
    await passwordInput.setValue('dont');
    const confirmPasswordInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#confirm-password-input' })
    );
    await confirmPasswordInput.setValue('match');
    await confirmPasswordInput.blur();

    let returned = component.getPasswordsMatch();
    expect(returned).toEqual('Passwords must match');

    const confirmPasswordFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#confirm-password-form-field' })
    );
    expect(await confirmPasswordFormField.getTextErrors()).toEqual([
      'Passwords must match',
    ]);
  });

  it('should not get name and surname field error message - valid field', async () => {
    const namelInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#name-input' })
    );
    await namelInput.setValue('Ksenija');
    const surnameInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#surname-input' })
    );
    await surnameInput.setValue('Prcic');
    await surnameInput.blur();

    let returned = component.getNameErrorMessage('name');
    expect(returned).toEqual('');

    const nameFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#name-form-field' })
    );
    expect(await nameFormField.getTextErrors()).toEqual([]);

    returned = component.getNameErrorMessage('surname');
    expect(returned).toEqual('');

    const surnameFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#surname-form-field' })
    );
    expect(await surnameFormField.getTextErrors()).toEqual([]);
  });

  it('should get name and surname field error message - empty field', async () => {
    const namelInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#name-input' })
    );
    await namelInput.setValue('');
    const surnameInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#surname-input' })
    );
    await surnameInput.setValue('');
    await surnameInput.blur();

    let returned = component.getNameErrorMessage('name');
    expect(returned).toEqual('Required field');

    const nameFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#name-form-field' })
    );
    expect(await nameFormField.getTextErrors()).toEqual(['Required field']);

    returned = component.getNameErrorMessage('surname');
    expect(returned).toEqual('Required field');

    const surnameFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#surname-form-field' })
    );
    expect(await surnameFormField.getTextErrors()).toEqual(['Required field']);
  });

  it('should get name and surname field error message - not capitalized', async () => {
    const namelInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#name-input' })
    );
    await namelInput.setValue('ksenija');
    const surnameInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#surname-input' })
    );
    await surnameInput.setValue('prcic');
    await surnameInput.blur();

    let returned = component.getNameErrorMessage('name');

    expect(returned).toEqual('Must start with capital letter');

    const nameFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#name-form-field' })
    );
    expect(await nameFormField.getTextErrors()).toEqual([
      'Must start with capital letter',
    ]);

    returned = component.getNameErrorMessage('surname');
    expect(returned).toEqual('Must start with capital letter');

    const surnameFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#surname-form-field' })
    );
    expect(await surnameFormField.getTextErrors()).toEqual([
      'Must start with capital letter',
    ]);
  });

  it('should get name and surname field error message - special charater', async () => {
    const namelInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#name-input' })
    );
    await namelInput.setValue('K8senija');
    const surnameInput = await loader.getHarness(
      MatInputHarness.with({ selector: '#surname-input' })
    );
    await surnameInput.setValue('P%rcic');
    await surnameInput.blur();

    let returned = component.getNameErrorMessage('name');

    expect(returned).toEqual('Cannot contain special characters or numbers');

    const nameFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#name-form-field' })
    );
    expect(await nameFormField.getTextErrors()).toEqual([
      'Cannot contain special characters or numbers',
    ]);

    returned = component.getNameErrorMessage('surname');
    expect(returned).toEqual('Cannot contain special characters or numbers');

    const surnameFormField = await loader.getHarness(
      MatFormFieldHarness.with({ selector: '#surname-form-field' })
    );
    expect(await surnameFormField.getTextErrors()).toEqual([
      'Cannot contain special characters or numbers',
    ]);
  });
});
