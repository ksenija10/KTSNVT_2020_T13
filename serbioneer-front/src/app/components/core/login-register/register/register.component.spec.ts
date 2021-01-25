import { HarnessLoader } from '@angular/cdk/testing';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatFormFieldHarness } from '@angular/material/form-field/testing';
import { MatInputModule } from '@angular/material/input';
import { MatInputHarness } from '@angular/material/input/testing';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { AuthenticatedUser } from 'src/app/model/authenticated-user.model';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { RegisterComponent } from './register.component';

describe('RegisterComponent', () => {
  let component: RegisterComponent;
  let fixture: ComponentFixture<RegisterComponent>;
  // injektovani servisi i ostalo
  let authenticationService: AuthenticationService;
  let router: Router;
  let toastr: ToastrService;
  let loader: HarnessLoader;

  beforeEach(() => {
    const authenticationServiceMock = {
      register: jasmine.createSpy('register')
        .and.returnValue(of({
          email: 'new@mail.com',
          password: 'new',
          name: 'Novi',
          surname: 'Korisnik',
          id: 55
        }))
    };

    const routerMock = {
      navigate: jasmine.createSpy('navigate')
    };

    const toastrMock = {
        success: jasmine.createSpy('success'),
        error: jasmine.createSpy('error')
    };

    TestBed.configureTestingModule({
      declarations: [RegisterComponent],
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

    fixture = TestBed.createComponent(RegisterComponent);
    component = fixture.componentInstance;
    authenticationService = TestBed.inject(AuthenticationService);
    router = TestBed.inject(Router);
    toastr = TestBed.inject(ToastrService);
    loader = TestbedHarnessEnvironment.loader(fixture);
  });

  it('should register user - success', async () => {
    // popunjavanje forme za registraciju
    const emailInput = await loader.getHarness(MatInputHarness.with({selector: '#email-input'}));
    await emailInput.setValue('new@mail.com');
    const passwordInput = await loader.getHarness(MatInputHarness.with({selector: '#password-input'}));
    await passwordInput.setValue('new');
    const repeatPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#repeat-password-input'}));
    await repeatPasswordInput.setValue('new');
    const nameInput = await loader.getHarness(MatInputHarness.with({selector: '#name-input'}));
    await nameInput.setValue('Novi');
    const surnameInput = await loader.getHarness(MatInputHarness.with({selector: '#surname-input'}));
    await surnameInput.setValue('Korisnik');

    const authUser: AuthenticatedUser =
      new AuthenticatedUser(
        'new@mail.com',
        'new',
        'Novi',
        'Korisnik'
      );

    // "pozivamo" metodu koju testiramo
    component.onSubmit();

    // sta ocekujemo da se pozvalo
    expect(authenticationService.register).toHaveBeenCalledWith(authUser);
    expect(toastr.success).toHaveBeenCalledWith('Confirmation mail sent!');
    expect(router.navigate).toHaveBeenCalledWith(['login-register/login']);

    // provera reseta forme
    expect(await emailInput.getValue()).toEqual('');
    expect(await passwordInput.getValue()).toEqual('');
    expect(await repeatPasswordInput.getValue()).toEqual('');
    expect(await nameInput.getValue()).toEqual('');
    expect(await surnameInput.getValue()).toEqual('');
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

  it('should get passwords dont match error message', async () => {
    // popunjavanje forme u htmlu
    const passwordInput = await loader.getHarness(MatInputHarness.with({selector: '#password-input'}));
    await passwordInput.setValue('dont');
    const repeatPasswordInput = await loader.getHarness(MatInputHarness.with({selector: '#repeat-password-input'}));
    await repeatPasswordInput.setValue('match');
    await repeatPasswordInput.blur();

    // "pozivamo" metode koje testiramo
    const returned = component.getPasswordsMatch();
    expect(returned).toEqual('Passwords must match');

    const repeatPasswordFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#repeat-password-form-field'}));
    expect(await repeatPasswordFormField.getTextErrors()).toEqual(['Passwords must match']);
  });

  it('should not get name and surname field error message - valid field', async () => {
    // popunjavanje forme
    const namelInput = await loader.getHarness(MatInputHarness.with({selector: '#name-input'}));
    await namelInput.setValue('Ksenija');
    const surnameInput = await loader.getHarness(MatInputHarness.with({selector: '#surname-input'}));
    await surnameInput.setValue('Prcic');
    await surnameInput.blur();

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
      await surnameInput.blur();

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
      await surnameInput.blur();

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
      await surnameInput.blur();

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
});
