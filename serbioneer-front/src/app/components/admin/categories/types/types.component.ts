import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { FormControl, FormGroup, FormGroupDirective, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { PageEvent } from '@angular/material/paginator';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { ConfirmDeleteDialogComponent } from 'src/app/components/core/confirm-dialog/confirm-dialog.component';
import { CulturalCategoryType } from 'src/app/model/cultural-category-type.model';
import { CulturalSiteCategory } from 'src/app/model/cultural-site-category.model';
import { CulturalCategoryTypeData, CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { onlyContainsLettersAndSpaces } from 'src/app/util/util';

@Component({
  selector: 'app-types',
  templateUrl: './types.component.html',
  styleUrls: ['./types.component.sass']
})
export class TypesComponent implements OnInit, OnChanges {

  // Common
  actions: string[] = ['edit', 'delete'];
  displayedColumns: string[] = ['name', 'actions'];
  namePattern: string = '([A-ZŠĐČĆŽ]{1}[a-zšđčćž]*)( [a-zšđčćž]*)*';

  // Type
  typeDataSource: CulturalCategoryTypeData = {content: [], totalElements: 0, totalPages: 0, size: 0};
  typePageEvent: PageEvent = new PageEvent();
  addTypeForm: FormGroup;
  typeEntity: string = 'cultural category type';

  @Input() chosenCategory!: CulturalSiteCategory;

  constructor(
    private culturalSiteCategoryService: CulturalSiteCategoryService,
    private toastr: ToastrService,
    private dialog: MatDialog,
  ) {
    this.typePageEvent.pageSize = 2;
    this.typePageEvent.pageIndex = 0;
    this.addTypeForm = new FormGroup({
      name: new FormControl('', [Validators.required, Validators.pattern(this.namePattern)])
    });
   }

  ngOnInit(): void {
  }

  // poziva se na promenu chosenCategory
  ngOnChanges(): void {
    this.typePageEvent.pageSize = 2;
    this.typePageEvent.pageIndex = 0;
    this.onTypePaginateChange(this.typePageEvent);
  }

  onTypePaginateChange(event: PageEvent): void {
    // cuvanje poslednjeg event-a
    this.typePageEvent = event;
    const page = this.typePageEvent.pageIndex;
    const size = this.typePageEvent.pageSize;
    if (this.chosenCategory !== undefined) {
      const categoryId = this.chosenCategory.id;
      this.culturalSiteCategoryService.getAllCategoryTypesByPage(categoryId, page, size).pipe(
        map((culturalCategoryTypeData: CulturalCategoryTypeData) =>
          this.typeDataSource = culturalCategoryTypeData
        )
      ).subscribe();
    }
  }

  onAddType(typeFormDirective: FormGroupDirective): void {
    if (this.addTypeForm.invalid) {
      return;
    }

    if (!this.chosenCategory) {
      this.toastr.error('You must choose a category first.');
      return;
    }

    const newType: CulturalCategoryType =
      new CulturalCategoryType(
        this.addTypeForm.value.name
      );
    const categoryId = this.chosenCategory.id;

    this.culturalSiteCategoryService.createCulturalCategoryType(categoryId, newType)
    .subscribe(
      response => {
        this.toastr.success('Successfully added new category type!');
        this.addTypeForm.reset();
        typeFormDirective.resetForm();
        // reload tabele
        this.onTypePaginateChange(this.typePageEvent);
      },
      error => {
        if (error.error.message){
          this.toastr.error(error.error.message);
        } else {
          this.toastr.error('503 Server Unavailable');
        }
        this.addTypeForm.reset();
        typeFormDirective.resetForm();
      });
  }

  getTypeNameErrorMessage(): string {
    if (this.addTypeForm.controls.name.touched) {
      if (this.addTypeForm.controls.name.hasError('pattern')) {
        if (onlyContainsLettersAndSpaces(this.addTypeForm.controls.name.value)) {
          return 'Must start with capital letter';
        } else {
          return 'Cannot contain special characters or numbers';
        }
      }
      return this.addTypeForm.controls.name.hasError('required') ? 'Required field' : '';
    }
    return '';
  }

  confirmDeleteType(type: CulturalCategoryType): void {

    const dialogRef = this.dialog.open(ConfirmDeleteDialogComponent, {
      data: {
        entity: 'type',
        name: type.name
      }
    });

    dialogRef.afterClosed()
      .subscribe(
        response => {
          if (response) {
            this.culturalSiteCategoryService.deleteCulturalSiteType(type.id)
              .subscribe(
                serviceResponse => {
                  this.toastr.success('Successfully deleted cultural category type!');
                  // reload tabele
                  this.onTypePaginateChange(this.typePageEvent);
                },
                error => {
                  if (error.error.message){
                    this.toastr.error(error.error.message);
                  } else {
                    this.toastr.error('503 Server Unavailable');
                  }
                });
          }
        }
      );
  }

  updateType(type: CulturalCategoryType, newTypeName: string): void {
    if (newTypeName == null) {
      return;
    }
    // ako nije promenjeno ime, nema potebe za pozivom na bek
    if (type.name === newTypeName) {
      return;
    }

    const updatedType: CulturalCategoryType =
      new CulturalCategoryType(
      newTypeName
      );

    this.culturalSiteCategoryService.updateCulturalCategoryType(type.id, updatedType)
        .subscribe(
          response => {
          this.toastr.success('Successfully updated cultural category type!');
          // reload tabele
          this.onTypePaginateChange(this.typePageEvent);
          },
          error => {
            if (error.error.message){
              this.toastr.error(error.error.message);
            } else {
              this.toastr.error('503 Server Unavailable');
            }
          });
  }
}
