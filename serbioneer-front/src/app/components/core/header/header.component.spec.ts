import { ComponentFixture, fakeAsync, TestBed, tick } from "@angular/core/testing";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { NavigationEnd, Router } from "@angular/router";
import { ToastrService } from "ngx-toastr";
import { BehaviorSubject, of } from "rxjs";
import { AuthenticationService } from "src/app/services/authentication.service";
import { MyProfileService } from "src/app/services/my-profile.service";
import {HarnessLoader} from '@angular/cdk/testing';
import {TestbedHarnessEnvironment} from '@angular/cdk/testing/testbed';
import {MatInputHarness} from '@angular/material/input/testing';
import { UserUpdateDTO } from "src/app/model/user-update-dto.mpdel";
import { MatFormFieldHarness} from '@angular/material/form-field/testing';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HeaderComponent } from "./header.component";
import { DebugElement } from "@angular/core";
import { By } from "@angular/platform-browser";
import { RoleGuard } from "src/app/guards/role-guard.service";

describe('HeaderComponent', () => {
    let component: HeaderComponent;
    let fixture: ComponentFixture<HeaderComponent>;
    // injektovani servisi i ostalo
    let authenticationService: any;
    let router: any;
    let location: any;
    let toastr: any;
    let loader: HarnessLoader;

    beforeEach(() => {
      const subjectMock = new BehaviorSubject<string>('ROLE_ADMIN');

      let authenticationServiceMock = {
        logout: jasmine.createSpy('logout'),
        role: subjectMock.asObservable()
      };

      let routerMock = {
          navigate: jasmine.createSpy('navigate'),
          url: 'https://localhost:4200/homepage',
          events: of(new NavigationEnd(0, 'https://localhost:4200/login-register/login', 'https://localhost:4200/homepage'))
      }

      let toastrMock = {
          info: jasmine.createSpy('info')
      }

      let locationMock = {
        path: jasmine.createSpy('path')
          .and.returnValue('/homepage')
      }

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
    })

    it('should initiliaze header for admin', fakeAsync(() => {
      component.ngOnInit();

      tick();

      expect(component.activeLink).toEqual('homepage');
      expect(component.role).toEqual('ROLE_ADMIN')

      // ROLE_ADMIN HTML
      fixture.whenStable()
        .then(() => {
          fixture.detectChanges();
          let adminBtnGroup: DebugElement = 
            fixture.debugElement.query(By.css('#admin-btn-group'));
          expect(adminBtnGroup.childNodes.length).toBe(5);
          let userDropdown: DebugElement = 
            fixture.debugElement.query(By.css('.dropdown-menu'));
          expect(userDropdown.childNodes.length).toBe(3);
        });
    }))

    it('should logout', () => {
      component.logout();
      expect(toastr.info).toHaveBeenCalledWith('Logged out successfully!');
    })

    it('should change current active link', () => {
      component.onClick('admin/view-admins');

      expect(component.activeLink).toEqual('admin/view-admins');
      expect(router.navigate).toHaveBeenCalledWith(['admin/view-admins']);
    })
})
