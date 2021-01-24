import { HarnessLoader } from "@angular/cdk/testing";
import { TestbedHarnessEnvironment } from "@angular/cdk/testing/testbed";
import { DebugElement } from "@angular/core";
import { ComponentFixture, TestBed } from "@angular/core/testing";
import { FormGroupDirective, FormsModule, ReactiveFormsModule } from "@angular/forms";
import { MatDialog } from "@angular/material/dialog";
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatFormFieldHarness } from "@angular/material/form-field/testing";
import { MatInputModule } from "@angular/material/input";
import { MatInputHarness } from "@angular/material/input/testing";
import { PageEvent } from "@angular/material/paginator";
import { MatPaginatorHarness } from "@angular/material/paginator/testing";
import { MatTableHarness } from "@angular/material/table/testing";
import { By } from "@angular/platform-browser";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { CulturalCategoryType } from "src/app/model/cultural-category-type.model";
import { CulturalSiteCategoryService } from "src/app/services/cultural-site-category.service";
import { TypesComponent } from "./types.component";

fdescribe('TypesComponent', () => {
    let component: TypesComponent;
    let fixture: ComponentFixture<TypesComponent>;
    // injektovani servisi
    let culturalSiteCategoryService: CulturalSiteCategoryService;
    let toastr: ToastrService;
    let dialog: MatDialog;
    let loader: HarnessLoader;

    let dialogRefSpyObject = jasmine.createSpyObj({
        afterClosed: of(true),
        close: null
    })
    dialogRefSpyObject.componentInstance = { body: '' };

    beforeEach(() => {
        let culturalSiteCategoryServiceMock = {
            getAllCategoryTypesByPage: jasmine.createSpy('getAllByPage')
                .and.returnValue(of({
                    content: [
                        {
                            id: 1,
                            name: 'Biblioteka'
                        },
                        {
                            id: 2,
                            name: 'Pozoriste'
                        }
                    ],
                    totalPages: 1,
                    totalElements: 2,
                    size: 2
                })),
            createCulturalCategoryType: jasmine.createSpy('createCulturalSiteCategory')
                .and.returnValue(of({
                        id: 3,
                        name: 'Novi tip'
                })),
            deleteCulturalSiteType: jasmine.createSpy('deleteCulturalSiteCategory')
                .and.returnValue(of({})),
            updateCulturalCategoryType: jasmine.createSpy('updateCulturalSiteCategory')
                .and.returnValue(of({
                    id: 1,
                    name: 'Izmenjeni tip'
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

        let inputCategoryMock = {
            id: 1,
            name: 'Institucija'
        };

        TestBed.configureTestingModule({
            declarations: [TypesComponent],
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

        fixture = TestBed.createComponent(TypesComponent);
        component = fixture.componentInstance;
        component.chosenCategory = inputCategoryMock;
        culturalSiteCategoryService = TestBed.inject(CulturalSiteCategoryService);
        toastr = TestBed.inject(ToastrService);
        loader = TestbedHarnessEnvironment.loader(fixture);
        // izaziva inicijalni data binding
        fixture.detectChanges();
    })

    it('should load instance', () => {
        expect(component).toBeTruthy();
    });

    it('should display correct category name', () => {
        let categoryName = fixture.debugElement.query(By.css('#chosen-category-name'));
        expect(categoryName.nativeElement.textContent).toEqual('Institucija types');
    })

    it('should change category types displayed', () => {
        component.ngOnChanges();
        // proverimo da li je pozvao internu metodu
        // poziv sa postavljenim vrednostima -> size=2, page=0
        expect(component.typePageEvent.pageSize).toEqual(2);
        expect(component.typePageEvent.pageIndex).toEqual(0);
        expect(culturalSiteCategoryService.getAllCategoryTypesByPage).toHaveBeenCalledWith(1, 0, 2);
    })

    it('should change type table page', () => {
        let pageEvent: PageEvent = new PageEvent();
        pageEvent.pageIndex = 1;
        pageEvent.pageSize = 2;

        component.onTypePaginateChange(pageEvent);

        // cuvanje page eventa
        expect(component.typePageEvent.pageIndex).toEqual(pageEvent.pageIndex);
        expect(component.typePageEvent.pageSize).toEqual(pageEvent.pageSize);
        // poziv servisa
        expect(culturalSiteCategoryService.getAllCategoryTypesByPage).toHaveBeenCalledWith(1, pageEvent.pageIndex, pageEvent.pageSize);
        // dobavljeni podaci
        expect(component.typeDataSource.content.length).toEqual(2);
        expect(component.typeDataSource.totalPages).toEqual(1);
        expect(component.typeDataSource.totalElements).toEqual(2);
        expect(component.typeDataSource.size).toEqual(2);
        // sadrzaj podataka
        expect(component.typeDataSource.content[0].id).toEqual(1);
        expect(component.typeDataSource.content[0].name).toEqual('Biblioteka');
        expect(component.typeDataSource.content[1].id).toEqual(2);
        expect(component.typeDataSource.content[1].name).toEqual('Pozoriste');
    
        // provera u htmlu
        fixture.whenStable().then(async () => {
            fixture.detectChanges();
            const typesTable = await loader.getHarness(MatTableHarness.with({selector: '#category-type-table'}));
            expect((await typesTable.getRows()).length).toEqual(2);
            const typesPaginator = await loader.getHarness(MatPaginatorHarness.with({selector: '#types-paginator'}));
            const paginatorLabel = await typesPaginator.getRangeLabel();
            expect(paginatorLabel).toEqual('1 – 2 of 2');
        })
    })

    it('should add new type - success', async() => {
        expect(component.addTypeForm.invalid).toBeTruthy();
        // popunjavanje forme u htmlu
        const typeNameInput = await loader.getHarness(MatInputHarness.with({selector: '#type-name-input'}));
        await typeNameInput.setValue('Novi tip');
        expect(component.addTypeForm.valid).toBeTruthy();

        const newTypeDto: CulturalCategoryType = 
            new CulturalCategoryType(
                'Novi tip'
            );
        
        component.onAddType(new FormGroupDirective([], []));

        expect(culturalSiteCategoryService.createCulturalCategoryType).toHaveBeenCalledWith(1, newTypeDto);
        expect(toastr.success).toHaveBeenCalledWith('Successfully added new category type!');
        // provera da li je forma ociscena
        expect(await typeNameInput.getValue()).toEqual('');
        // provera u htmlu
        fixture.whenStable().then(async () => {
            fixture.detectChanges();
            const typesPaginator = await loader.getHarness(MatPaginatorHarness.with({selector: '#types-paginator'}));
            const paginatorLabel = await typesPaginator.getRangeLabel();
            expect(paginatorLabel).toEqual('1 – 2 of 3');
        })
    })

    it('should not get type name error message - valid field', async() => {
        expect(component.addTypeForm.invalid).toBeTruthy();
        // popunjavanje forme
        const categoryNameInput = await loader.getHarness(MatInputHarness.with({selector: '#type-name-input'}));
        await categoryNameInput.setValue('Novi tip');

        let returned = component.getTypeNameErrorMessage();
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#type-name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual([]);
        expect(component.addTypeForm.valid).toBeTruthy();
    })

    it('should get category name error message - not capitalized', async() => {
        expect(component.addTypeForm.invalid).toBeTruthy();
        // popunjavanje forme
        const categoryNameInput = await loader.getHarness(MatInputHarness.with({selector: '#type-name-input'}));
        await categoryNameInput.setValue('novi tip');
        await categoryNameInput.blur();

        let returned = component.getTypeNameErrorMessage();
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('Must start with capital letter');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#type-name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual(['Must start with capital letter']);
        expect(component.addTypeForm.invalid).toBeTruthy();

        // reset forme
        component.addTypeForm.reset();
        fixture.detectChanges();
    })

    it('should get category name error message - special character', async() => {
        expect(component.addTypeForm.invalid).toBeTruthy();
        // popunjavanje forme
        const categoryNameInput = await loader.getHarness(MatInputHarness.with({selector: '#type-name-input'}));
        await categoryNameInput.setValue('N$');
        await categoryNameInput.blur();

        let returned = component.getTypeNameErrorMessage();
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('Cannot contain special characters or numbers');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#type-name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual(['Cannot contain special characters or numbers']);
        expect(component.addTypeForm.invalid).toBeTruthy();

        // reset forme
        component.addTypeForm.reset();
        fixture.detectChanges();
    })

    it('should get category name error message - empty field', async() => {
        expect(component.addTypeForm.invalid).toBeTruthy();
        // popunjavanje forme
        const categoryNameInput = await loader.getHarness(MatInputHarness.with({selector: '#type-name-input'}));
        await categoryNameInput.setValue('');
        await categoryNameInput.blur();

        let returned = component.getTypeNameErrorMessage();
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('Required field');

        const nameFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#type-name-form-field'}));
        expect(await nameFormField.getTextErrors()).toEqual(['Required field']);
        expect(component.addTypeForm.invalid).toBeTruthy();

        // reset forme
        component.addTypeForm.reset();
        fixture.detectChanges();
    })

    it('should delete type', () => {
        let pageEvent: PageEvent = new PageEvent();
        pageEvent.pageIndex = 1;
        pageEvent.pageSize = 2;
        component.typePageEvent = pageEvent;

        const typeToDelete = new CulturalCategoryType(
            'Biblioteka',
            1
        );

        component.confirmDeleteType(typeToDelete);

        expect(culturalSiteCategoryService.deleteCulturalSiteType).toHaveBeenCalledWith(typeToDelete.id);
        expect(toastr.success).toHaveBeenCalledWith('Successfully deleted cultural category type!');
        // interno poziva se dobavljanje tipova
        expect(culturalSiteCategoryService.getAllCategoryTypesByPage).toHaveBeenCalledWith(1, pageEvent.pageIndex, pageEvent.pageSize);
        // provera u htmlu
        fixture.whenStable().then(async () => {
            fixture.detectChanges();
            const typesPaginator = await loader.getHarness(MatPaginatorHarness.with({selector: '#types-paginator'}));
            const paginatorLabel = await typesPaginator.getRangeLabel();
            expect(paginatorLabel).toEqual('1 – 2 of 1');
        })
    })

    it('should update type - changed name', () => {
        let pageEvent: PageEvent = new PageEvent();
        pageEvent.pageIndex = 1;
        pageEvent.pageSize = 2;
        component.typePageEvent = pageEvent;

        const typeToUpdate = new CulturalCategoryType(
            'Biblioteka',
            1
        );
        const updatedTypeName = 'Izmenjeni tip';

        const updatedType = new CulturalCategoryType('Izmenjeni tip');

        component.updateType(typeToUpdate, updatedTypeName);

        expect(culturalSiteCategoryService.updateCulturalCategoryType).toHaveBeenCalledWith(typeToUpdate.id, updatedType);
        expect(toastr.success).toHaveBeenCalledWith('Successfully updated cultural category type!');
        // interno poziva se dobavljanje kategorija
        expect(culturalSiteCategoryService.getAllCategoryTypesByPage).toHaveBeenCalledWith(1, pageEvent.pageIndex, pageEvent.pageSize);
        // provera u htmlu
        fixture.whenStable().then(async () => {
            fixture.detectChanges();
            const typesTable = await loader.getHarness(MatTableHarness.with({selector: '#category-type-table'}));
            expect((await typesTable.getRows()).length).toEqual(2);
            const typesPaginator = await loader.getHarness(MatPaginatorHarness.with({selector: '#types-paginator'}));
            const paginatorLabel = await typesPaginator.getRangeLabel();
            expect(paginatorLabel).toEqual('1 – 2 of 2');
        })
    })

    it('should update type - same name', () => {
        let pageEvent: PageEvent = new PageEvent();
        pageEvent.pageIndex = 1;
        pageEvent.pageSize = 2;
        component.typePageEvent = pageEvent;

        const typeToUpdate = new CulturalCategoryType(
            'Biblioteka',
            1
        );
        const updatedTypeName = 'Biblioteka';

        const updatedType = new CulturalCategoryType('Biblioteka');

        component.updateType(typeToUpdate, updatedTypeName);
        expect(culturalSiteCategoryService.updateCulturalCategoryType).toHaveBeenCalledTimes(0);
        // provera u htmlu
        fixture.whenStable().then(async () => {
            fixture.detectChanges();
            const typesTable = await loader.getHarness(MatTableHarness.with({selector: '#category-type-table'}));
            expect((await typesTable.getRows()).length).toEqual(2);
            const typesPaginator = await loader.getHarness(MatPaginatorHarness.with({selector: '#types-paginator'}));
            const paginatorLabel = await typesPaginator.getRangeLabel();
            expect(paginatorLabel).toEqual('1 – 2 of 2');
        })
    })

})