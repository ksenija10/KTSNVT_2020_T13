import { ComponentFixture, TestBed } from '@angular/core/testing';
import { NO_ERRORS_SCHEMA } from '@angular/core';
import { NavigationEnd, Router } from '@angular/router';
import { LoginRegisterComponent } from './login-register.component';
import { Route } from '@angular/compiler/src/core';
import { of } from 'rxjs';

describe('LoginRegisterComponent', () => {
  let component: LoginRegisterComponent;
  let fixture: ComponentFixture<LoginRegisterComponent>;
  let router: Router;

  beforeEach(() => {
    TestBed.configureTestingModule({
      schemas: [NO_ERRORS_SCHEMA],
      declarations: [LoginRegisterComponent],
      providers: [
        { provide: Router, useValue: 
          {
            url: "login-register/login",
            events: of(new NavigationEnd(0, 'https://localhost:4200/login-register/register', 'https://localhost:4200/login-register/login'))
          }
         }
      ]
    });
    fixture = TestBed.createComponent(LoginRegisterComponent);
    component = fixture.componentInstance;
    router = TestBed.inject(Router);
  });

  it('can load instance', () => {
    expect(component).toBeTruthy();
  });

  it('ngOninit', () => {
    component.ngOnInit();
    expect(component.activeLink).toEqual("login");
  });
});
