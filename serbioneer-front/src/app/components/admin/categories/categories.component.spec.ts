import { HarnessLoader } from "@angular/cdk/testing";
import { TestbedHarnessEnvironment } from "@angular/cdk/testing/testbed";
import { async, ComponentFixture, TestBed } from "@angular/core/testing";
import { FormGroupDirective, FormsModule, ReactiveFormsModule } from "@angular/forms";
import { MatDialog } from "@angular/material/dialog";
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatFormFieldHarness } from "@angular/material/form-field/testing";
import { MatInputModule } from "@angular/material/input";
import { MatInputHarness } from "@angular/material/input/testing";
import { PageEvent } from "@angular/material/paginator";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { CulturalSiteCategory } from "src/app/model/cultural-site-category.model";
import { CulturalSiteCategoryService } from "src/app/services/cultural-site-category.service";
import { CategoriesComponent } from "./categories.component"

fdescribe('CategoriesComponent', () => {
    let component: CategoriesComponent;
    let fixture: ComponentFixture<CategoriesComponent>;
    // injektovani servisi
    let culturalSiteCategoryService: CulturalSiteCategoryService;
    let toastr: ToastrService;
    let dialog: MatDialog;
    let loader: HarnessLoader;

    //let dialogSpy: jasmine.Spy;
    let dialogRefSpyObject = jasmine.createSpyObj({
        afterClosed: of(true),
        close: null
    })
    dialogRefSpyObject.componentInstance = { body: '' };

    beforeEach(() => {
        let culturalSiteCategoryServiceMock = {
            getAllByPage: jasmine.createSpy('getAllByPage')
                .and.returnValue(of({
                    content: [
                        {
                            id: 1,
                            name: 'Institucija'
                        },
                        {
                            id: 2,
                            name: 'Manifestacija'
                        }
                    ],
                    totalPages: 1,
                    totalElements: 2,
                    size: 2
                })),
            createCulturalSiteCategory: jasmine.createSpy('createCulturalSiteCategory')
                .and.returnValue(of({
                        id: 3,
                        name: 'Nova kategorija'
                })),
            deleteCulturalSiteCategory: jasmine.createSpy('deleteCulturalSiteCategory')
                .and.returnValue(of({})),
            updateCulturalSiteCategory: jasmine.createSpy('updateCulturalSiteCategory')
                .and.returnValue(of({
                    id: 1,
                    name: 'Izmenjena kategorija'
                }))
        }

        let toastrMock = {
            success: jasmine.createSpy('success'),
            error: jasmine.createSpy('error')
        }

        let dialogMock = {
            open: jasmine.createSpy('open')
                .and.returnValue(dialogRefSpyObject)
        }

        TestBed.configureTestingModule({
            declarations: [CategoriesComponent],
            providers: [
                { provide: CulturalSiteCategoryService, useValue: culturalSiteCategoryServiceMock },
                { provide: ToastrService, useValue: toastrMock },
                { provide: MatDialog, useValue: dialogMock }
            ],
            imports: [
                ReactiveFormsModule,
                FormsModule,
                MatFormFieldModule,
                MatInputModule,
                BrowserAnimationsModule
            ]
        }).compileComponents();

        fixture = TestBed.createComponent(CategoriesComponent);
        component = fixture.componentInstance;
        culturalSiteCategoryService = TestBed.inject(CulturalSiteCategoryService);
        toastr = TestBed.inject(ToastrService);
        loader = TestbedHarnessEnvironment.loader(fixture);
    })

    afterEach(() => {
        component.addCategoryForm.reset();
        fixture.detectChanges();
    })

    it('should load instance', () => {
        expect(component).toBeTruthy();
    });

    it('should initialize data source', () => {
        component.initDataSource();

        expect(culturalSiteCategoryService.getAllByPage).toHaveBeenCalledWith(0, 2);
        expect(component.categoryDataSource.content.length).toEqual(2);
        expect(component.categoryDataSource.totalPages).toEqual(1);
        expect(component.categoryDataSource.totalElements).toEqual(2);
        expect(component.categoryDataSource.size).toEqual(2);
        expect(component.categoryDataSource.content[0].id).toEqual(1);
        expect(component.categoryDataSource.content[0].name).toEqual('Institucija');
        expect(component.categoryDataSource.content[1].id).toEqual(2);
        expect(component.categoryDataSource.content[1].name).toEqual('Manifestacija');
    })

    it('should choose category', () => {
        component.chooseCategory({
            id: 1,
            name: 'Odabrana kategorija'
        });

        expect(component.chosenCategory.id).toEqual(1);
        expect(component.chosenCategory.name).toEqual('Odabrana kategorija');
    })

    it('should change category table page', () => {
        let pageEvent: PageEvent = new PageEvent();
        pageEvent.pageIndex = 1;
        pageEvent.pageSize = 2;
        component.onCategoryPaginateChange(pageEvent);

        expect(culturalSiteCategoryService.getAllByPage).toHaveBeenCalledWith(pageEvent.pageIndex, pageEvent.pageSize);
        expect(component.categoryPageEvent).toEqual(pageEvent);

        expect(component.categoryDataSource.content.length).toEqual(2);
        expect(component.categoryDataSource.totalPages).toEqual(1);
        expect(component.categoryDataSource.totalElements).toEqual(2);
        expect(component.categoryDataSource.size).toEqual(2);
        expect(component.categoryDataSource.content[0].id).toEqual(1);
        expect(component.categoryDataSource.content[0].name).toEqual('Institucija');
        expect(component.categoryDataSource.content[1].id).toEqual(2);
        expect(component.categoryDataSource.content[1].name).toEqual('Manifestacija');
    })

    it('should add new category - success', async() => {
        expect(component.addCategoryForm.invalid).toBeTruthy();
        //popunjavanje forme u htmlu
        const categoryNameInput = await loader.getHarness(MatInputHarness.with({selector: '#cultural-category-name-input'}));
        await categoryNameInput.setValue('Nova kategorija');
        expect(component.addCategoryForm.valid).toBeTruthy();

        const newCategoryDto: CulturalSiteCategory = 
            new CulturalSiteCategory(
                'Nova kategorija'
            );
        
        component.onAddCategory(new FormGroupDirective([], []));

        expect(culturalSiteCategoryService.createCulturalSiteCategory).toHaveBeenCalledWith(newCategoryDto);
        expect(toastr.success).toHaveBeenCalledWith('Successfully added new category!');
        // provera da li je forma ociscena
        expect(await categoryNameInput.getValue()).toEqual('');
    })

    it('should not get category name error message - valid field', async() => {
        expect(component.addCategoryForm.invalid).toBeTruthy();
        // popunjavanje forme
        const categoryNameInput = await loader.getHarness(MatInputHarness.with({selector: '#cultural-category-name-input'}));
        await categoryNameInput.setValue('Nova kategorija');

        // pozivanje metode KOJA IMA POVRATNU VREDNOST -> sacuvamo povratnu vrednost *tinkr tinkr*
        let returned = component.getCategoryNameErrorMessage();
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#category-name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual([]);
        expect(component.addCategoryForm.valid).toBeTruthy();
    })

    it('should get category name error message - not capitalized', async() => {
        expect(component.addCategoryForm.invalid).toBeTruthy();
        // popunjavanje forme
        const categoryNameInput = await loader.getHarness(MatInputHarness.with({selector: '#cultural-category-name-input'}));
        await categoryNameInput.setValue('nova kategorija');
        await categoryNameInput.blur();

        let returned = component.getCategoryNameErrorMessage();
        
        expect(returned).toEqual('Must start with capital letter');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#category-name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual(['Must start with capital letter']);
        expect(component.addCategoryForm.invalid).toBeTruthy();
    })

    it('should get category name error message - special character', async() => {
        expect(component.addCategoryForm.invalid).toBeTruthy();
        // popunjavanje forme
        const categoryNameInput = await loader.getHarness(MatInputHarness.with({selector: '#cultural-category-name-input'}));
        await categoryNameInput.setValue('n%');
        await categoryNameInput.blur();

        let returned = component.getCategoryNameErrorMessage();
        
        expect(returned).toEqual('Cannot contain special characters or numbers');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#category-name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual(['Cannot contain special characters or numbers']);
        expect(component.addCategoryForm.invalid).toBeTruthy();
    })

    it('should get category name error message - empty field', async() => {
        expect(component.addCategoryForm.invalid).toBeTruthy();
        // popunjavanje forme
        const categoryNameInput = await loader.getHarness(MatInputHarness.with({selector: '#cultural-category-name-input'}));
        await categoryNameInput.setValue('');
        await categoryNameInput.blur();

        let returned = component.getCategoryNameErrorMessage();
        
        expect(returned).toEqual('Required field');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#category-name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual(['Required field']);
        expect(component.addCategoryForm.invalid).toBeTruthy();
    })

    it('should delete category', () => {
        let pageEvent: PageEvent = new PageEvent();
        pageEvent.pageIndex = 1;
        pageEvent.pageSize = 2;
        component.categoryPageEvent = pageEvent;

        const categoryToDelete = new CulturalSiteCategory(
            'Institucija',
            1
        );

        component.confirmDeleteCategory(categoryToDelete);

        expect(culturalSiteCategoryService.deleteCulturalSiteCategory).toHaveBeenCalledWith(categoryToDelete.id);
        expect(toastr.success).toHaveBeenCalledWith('Successfully deleted cultural site category!');
        // interno poziva se dobavljanje kategorija
        expect(culturalSiteCategoryService.getAllByPage).toHaveBeenCalledWith(pageEvent.pageIndex, pageEvent.pageSize);
    })

    it('should update category - changed name', () => {
        let pageEvent: PageEvent = new PageEvent();
        pageEvent.pageIndex = 1;
        pageEvent.pageSize = 2;
        component.categoryPageEvent = pageEvent;

        const categoryToUpdate = new CulturalSiteCategory(
            'Institucija',
            1
        );
        const updatedCategoryName = 'Izmenjena kategorija';

        const updatedCategory = new CulturalSiteCategory('Izmenjena kategorija');

        component.updateCategory(categoryToUpdate, updatedCategoryName);

        expect(culturalSiteCategoryService.updateCulturalSiteCategory).toHaveBeenCalledWith(categoryToUpdate.id, updatedCategory);
        expect(toastr.success).toHaveBeenCalledWith('Successfully updated cultural site category!');
        // interno poziva se dobavljanje kategorija
        expect(culturalSiteCategoryService.getAllByPage).toHaveBeenCalledWith(pageEvent.pageIndex, pageEvent.pageSize);
    })

    it('should update category - same name', () => {
        let pageEvent: PageEvent = new PageEvent();
        pageEvent.pageIndex = 1;
        pageEvent.pageSize = 2;
        component.categoryPageEvent = pageEvent;

        const categoryToUpdate = new CulturalSiteCategory(
            'Institucija',
            1
        );
        const updatedCategoryName = 'Institucija';

        component.updateCategory(categoryToUpdate, updatedCategoryName);

        expect(culturalSiteCategoryService.updateCulturalSiteCategory).toHaveBeenCalledTimes(0);
    })
})