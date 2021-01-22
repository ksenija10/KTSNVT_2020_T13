import { ComponentFixture, TestBed } from '@angular/core/testing';
import { HarnessLoader } from '@angular/cdk/testing';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { of } from 'rxjs';
import { ToastrService } from 'ngx-toastr';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HomepageComponent } from './homepage.component';
import { CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { MatChipsModule } from '@angular/material/chips';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { ActivatedRoute } from '@angular/router';

describe('HomepageComponent', () => {
  let component: HomepageComponent;
  let fixture: ComponentFixture<HomepageComponent>;
  //injektovani servisi i ostalo
  let culturalSiteCategoryService: any;
  let culturalSiteService: any;
  let toastr: any;
  let loader: HarnessLoader;

  beforeEach(() => {
    let culturalSiteCategoryServiceMock = {
      getAllCulturalSiteCategorys: jasmine
        .createSpy('getAllCulturalSiteCategorys')
        .and.returnValue(
          of([
            {
              id: 1,
              name: 'Manifestacija',
            },
            {
              id: 2,
              name: 'Institucija',
            },
          ])
        ),
    };

    let culturalSiteServiceMock = {
      findAllLocations: jasmine
        .createSpy('findAllLocations')
        .and.returnValue(of(['Novi Sad', 'Sabac'])),
      findAllByPage: jasmine
        .createSpy('findAllByPage')
        .withArgs(0, 5)
        .and.returnValue(
          of({
            content: [
              {
                name: 'Biblioteka sabacka',
                category: 'Institucija',
                address: 'Neka adresa',
                city: 'Sabac',
              },
              {
                name: 'Srpsko narodno pozoriste',
                category: 'Institucija',
                address: 'Neka adresa2',
                city: 'Novi Sad',
              },
            ],
            totalPages: 1,
            totalElements: 2,
            size: 2,
          })
        ),
      filterByPage: jasmine.createSpy('filterByPage').and.returnValue(
        of({
          content: [
            {
              name: 'Biblioteka sabacka',
              category: 'Institucija',
              address: 'Neka adresa',
              city: 'Sabac',
            },
            {
              name: 'Srpsko narodno pozoriste',
              category: 'Institucija',
              address: 'Neka adresa2',
              city: 'Novi Sad',
            },
          ],
          totalPages: 1,
          totalElements: 2,
          size: 2,
        })
      ),
    };

    let toastrMock = {
      success: jasmine.createSpy('success'),
      error: jasmine.createSpy('error'),
    };

    let authenticationServiceMock = {
      getLoggedInUserEmail: jasmine
        .createSpy('getLoggedInUserEmail')
        .and.returnValue('user.email@gmail.com'),
    };

    let activatedRouteMock = {
      snapshot: {
        data: {
          subscribedView: false,
          subscribedMap: false,
        },
      },
    };

    TestBed.configureTestingModule({
      declarations: [HomepageComponent],
      providers: [
        {
          provide: CulturalSiteCategoryService,
          useValue: culturalSiteCategoryServiceMock,
        },
        { provide: CulturalSiteService, useValue: culturalSiteServiceMock },
        { provide: ToastrService, useValue: toastrMock },
        { provide: AuthenticationService, useValue: authenticationServiceMock },
        { provide: ActivatedRoute, useValue: activatedRouteMock },
      ],
      imports: [
        ReactiveFormsModule,
        FormsModule,
        MatFormFieldModule,
        MatChipsModule,
        MatInputModule,
        MatAutocompleteModule,
        BrowserAnimationsModule,
      ],
    }).compileComponents();

    fixture = TestBed.createComponent(HomepageComponent);
    component = fixture.componentInstance;
    culturalSiteCategoryService = TestBed.inject(CulturalSiteCategoryService);
    culturalSiteService = TestBed.inject(CulturalSiteService);
    toastr = TestBed.inject(ToastrService);
    loader = TestbedHarnessEnvironment.loader(fixture);
  });

  it('should fetch subscribed sites on init', async () => {
    component.ngOnInit();

    expect(culturalSiteService.findAllByPage).toHaveBeenCalledWith(0, 5);

    fixture.whenStable().then(async () => {
      expect(component.dataSource.content.length).toBe(2);
    });
  });

  it('should do filter on subscribed sites', async () => {
    component.ngOnInit();
    component.pageEvent.pageIndex = 0;
    component.pageEvent.pageSize = 5;
    component.culturalSiteCategorys = [];
    component.name = '';
    component.location = '';

    component.onFilter();

    expect(culturalSiteService.filterByPage).toHaveBeenCalledWith(0, 5, {
      categoryNames: [],
      culturalSiteName: '',
      location: '',
    });
    fixture.whenStable().then(async () => {
      expect(component.dataSource.content.length).toBe(2);
    });
  });
});
