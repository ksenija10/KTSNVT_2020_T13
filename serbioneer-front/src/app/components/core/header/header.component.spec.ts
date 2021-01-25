import { ComponentFixture, fakeAsync, TestBed, tick } from '@angular/core/testing';
import { NavigationEnd, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { BehaviorSubject, of } from 'rxjs';
import { AuthenticationService } from 'src/app/services/authentication.service';
import {HarnessLoader} from '@angular/cdk/testing';
import {TestbedHarnessEnvironment} from '@angular/cdk/testing/testbed';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HeaderComponent } from './header.component';
import { DebugElement } from '@angular/core';
import { By } from '@angular/platform-browser';

describe('HeaderComponent', () => {
    let component: HeaderComponent;
    let fixture: ComponentFixture<HeaderComponent>;
    // injektovani servisi i ostalo
    let authenticationService: AuthenticationService;
    let router: Router;
    let location: Location;
    let toastr: ToastrService;
    let loader: HarnessLoader;

    beforeEach(() => {
      const subjectMock = new BehaviorSubject<string>('ROLE_ADMIN');

      const authenticationServiceMock = {
        logout: jasmine.createSpy('logout'),
        role: subjectMock.asObservable()
      };

      const routerMock = {
          navigate: jasmine.createSpy('navigate'),
          url: 'https://localhost:4200/homepage',
          events: of(new NavigationEnd(0, 'https://localhost:4200/login-register/login', 'https://localhost:4200/homepage'))
      };

      const toastrMock = {
          info: jasmine.createSpy('info')
      };

      const locationMock = {
        path: jasmine.createSpy('path')
          .and.returnValue('/homepage')
      };

      TestBed.configureTestingModule({
          declarations: [HeaderComponent],
          providers: [
              { provide: Location, useValue: locationMock },
              { provide: AuthenticationService, useValue: authenticationServiceMock },
              { provide: Router, useValue: routerMock },
              { provide: ToastrService, useValue: toastrMock }
          ],
          imports: [
              BrowserAnimationsModule
          ]
      }).compileComponents();

      fixture = TestBed.createComponent(HeaderComponent);
      component = fixture.componentInstance;
      location = TestBed.inject(Location);
      authenticationService = TestBed.inject(AuthenticationService);
      router = TestBed.inject(Router);
      toastr = TestBed.inject(ToastrService);
      loader = TestbedHarnessEnvironment.loader(fixture);
    });

    it('should initiliaze header for admin', fakeAsync(() => {
      component.ngOnInit();

      tick();

      expect(component.activeLink).toEqual('homepage');
      expect(component.role).toEqual('ROLE_ADMIN');

      // ROLE_ADMIN HTML
      fixture.whenStable()
        .then(() => {
          fixture.detectChanges();
          const adminBtnGroup: DebugElement =
            fixture.debugElement.query(By.css('#admin-btn-group'));
          expect(adminBtnGroup.childNodes.length).toBe(5);
          const userDropdown: DebugElement =
            fixture.debugElement.query(By.css('.dropdown-menu'));
          expect(userDropdown.childNodes.length).toBe(3);
        });
    }));

    it('should logout', () => {
      component.logout();
      expect(toastr.info).toHaveBeenCalledWith('Logged out successfully!');
    });

    it('should change current active link', () => {
      component.onClick('admin/view-admins');

      expect(component.activeLink).toEqual('admin/view-admins');
      expect(router.navigate).toHaveBeenCalledWith(['admin/view-admins']);
    });
});
