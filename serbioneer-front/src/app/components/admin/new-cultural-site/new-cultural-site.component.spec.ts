import { HarnessLoader } from '@angular/cdk/testing';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatFormFieldHarness } from '@angular/material/form-field/testing';
import { MatInputModule } from '@angular/material/input';
import { MatInputHarness } from '@angular/material/input/testing';
import { MatSelectModule } from '@angular/material/select';
import { MatSelectHarness } from '@angular/material/select/testing';
import { By } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { CulturalSite } from 'src/app/model/cultural-site.model';
import { CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { ImageService } from 'src/app/services/image.service';
import { NewCulturalSiteComponent } from './new-cultural-site.component';

describe('NewCulturalSiteComponent - Add Site', () => {
    let component: NewCulturalSiteComponent;
    let fixture: ComponentFixture<NewCulturalSiteComponent>;
    // injektovani servisi
    let culturalSiteService: CulturalSiteService;
    let culturalSiteCategoryService: CulturalSiteCategoryService;
    let imageService: ImageService;
    let toastr: ToastrService;
    let router: Router;
    let loader: HarnessLoader;

    beforeEach(() => {
        const culturalSiteServiceMock = {
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
            updateCulturalSite: jasmine.createSpy('updateCulturalSite')
                .and.returnValue(of({
                    id: 1,
                    name: 'Izmenjeno kulturno dobro',
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
            createCulturalSite: jasmine.createSpy('createCulturalSite')
                .and.returnValue(of({
                    id: 2,
                    name: 'Novo kulturno dobro',
                    address: 'Adresa 5',
                    city: 'Grad',
                    category: 'Kategorija',
                    categoryId: 1,
                    categoryType: 'Tip',
                    categoryTypeId: 1,
                    lat: 42,
                    lng: 20,
                    description: '',
                    rating: 0,
                    images: []
                }))
        };

        const culturalSiteCategoryServiceMock = {
            getAllCulturalSiteCategorys: jasmine.createSpy('getAllCulturalSiteCategorys')
                .and.returnValue(of([
                    {
                        id: 1,
                        name: 'Institucija'
                    },
                    {
                        id: 2,
                        name: 'Manifestacija'
                    }
                ])),
            getAllCategoryTypes: jasmine.createSpy('getAllCategoryTypes')
                .and.returnValue(of([
                    {
                        id: 1,
                        name: 'Biblioteka'
                    },
                    {
                        id: 2,
                        name: 'Pozoriste'
                    }
                ]))
        };

        const imageServiceMock = {
            createForCulturalSite: jasmine.createSpy('createForCulturalSite')
                .and.returnValue(of({
                    id: 1,
                    name: 'slika'
                }))
        };

        const toastrMock = {
            success: jasmine.createSpy('success'),
            error: jasmine.createSpy('error')
        };

        const routerMock = {
            navigate: jasmine.createSpy('navigate'),
            url: 'new-cultural-site'
        };

        TestBed.configureTestingModule({
            declarations: [NewCulturalSiteComponent],
            providers: [
                { provide: CulturalSiteService, useValue: culturalSiteServiceMock },
                { provide: CulturalSiteCategoryService, useValue: culturalSiteCategoryServiceMock },
                { provide: ImageService, useValue: imageServiceMock },
                { provide: ToastrService, useValue: toastrMock },
                { provide: Router, useValue: routerMock }
            ],
            imports: [
                ReactiveFormsModule,
                FormsModule,
                MatFormFieldModule,
                MatInputModule,
                MatSelectModule,
                BrowserAnimationsModule
            ]
        }).compileComponents();

        fixture = TestBed.createComponent(NewCulturalSiteComponent);
        component = fixture.componentInstance;
        culturalSiteService = TestBed.inject(CulturalSiteService);
        culturalSiteCategoryService = TestBed.inject(CulturalSiteCategoryService);
        imageService = TestBed.inject(ImageService);
        toastr = TestBed.inject(ToastrService);
        router = TestBed.inject(Router);
        loader = TestbedHarnessEnvironment.loader(fixture);
        // izaziva inicijalni data binding
        fixture.detectChanges();
    });

    it('should load instance', () => {
        expect(component).toBeTruthy();
        expect(isNaN(component.editCulturalSiteId)).toBeTruthy();
    });

    it('should display correct title', () => {
        component.ngOnInit();
        const formTitle = fixture.debugElement.query(By.css('#cultural-site-form-title'));
        expect(formTitle.nativeElement.textContent).toEqual('Add new cultural site');
        const formBtn = fixture.debugElement.query(By.css('#create-edit-site-btn'));
        expect(formBtn.nativeElement.textContent).toEqual(' Create ');
    });

    it('should load all cultural site categories', () => {
        component.ngOnInit();
        expect(culturalSiteCategoryService.getAllCulturalSiteCategorys).toHaveBeenCalled();
        expect(component.allCategoriesModel.length).toEqual(2);
        expect(component.allCategoriesModel[0].id).toEqual(1);
        expect(component.allCategoriesModel[0].name).toEqual('Institucija');
        expect(component.allCategoriesModel[1].id).toEqual(2);
        expect(component.allCategoriesModel[1].name).toEqual('Manifestacija');
        expect(component.categoryModel.id).toEqual(1);
        expect(component.categoryModel.name).toEqual('Institucija');
        expect(culturalSiteCategoryService.getAllCategoryTypes).toHaveBeenCalledWith(1);
        expect(component.allCategoryTypesModel.length).toEqual(2);
        expect(component.allCategoryTypesModel[0].id).toEqual(1);
        expect(component.allCategoryTypesModel[0].name).toEqual('Biblioteka');
        expect(component.allCategoryTypesModel[1].id).toEqual(2);
        expect(component.allCategoryTypesModel[1].name).toEqual('Pozoriste');
        // nije dobavljao kulturno dobro (jer nije edit mode)
        expect(culturalSiteService.getCulturalSite).toHaveBeenCalledTimes(0);
    });

    it('should get required field error message - empty field', async () => {
        expect(component.newCulturalSiteForm.invalid).toBeTruthy();
        // popunjavanje forme
        const culturalSiteNameInput = await loader.getHarness(MatInputHarness.with({selector: '#name-input'}));
        await culturalSiteNameInput.setValue('');
        await culturalSiteNameInput.blur();
        let returned = component.getRequiredFieldErrorMessage('name');
        expect(returned).toEqual('Required field');
        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual(['Required field']);
        expect(component.newCulturalSiteForm.invalid).toBeTruthy();

        const culturalSiteAddressInput = await loader.getHarness(MatInputHarness.with({selector: '#address-input'}));
        await culturalSiteAddressInput.setValue('');
        await culturalSiteAddressInput.blur();
        returned = component.getRequiredFieldErrorMessage('address');
        expect(returned).toEqual('Required field');
        const addressFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#address-form-field'}));
        expect(await addressFormField.getTextErrors()).toEqual(['Required field']);
        expect(component.newCulturalSiteForm.invalid).toBeTruthy();

        const culturalSiteTypeInput = await loader.getHarness(MatSelectHarness.with({selector: '#category-type-select'}));
        await culturalSiteTypeInput.blur();
        returned = component.getRequiredFieldErrorMessage('categoryType');
        expect(returned).toEqual('Required field');
        const typeFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#category-type-form-field'}));
        expect(await typeFormField.getTextErrors()).toEqual(['Required field']);
        expect(component.newCulturalSiteForm.invalid).toBeTruthy();

        // reset forme
        component.newCulturalSiteForm.reset();
        fixture.detectChanges();
    });

    it('should change category - default', () => {
        component.categoryChange(null);
        expect(culturalSiteCategoryService.getAllCategoryTypes).toHaveBeenCalledWith(1);
        expect(component.allCategoryTypesModel.length).toEqual(2);
        expect(component.allCategoryTypesModel[0].id).toEqual(1);
        expect(component.allCategoryTypesModel[0].name).toEqual('Biblioteka');
        expect(component.allCategoryTypesModel[1].id).toEqual(2);
        expect(component.allCategoryTypesModel[1].name).toEqual('Pozoriste');
    });

    it('should change category - event', () => {
        const source = {triggerValue: 'Manifestacija'};
        const event = {value: 2, source};
        component.categoryChange(event);
        expect(culturalSiteCategoryService.getAllCategoryTypes).toHaveBeenCalledWith(2);
    });

    it('should read file', () => {
        const event = {
            target: {
                files: [
                    new Blob([''], { type: 'text/html' }),
                    new Blob([''], { type: 'text/html' })
                ]
            }
        };
        component.onFileChange(event);

        expect(component.files.length).toEqual(2);
    });

    it('should set new lat and lng on address change', async () => {
        const location = {
            lat(): number { return 42; },
            lng(): number { return 20; }
        };
        const geometry = {location};
        const formattedAddess = 'Ulica Grad';
        const address = {formatted_address: formattedAddess, geometry};

        component.addressChange(address);

        expect(component.foundAddress).toEqual(formattedAddess);
        expect(component.location.lat).toEqual(42);
        expect(component.location.lng).toEqual(20);
        // provera u htmlu
        const culturalSiteLatInput = await loader.getHarness(MatInputHarness.with({selector: '#lat-input'}));
        const lat = await culturalSiteLatInput.getValue();
        const culturalSiteLngInput = await loader.getHarness(MatInputHarness.with({selector: '#lng-input'}));
        const lng = await culturalSiteLngInput.getValue();
        expect(lat).toEqual('42.000');
        expect(lng).toEqual('20.000');
    });

    it('should create new cultural site', async () => {
        expect(component.newCulturalSiteForm.invalid).toBeTruthy();
        // popunjavanje forme u htmlu
        const culturalSiteNameInput = await loader.getHarness(MatInputHarness.with({selector: '#name-input'}));
        await culturalSiteNameInput.setValue('Novo kulturno dobro');
        const culturalSiteAddressInput = await loader.getHarness(MatInputHarness.with({selector: '#address-input'}));
        await culturalSiteAddressInput.setValue('Adresa 5');
        const culturalSiteCategoryInput = await loader.getHarness(MatSelectHarness.with({selector: '#category-select'}));
        await culturalSiteCategoryInput.clickOptions(); // valjda odabere prvu
        const culturalSiteTypeInput = await loader.getHarness(MatSelectHarness.with({selector: '#category-type-select'}));
        await culturalSiteTypeInput.clickOptions(); // valjda odabere prvu
        expect(component.newCulturalSiteForm.valid).toBeTruthy();

        component.foundAddress = 'Adresa 5, Grad, Serbia';
        component.location.lat = 42;
        component.location.lng = 20;

        const newCulturalSiteDto: CulturalSite =
            new CulturalSite(
                'Novo kulturno dobro',
                1,
                '',
                1,
                '',
                42,
                20,
                'Adresa 5',
                'Grad',
                '',
                0
            );

        component.onSubmit();

        expect(culturalSiteService.createCulturalSite).toHaveBeenCalledWith(newCulturalSiteDto);
        expect(toastr.success).toHaveBeenCalledWith('Successfully created new cultural site!');
        expect(router.navigate).toHaveBeenCalledWith(['/cultural-site/2']);
        // provera da li je forma ociscena
        expect(await culturalSiteNameInput.getValue()).toEqual('');
    });
});
