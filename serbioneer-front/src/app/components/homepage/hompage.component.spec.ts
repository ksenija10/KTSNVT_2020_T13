import { ComponentFixture, TestBed } from "@angular/core/testing";
import {HarnessLoader} from '@angular/cdk/testing';
import {TestbedHarnessEnvironment} from '@angular/cdk/testing/testbed';
import { of } from "rxjs";
import { ToastrService } from "ngx-toastr";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatInputModule } from "@angular/material/input";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { HomepageComponent } from "./homepage.component";
import { CulturalSiteCategoryService } from "src/app/services/cultural-site-category.service";
import { CulturalSiteService } from "src/app/services/cultural-site.service";
import { MatChipsModule } from '@angular/material/chips';
import { MatAutocompleteModule } from '@angular/material/autocomplete';

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
            getAllCulturalSiteCategorys: jasmine.createSpy('getAllCulturalSiteCategorys')
                .and.returnValue(of(
                    [{
                        id: 1,
                        name: 'Manifestacija'
                    }, 
                    {
                        id: 2,
                        name: 'Institucija'
                    }]))
        }

        let culturalSiteServiceMock = {
            findAllLocations: jasmine.createSpy('findAllLocations')
                .and.returnValue(of(
                    [
                        'Novi Sad', 'Sabac'
                    ]
                )),
            findAllByPage: jasmine.createSpy('findAllByPage')
            .and.returnValue(of(
                [
                    {
                        content: [
                            {
                                name: 'Biblioteka sabacka',
                                category: 'Institucija',
                                address: 'Neka adresa',
                                city: 'Sabac'
                            },
                            {
                                name: 'Srpsko narodno pozoriste',
                                category: 'Institucija',
                                address: 'Neka adresa2',
                                city: 'Novi Sad'
                            }
                        ],
                        totalPages: 1,
                        totalElements: 2,
                        size: 2
                    }
                ]
            )),
            filterByPage: jasmine.createSpy('filterByPage')
            .and.returnValue(of(
                [
                    {
                        content: [
                            {
                                name: 'Biblioteka sabacka',
                                category: 'Institucija',
                                address: 'Neka adresa',
                                city: 'Sabac'
                            },
                            {
                                name: 'Srpsko narodno pozoriste',
                                category: 'Institucija',
                                address: 'Neka adresa2',
                                city: 'Novi Sad'
                            }
                        ],
                        totalPages: 1,
                        totalElements: 2,
                        size: 2
                    }
                ]
            ))
        };

        let toastrMock = {
            success: jasmine.createSpy('success'),
            error: jasmine.createSpy('error')
        };

        TestBed.configureTestingModule({
            declarations: [HomepageComponent],
            providers: [
                { provide: CulturalSiteCategoryService, useValue: culturalSiteCategoryServiceMock },
                { provide: CulturalSiteService, useValue: culturalSiteServiceMock },
                { provide: ToastrService, useValue: toastrMock }
            ],
            imports: [
                ReactiveFormsModule,
                FormsModule,
                MatFormFieldModule,
                MatChipsModule,
                MatInputModule,
                MatAutocompleteModule,
                BrowserAnimationsModule
            ]
        }).compileComponents();

        fixture = TestBed.createComponent(HomepageComponent);
        component = fixture.componentInstance;
        culturalSiteCategoryService = TestBed.inject(CulturalSiteCategoryService);
        culturalSiteService = TestBed.inject(CulturalSiteService);
        toastr = TestBed.inject(ToastrService);
        loader = TestbedHarnessEnvironment.loader(fixture);
    })



})
