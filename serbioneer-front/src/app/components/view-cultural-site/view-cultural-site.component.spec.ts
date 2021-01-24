import { HarnessLoader } from "@angular/cdk/testing";
import { TestbedHarnessEnvironment } from "@angular/cdk/testing/testbed";
import { ComponentFixture, TestBed } from "@angular/core/testing";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { MatDialog } from "@angular/material/dialog";
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatInputModule } from "@angular/material/input";
import { PageEvent } from "@angular/material/paginator";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { Router } from "@angular/router";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { SubscribedCulturalSiteDTO } from "src/app/model/cultural-site.model";
import { AuthenticatedUserService } from "src/app/services/auth-user.service";
import { AuthenticationService } from "src/app/services/authentication.service";
import { CulturalSiteService } from "src/app/services/cultural-site.service";
import { ImageService } from "src/app/services/image.service";
import { RatingCreateDTO, RatingService } from "src/app/services/rating.service";
import { ViewCulturalSiteComponent } from "./view-cultural-site.component";
import { MatInputHarness } from "@angular/material/input/testing";

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
        }

        let authenticationServiceMock = {
            getLoggedInUserAuthority: jasmine.createSpy('getLoggedInUserAuthority')
                .and.returnValue('ROLE_USER'),
            getLoggedInUserEmail: jasmine.createSpy('getLoggedInUserEmail')
                .and.returnValue('prvi@user.com')
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
        // izaziva inicijalni data binding
        fixture.detectChanges();
        newsDialog = TestBed.inject(MatDialog);
    })

    it('should load instance', () => {
        expect(component).toBeTruthy();
    });

    it('should get cultural site id from url', () => {
        expect(component.culturalSiteId).toEqual(1);
    })

    it('should setup for user role', () => {
        expect(component.userIsLogged).toBeTruthy();
    })

    it('should fetch news for cultural site', () => {
        component.fetchNews(1);

        expect(culturalSiteService.getAllCulturalSiteNews).toHaveBeenCalledWith(1, 0, 1);
        expect(component.news.content.length).toEqual(2);
        expect(component.news.totalPages).toEqual(1);
        expect(component.news.totalElements).toEqual(2);
        expect(component.news.size).toEqual(2);
    })

    it('should fetch comments for cultural site', () => {
        component.fetchComments(1);

        expect(culturalSiteService.getAllCulturalSiteComments).toHaveBeenCalledWith(1, 0, 1);
        expect(component.comments.content.length).toEqual(2);
        expect(component.comments.totalPages).toEqual(1);
        expect(component.comments.totalElements).toEqual(2);
        expect(component.comments.size).toEqual(2);
    })

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
        const subscribedCulturalSiteDTO : SubscribedCulturalSiteDTO = 
            new SubscribedCulturalSiteDTO(
                false, 'prvi@user.com', 1);
        expect(culturalSiteService.getUserCulturalSite).toHaveBeenCalledWith(subscribedCulturalSiteDTO);
        expect(component.buttonValue).toEqual('Unsubscribe');
        // poziv dobavljanja vesti
        expect(culturalSiteService.getAllCulturalSiteNews).toHaveBeenCalledWith(1, 0, 1);
        // poziv dobavljanja komentara
        expect(culturalSiteService.getAllCulturalSiteComments).toHaveBeenCalledWith(1, 0, 1);
    })

    it('should change news pagination', () => {
        let event: PageEvent = new PageEvent();
        event.pageIndex = 1;
        event.pageSize = 2;

        component.onPaginateChangeNews(event);

        expect(component.page).toEqual(event.pageIndex);
        expect(component.size).toEqual(event.pageSize);
        expect(culturalSiteService.getAllCulturalSiteNews).toHaveBeenCalledWith(1, event.pageIndex, event.pageSize);
    })

    it('should change comment pagination', () => {
        let event: PageEvent = new PageEvent();
        event.pageIndex = 0;
        event.pageSize = 1;

        component.onPaginateChangeComments(event);

        expect(component.page).toEqual(event.pageIndex);
        expect(component.size).toEqual(event.pageSize);
        expect(culturalSiteService.getAllCulturalSiteNews).toHaveBeenCalledWith(1, event.pageIndex, event.pageSize);
    })

    it('should set logged user authority', () => {
        component.loggedUser();
        expect(authenticationService.getLoggedInUserAuthority).toHaveBeenCalled();
        expect(component.adminIsLogged).toBeFalsy();
        expect(component.userIsLogged).toBeTruthy();
    })

    it('should fetch user rating and subscription', () => {
        component.loggedSubscribedUser();

        // fetch user rating
        expect(ratingService.getUserRatingForCulturalSite).toHaveBeenCalledWith(1, 'prvi@user.com');
        expect(component.initialStarRating).toEqual(5);
        // fetch subscription
        const subscribedCulturalSiteDTO : SubscribedCulturalSiteDTO = 
            new SubscribedCulturalSiteDTO(
                false, 'prvi@user.com', 1);
        expect(culturalSiteService.getUserCulturalSite).toHaveBeenCalledWith(subscribedCulturalSiteDTO);
        expect(component.buttonValue).toEqual('Unsubscribe');
    })

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
    })

    it('should change user subscription to cultural site - subscribe', () => {
        component.buttonValue = 'Subscribe';
        component.onChangeSubscription();

        expect(authUserService.subscribe).toHaveBeenCalledWith(1);
        expect(toastr.success).toHaveBeenCalledWith('Successfully subscribed to cultural site!');
        expect(component.buttonValue).toEqual('Unsubscribe');
    })

    it('should change user subscription to cultural site - unsubscribe', () => {
        component.onChangeSubscription();

        expect(authUserService.unsubscribe).toHaveBeenCalledWith(1);
        expect(toastr.info).toHaveBeenCalledWith('Successfully unsubscribed from cultural site. Sad to see you leave.');
        expect(component.buttonValue).toEqual('Subscribe');
    })

    it('should not get text error message', ( async () => {
        component.myForm.value.text = "Sabacka Biblioteka was cool."
        component.myForm.controls['text'].setErrors(null);
      
        let message = component.getTextErrorMessage();
        
        expect(component.myForm.invalid).toBeFalsy();
        expect(component.myForm.controls['text'].hasError('required')).toBeFalsy()
        expect(message).toEqual('');
    }))

    it('should get text error message', ( async () => {
        component.myForm.controls['text'].markAsTouched();
        
        let message = component.getTextErrorMessage();
        
        expect(component.myForm.invalid).toBeTruthy();
        expect(component.myForm.controls['text'].hasError('required')).toBeTruthy()
        expect(message).toEqual('Required field');
    }))

    it('should delete cultural site', ( () => {
        component.ngOnInit();

        component.deleteCulturalSite();

        expect(culturalSiteService.deleteCulturalSite).toHaveBeenCalledWith(1);
        expect(toastr.success).toHaveBeenCalledWith('Successfully deleted cultural site!');
        expect(router.navigate).toHaveBeenCalledWith(['homepage']);
    }))

    it('should edit cultural site', ( async () => {
        component.editCulturalSite();

        expect(router.navigate).toHaveBeenCalledWith(['edit-cultural-site/1']);
    }))

    it('should submit images', ( async () => {
        component.ngOnInit();
        component.newImageFiles = [{name: 'image1', content: '1'}];
        component.culturalSite.images = [];

        component.submitImages();

        expect(imageService.createForCulturalSite).toHaveBeenCalledWith(1, {name: 'image1', content: '1'});
        expect(component.newImages.length).toEqual(0);
        expect(component.newImageFiles.length).toEqual(0);
        expect(component.addNewImages).toEqual(false);
        expect(component.culturalSite.images.length).toEqual(1);

        expect(toastr.success).toHaveBeenCalledOnceWith('Successfully added image for cultural site!');
    }))

    it('should emit event for loading added images for cultural site', ( async () => {
        let event = {
            target: {
                files: [
                    new Blob([''], { type: 'text/html' }),
                    new Blob([''], { type: 'text/html' })
                ]
            }
        }

        component.newImageFiles = [];
        component.ngOnInit();

        component.onNewImageChange(event);

        expect(component.newImageFiles.length).toEqual(2);
    }))

    it('should add comments', ( () => {
        component.ngOnInit();
        component.addNewComment = false;

        //TODO
        /*const textInput = await loader.getHarness(
            MatInputHarness.with({ selector: '#new-comment-input' })
        );
        await textInput.setValue('Previous comment');*/

        component.addComments();

        expect(component.addNewComment).toEqual(true);
        expect(component.images.length).toEqual(0);
        //expect(await textInput.getValue()).toEqual('');
    }))

    it('should add images', ( async () => {
        component.ngOnInit();
        component.addNewImages = false;

        component.addImages();

        expect(component.addNewImages).toEqual(true);
        expect(component.newImages.length).toEqual(0);
        expect(component.newImageFiles.length).toEqual(0);
    }))

    it('should open dialog', ( async () => {
        component.ngOnInit();
        
        component.openDialog();

        expect(newsDialog.open).toHaveBeenCalled();
        expect(culturalSiteService.getAllCulturalSiteNews).toHaveBeenCalled();
    }))

    it('should create new comment', ( async () => {
        component.myForm.setValue({
            text: "Sabacka Biblioteka was cool.",
            file: "",
            fileSource: {}
          });
        component.culturalSite = {
            id: 1
        }
        component.files = [{}]
        component.submit();

        expect(culturalSiteService.createComment).toHaveBeenCalledWith(1, "Sabacka Biblioteka was cool.");
        expect(imageService.createForComment).toHaveBeenCalled();
        expect(component.images.length).toEqual(0);
        expect(component.files.length).toEqual(0);
        expect(component.addNewComment).toEqual(false);
        expect(culturalSiteService.getAllCulturalSiteComments).toHaveBeenCalled();
        expect(toastr.success).toHaveBeenCalledOnceWith('Successfully reviewed cultural site!\n' +
                                                        'Your review will be visible after approval.');
        expect(component.addNewComment).toEqual(false);
        //TODO reset forme
    }))

    it('should emit event for loading added images for comment', ( async () => {
        let event = {
            target: {
                files: [
                    new Blob([''], { type: 'text/html' }),
                    new Blob([''], { type: 'text/html' })
                ]
            }
        }

        component.files = [];
        component.ngOnInit();

        component.onFileChange(event);

        expect(component.files.length).toEqual(2);
    }))

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
    }))

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
    }))
})