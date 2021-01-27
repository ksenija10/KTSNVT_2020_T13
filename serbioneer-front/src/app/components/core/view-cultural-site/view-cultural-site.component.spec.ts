import { HarnessLoader } from '@angular/cdk/testing';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { SubscribedCulturalSiteDTO } from 'src/app/model/cultural-site.model';
import { AuthenticatedUserService } from 'src/app/services/auth-user.service';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { ImageService } from 'src/app/services/image.service';
import { RatingCreateDTO, RatingService } from 'src/app/services/rating.service';
import { ViewCulturalSiteComponent } from './view-cultural-site.component';

fdescribe('ViewCulturalSiteComponent', () => {
    let component: ViewCulturalSiteComponent;
    let fixture: ComponentFixture<ViewCulturalSiteComponent>;
    // injektovani servisi
    let culturalSiteService: CulturalSiteService;
    let authenticationService: AuthenticationService;
    let authUserService: AuthenticatedUserService;
    let ratingService: RatingService;
    let imageService: ImageService;
    let router: Router;
    let toastr: ToastrService;
    let newsDialog: MatDialog;
    let loader: HarnessLoader;

    // confirmation dialog mock
    const dialogRefSpyObject = jasmine.createSpyObj({
        afterClosed: of(true),
        close: null
    });
    dialogRefSpyObject.componentInstance = { body: '' };

    beforeEach(() => {
        const culturalSiteServiceMock = {
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
                    categoryType: 'Tip',
                    categoryTypeId: 1,
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
        };

        const authenticationServiceMock = {
            getLoggedInUserAuthority: jasmine.createSpy('getLoggedInUserAuthority')
                .and.returnValue('ROLE_USER'),
            getLoggedInUserEmail: jasmine.createSpy('getLoggedInUserEmail')
                .and.returnValue('prvi@user.com')
        };

        const authUserServiceMock = {
            subscribe: jasmine.createSpy('subscribe')
                .and.returnValue(of({})),
            unsubscribe: jasmine.createSpy('unsubscribe')
                .and.returnValue(of({}))
        };

        const ratingServiceMock = {
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
        };

        const imageServiceMock = {
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
        };

        const routerMock = {
            navigate: jasmine.createSpy('navigate'),
            url: 'cultural-site/1'
        };

        const toastrMock = {
            success: jasmine.createSpy('success'),
            error: jasmine.createSpy('error'),
            info: jasmine.createSpy('info')
        };

        const confirmationDialogMock = {
            open: jasmine.createSpy('open')
                .and.returnValue(dialogRefSpyObject)
        };

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
        // izaziva inicijalni data binding
        fixture.detectChanges();
        newsDialog = TestBed.inject(MatDialog);
    });

    it('should load instance', () => {
        expect(component).toBeTruthy();
    });

    it('should get cultural site id from url', () => {
        expect(component.culturalSiteId).toEqual(1);
    });

    it('should setup for user role', () => {
        expect(component.userIsLogged).toBeTruthy();
    });

    it('should fetch cultural site on init', () => {
        component.ngOnInit();

        expect(culturalSiteService.getCulturalSite).toHaveBeenCalledWith(1);
        expect(component.culturalSite.id).toEqual(1);
        expect(component.culturalSite.name).toEqual('Kulturno dobro');
        expect(component.culturalSite.address).toEqual('Adresa 5');
        expect(component.culturalSite.city).toEqual('Grad');
        expect(component.culturalSite.category).toEqual('Kategorija');
        expect(component.culturalSite.categoryId).toEqual(1);
        expect(component.culturalSite.categoryType).toEqual('Tip');
        expect(component.culturalSite.categoryTypeId).toEqual(1);
        expect(component.culturalSite.lat).toEqual(42);
        expect(component.culturalSite.lng).toEqual(20);
        expect(component.culturalSite.description).toEqual('Opis');
        expect(component.culturalSite.rating).toEqual(5);
        expect(component.culturalSite.images).toEqual([]);
        // provera za usera -> dobavljanje rejtinga i pretplate (ako postoje)
        expect(authenticationService.getLoggedInUserEmail).toHaveBeenCalled();
        // fetch user rating
        expect(ratingService.getUserRatingForCulturalSite).toHaveBeenCalledWith(1, 'prvi@user.com');
        expect(component.initialStarRating).toEqual(5);
        // fetch subscription
        const subscribedCulturalSiteDTO: SubscribedCulturalSiteDTO =
            new SubscribedCulturalSiteDTO(
                false, 'prvi@user.com', 1);
        expect(culturalSiteService.getUserCulturalSite).toHaveBeenCalledWith(subscribedCulturalSiteDTO);
        expect(component.buttonValue).toEqual('Unsubscribe');
    });

    it('should set logged user authority', () => {
        component.loggedUser();
        expect(authenticationService.getLoggedInUserAuthority).toHaveBeenCalled();
        expect(component.adminIsLogged).toBeFalsy();
        expect(component.userIsLogged).toBeTruthy();
    });

    it('should fetch user rating and subscription', () => {
        component.loggedSubscribedUser();

        // fetch user rating
        expect(ratingService.getUserRatingForCulturalSite).toHaveBeenCalledWith(1, 'prvi@user.com');
        expect(component.initialStarRating).toEqual(5);
        // fetch subscription
        const subscribedCulturalSiteDTO: SubscribedCulturalSiteDTO =
            new SubscribedCulturalSiteDTO(
                false, 'prvi@user.com', 1);
        expect(culturalSiteService.getUserCulturalSite).toHaveBeenCalledWith(subscribedCulturalSiteDTO);
        expect(component.buttonValue).toEqual('Unsubscribe');
    });

    it('should fetch user rating', () => {
        const rating = new RatingCreateDTO(1, 5, 1, 1);

        component.fetchUserRating(1, 'prvi@user.com');

        expect(ratingService.getUserRatingForCulturalSite).toHaveBeenCalledWith(1, 'prvi@user.com');
        expect(component.initialStarRating).toEqual(5);
        expect(component.starRating.id).toEqual(1);
        expect(component.starRating.value).toEqual(5);
        expect(component.starRating.culturalSiteId).toEqual(1);
        expect(component.starRating.authenticatedUserId).toEqual(1);
        expect(component.initialStarRating).toEqual(5);
    });

    it('should change user subscription to cultural site - subscribe', () => {
        component.buttonValue = 'Subscribe';
        component.onChangeSubscription();

        expect(authUserService.subscribe).toHaveBeenCalledWith(1);
        expect(toastr.success).toHaveBeenCalledWith('Successfully subscribed to cultural site!');
        expect(component.buttonValue).toEqual('Unsubscribe');
    });

    it('should change user subscription to cultural site - unsubscribe', () => {
        component.onChangeSubscription();

        expect(authUserService.unsubscribe).toHaveBeenCalledWith(1);
        expect(toastr.info).toHaveBeenCalledWith('Successfully unsubscribed from cultural site. Sad to see you leave.');
        expect(component.buttonValue).toEqual('Subscribe');
    });

    it('should delete cultural site', ( () => {
        component.ngOnInit();

        component.deleteCulturalSite();

        expect(culturalSiteService.deleteCulturalSite).toHaveBeenCalledWith(1);
        expect(toastr.success).toHaveBeenCalledWith('Successfully deleted cultural site!');
        expect(router.navigate).toHaveBeenCalledWith(['homepage']);
    }));

    it('should edit cultural site', ( async () => {
        component.editCulturalSite();

        expect(router.navigate).toHaveBeenCalledWith(['admin/edit-cultural-site/1']);
    }));

    it('should open dialog', ( async () => {
        component.ngOnInit();

        component.openDialog();

        expect(newsDialog.open).toHaveBeenCalled();
    }));

    it('should create rating', ( async () => {
        component.ngOnInit();
        component.initialStarRating = 0;
        component.starRating.value = 5;
        component.culturalSite.id = 1;

        component.onRatingChange();

        expect(ratingService.createRating).toHaveBeenCalledOnceWith(1, 5);
        expect(component.initialStarRating).toEqual(5);
        expect(component.starRating.id).toEqual(1);
        expect(component.starRating.value).toEqual(5);
        expect(component.starRating.culturalSiteId).toEqual(1);
        expect(component.starRating.authenticatedUserId).toEqual(1);

        expect(culturalSiteService.getCulturalSite).toHaveBeenCalledWith(1);
        expect(component.culturalSite.id).toEqual(1);
        expect(component.culturalSite.name).toEqual('Kulturno dobro');
        expect(component.culturalSite.categoryId).toEqual(1);
        expect(component.culturalSite.category).toEqual('Kategorija');
        expect(component.culturalSite.categoryTypeId).toEqual(1);
        expect(component.culturalSite.categoryType).toEqual('Tip');
        expect(component.culturalSite.lat).toEqual(42);
        expect(component.culturalSite.lng).toEqual(20);
        expect(component.culturalSite.address).toEqual('Adresa 5');
        expect(component.culturalSite.city).toEqual('Grad');
        expect(component.culturalSite.description).toEqual('Opis');
        expect(component.culturalSite.rating).toEqual(5);
    }));

    it('should update rating', ( async () => {
        component.ngOnInit();
        component.initialStarRating = 3;
        component.starRating = {
            id: 1,
            value: 5,
            culturalSiteId: 1,
            authenticatedUserId: 1
        };
        component.culturalSite.id = 1;

        component.onRatingChange();

        expect(ratingService.updateRating).toHaveBeenCalledOnceWith(1, 5, 1);
        expect(component.initialStarRating).toEqual(5);

        expect(culturalSiteService.getCulturalSite).toHaveBeenCalledWith(1);
        expect(component.culturalSite.id).toEqual(1);
        expect(component.culturalSite.name).toEqual('Kulturno dobro');
        expect(component.culturalSite.categoryId).toEqual(1);
        expect(component.culturalSite.category).toEqual('Kategorija');
        expect(component.culturalSite.categoryTypeId).toEqual(1);
        expect(component.culturalSite.categoryType).toEqual('Tip');
        expect(component.culturalSite.lat).toEqual(42);
        expect(component.culturalSite.lng).toEqual(20);
        expect(component.culturalSite.address).toEqual('Adresa 5');
        expect(component.culturalSite.city).toEqual('Grad');
        expect(component.culturalSite.description).toEqual('Opis');
        expect(component.culturalSite.rating).toEqual(5);
    }));
});