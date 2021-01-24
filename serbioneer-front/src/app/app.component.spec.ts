import { ComponentFixture, TestBed } from '@angular/core/testing';
import { NO_ERRORS_SCHEMA } from '@angular/core';
import { ToastrService } from 'ngx-toastr';
import { AuthenticationService } from './services/authentication.service';
import { AppComponent } from './app.component';

describe('AppComponent', () => {
  let component: AppComponent;
  let fixture: ComponentFixture<AppComponent>;
  let authService: AuthenticationService;
  let toastr: ToastrService;

  beforeEach(() => {
    let toastrMock = {
      info: jasmine.createSpy('info'),
    };
    let authenticationServiceMock = {
      autoLogin: jasmine.createSpy('autoLogin')
        .and.returnValue(false),
      startAutoLoginRefreshTokenTimer: jasmine.createSpy('startAutoLoginRefreshTokenTimer')
    };
    TestBed.configureTestingModule({
      schemas: [NO_ERRORS_SCHEMA],
      declarations: [AppComponent],
      providers: [
        { provide: ToastrService, useValue: toastrMock },
        {
          provide: AuthenticationService,
          useValue: authenticationServiceMock
        }
      ]
    });
    fixture = TestBed.createComponent(AppComponent);
    component = fixture.componentInstance;
    authService = TestBed.inject(AuthenticationService);
    toastr = TestBed.inject(ToastrService);
  });

  it('can load instance', () => {
    expect(component).toBeTruthy();
  });

  it('title has default value', () => {
    expect(component.title).toEqual('serbioneer');
  });

  it('should informe about needed login', () => {
    component.ngOnInit();

    expect(authService.autoLogin).toHaveBeenCalled();
    expect(toastr.info).toHaveBeenCalledWith('Please log in.');
  })
});
