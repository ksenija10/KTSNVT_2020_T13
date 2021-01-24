import { HarnessLoader } from "@angular/cdk/testing";
import { TestbedHarnessEnvironment } from "@angular/cdk/testing/testbed";
import { ComponentFixture, TestBed } from "@angular/core/testing";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { MatDialog } from "@angular/material/dialog";
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatInputModule } from "@angular/material/input";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { Router } from "@angular/router";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { AuthenticatedUserService } from "src/app/services/auth-user.service";
import { AuthenticationService } from "src/app/services/authentication.service";
import { CulturalSiteService } from "src/app/services/cultural-site.service";
import { ImageService } from "src/app/services/image.service";
import { RatingService } from "src/app/services/rating.service";
import { ViewCulturalSiteComponent } from "./view-cultural-site.component";

fdescribe('ViewCulturalSiteComponent', () => {
    let component: ViewCulturalSiteComponent;
    let fixture: ComponentFixture<ViewCulturalSiteComponent>;
    // injektovani servisi
    let culturalSiteService: CulturalSiteService;
    let authenticationService: AuthenticationService;
    let authUserService: AuthenticatedUserService;
    let ratingService : RatingService;
    let imageService : ImageService;
    let router: Router;
    let toastr: ToastrService;
    let newsDialog : MatDialog;
    let confirmDeleteDialog : MatDialog;
    let loader: HarnessLoader;

    // confirmation dialog mock
    let dialogRefSpyObject = jasmine.createSpyObj({
        afterClosed: of(true),
        close: null
    })
    dialogRefSpyObject.componentInstance = { body: '' };

    beforeEach(() => {
        let culturalSiteServiceMock = {
            getAllCulturalSiteNews: jasmine.createSpy('getAllCulturalSiteNews')
                .and.returnValue(of({
                    content: [ {}, {} ],
                    totalPages: 1,
                    totalElements: 2,
                    size: 2
                })),
            getAllCulturalSiteComments: jasmine.createSpy('getAllCulturalSiteComments')
                .and.returnValue(of({
                    content: [ {}, {} ],
                    totalPages: 1,
                    totalElements: 2,
                    size: 2
                })),
            getCulturalSite: jasmine.createSpy('getCulturalSite')
                .and.returnValue(of({
                    id: 1,
                    name: 'Kulturno dobro',
                    address: 'Adresa 5',
                    city: 'Grad',
                    category: 'Kategorija',
                    categoryId: 1,
                    type: 'Tip',
                    typeId: 1,
                    lat: 42,
                    lng: 20,
                    description: 'Opis',
                    rating: 5,
                    images: []
                })),
            getUserCulturalSite: jasmine.createSpy('getUserCulturalSite')
                .and.returnValue(of({
                    subscribed: true,
                    userEmail: 'prvi@user.com',
                    culturalSiteId: 1
                })),
            createComment: jasmine.createSpy('createComment')
                .and.returnValue(of({
                    id: 1,
                    name: 'Mika',
                    surname: 'Mikic',
                    culturalSiteName: 'Kulturno dobro',
                    text: 'Komentar Mikin',
                    approved: false,
                    images: []
                })),
            deleteCulturalSite: jasmine.createSpy('deleteCulturalSite')
                .and.returnValue(of({}))
        }

        let authenticationServiceMock = {
            getLoggedInUserAuthority: jasmine.createSpy('getLoggedInUserAuthority')
                .and.returnValue(of('ROLE_USER')),
            getLoggedInUserEmail: jasmine.createSpy('getLoggedInUserEmail')
                .and.returnValue(of('prvi@user.com'))
        }

        let authUserServiceMock = {
            subscribe: jasmine.createSpy('subscribe')
                .and.returnValue(of({})),
            unsubscribe: jasmine.createSpy('unsubscribe')
                .and.returnValue(of({}))
        }

        let ratingServiceMock = {
            getUserRatingForCulturalSite: jasmine.createSpy('getUserRatingForCulturalSite')
                .and.returnValue(of({
                    id: 1,
                    value: 5,
                    culturalSiteId: 1,
                    authenticatedUserId: 1
                })),
            createRating: jasmine.createSpy('createRating')
                .and.returnValue(of({
                    id: 1,
                    value: 5,
                    culturalSiteId: 1,
                    authenticatedUserId: 1
                })),
            updateRating: jasmine.createSpy('updateRating')
                .and.returnValue(of({
                    id: 1,
                    value: 5,
                    culturalSiteId: 1,
                    authenticatedUserId: 1
                }))
        }

        let imageServiceMock = {
            createForComment: jasmine.createSpy('createForComment')
                .and.returnValue(of({
                    id: 1,
                    name: 'slika'
                })),
            createForCulturalSite: jasmine.createSpy('createForCulturalSite')
                .and.returnValue(of({
                    id: 1,
                    name: 'slika'
                }))
        }

        let routerMock = {
            navigate: jasmine.createSpy('navigate'),
            url: 'cultural-site/1'
        }

        let toastrMock = {
            success: jasmine.createSpy('success'),
            error: jasmine.createSpy('error'),
            info: jasmine.createSpy('info')
        }

        let confirmationDialogMock = {
            open: jasmine.createSpy('open')
                .and.returnValue(dialogRefSpyObject)
        }

        TestBed.configureTestingModule({
            declarations: [ViewCulturalSiteComponent],
            providers: [
                { provide: CulturalSiteService, useValue: culturalSiteServiceMock },
                { provide: AuthenticationService, useValue: authenticationServiceMock },
                { provide: AuthenticatedUserService, useValue: authUserServiceMock },
                { provide: RatingService, useValue: ratingServiceMock },
                { provide: ImageService, useValue: imageServiceMock },
                { provide: Router, useValue: routerMock },
                { provide: ToastrService, useValue: toastrMock },
                { provide: MatDialog, useValue: confirmationDialogMock }
            ],
            imports: [
                ReactiveFormsModule,
                FormsModule,
                MatFormFieldModule,
                MatInputModule,
                BrowserAnimationsModule
            ]
        }).compileComponents();

        fixture = TestBed.createComponent(ViewCulturalSiteComponent);
        component = fixture.componentInstance;
        culturalSiteService = TestBed.inject(CulturalSiteService);
        authenticationService = TestBed.inject(AuthenticationService);
        authUserService = TestBed.inject(AuthenticatedUserService);
        ratingService  = TestBed.inject(RatingService);
        imageService  = TestBed.inject(ImageService);
        router = TestBed.inject(Router);
        toastr = TestBed.inject(ToastrService);
        loader = TestbedHarnessEnvironment.loader(fixture);
    })

    it('should load instance', () => {
        expect(component).toBeTruthy();
    });
})