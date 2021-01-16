import { Component, Input, OnInit, SimpleChanges } from '@angular/core';
import { FormControl, FormGroup, FormGroupDirective, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { PageEvent } from '@angular/material/paginator';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { ConfirmDeleteDialog } from 'src/app/dialogs/confirm-dialog/confirm-dialog.component';
import { CulturalCategoryType } from 'src/app/model/cultural-category-type.model';
import { CulturalSiteCategory } from 'src/app/model/cultural-site-category.model';
import { CulturalCategoryTypeData, CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { calculateLastPage, onlyContainsLettersAndSpaces } from 'src/app/util/util';

@Component({
  selector: 'app-types',
  templateUrl: './types.component.html',
  styleUrls: ['./types.component.sass']
})
export class TypesComponent implements OnInit {

  // Common
  actions: string[] = ['edit', 'delete']
  displayedColumns: string[] = ['name', 'actions']
  namePattern = "([A-Z]{1}[a-z]*)( [a-z]*)*"

  // Type
  typeDataSource: CulturalCategoryTypeData = {content: [], totalElements: 0, totalPages: 0, size: 0}
  typePageEvent: PageEvent = new PageEvent()
  addTypeForm: FormGroup;
  typeEntity: string = "cultural category type"

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
    })
   }

  ngOnInit(): void {
  }

  // poziva se na promenu chosenCategory
  ngOnChanges() {
    this.typePageEvent.pageSize = 2;
    this.typePageEvent.pageIndex = 0;
    this.onTypePaginateChange(this.typePageEvent);
  }

  onTypePaginateChange(event: PageEvent) {
    // cuvanje poslednjeg event-a
    this.typePageEvent = event;
    let page = this.typePageEvent.pageIndex;
    let size = this.typePageEvent.pageSize;
    if (this.chosenCategory !== undefined) {
      let categoryId = this.chosenCategory.id;
      this.culturalSiteCategoryService.getAllCategoryTypesByPage(categoryId, page, size).pipe(
        map((culturalCategoryTypeData: CulturalCategoryTypeData) => 
          this.typeDataSource = culturalCategoryTypeData
        )
      ).subscribe()
    }
  }

  onAddType(typeFormDirective: FormGroupDirective) {
    if(this.addTypeForm.invalid) {
      return;
    }

    if(!this.chosenCategory) {
      this.toastr.error('You must choose a category first.')
      return;
    }

    const newType: CulturalCategoryType = 
      new CulturalCategoryType(
        this.addTypeForm.value.name
      )
    const categoryId = this.chosenCategory.id

    this.culturalSiteCategoryService.createCulturalCategoryType(categoryId, newType)
    .subscribe(
      response => {
        this.toastr.success('Successfully added new category type!');
        this.addTypeForm.reset();
        typeFormDirective.resetForm();
        // reload tabele
        let lastPageIndex = calculateLastPage(this.typePageEvent.length + 1, this.typePageEvent.pageSize, this.typePageEvent.pageIndex)
        //this.typePageEvent.previousPageIndex = this.typePageEvent.pageIndex
        //this.typePageEvent.pageIndex = lastPageIndex;
        //this.typePageEvent.length += 1;
        this.onTypePaginateChange(this.typePageEvent)
      },
      error => {
        if(error.error.message){
          this.toastr.error(error.error.message);
        } else {
          this.toastr.error('503 Server Unavailable');
        }
        this.addTypeForm.reset();
        typeFormDirective.resetForm();
      })
  }

  getTypeNameErrorMessage() {
    if(this.addTypeForm.controls['name'].touched) {
      if(this.addTypeForm.controls['name'].hasError('pattern')) {
        if(onlyContainsLettersAndSpaces(this.addTypeForm.controls['name'].value)) {
          return 'Must start with capital letter';
        } else {
          return 'Cannot contain special characters or numbers'
        }
      }
      return this.addTypeForm.controls['name'].hasError('required') ? 'Required field' : '';
    }
    return '';
  }

  confirmDeleteType(type: CulturalCategoryType) {

    const dialogRef = this.dialog.open(ConfirmDeleteDialog, {
      data: {
        entity: 'type',
        name: type.name
      }
    })

    dialogRef.afterClosed()
      .subscribe(
        response => {
          if(response) {
            this.culturalSiteCategoryService.deleteCulturalSiteType(type.id)
              .subscribe(
                response => {
                  this.toastr.success('Successfully deleted cultural category type!');
                  // reload tabele
                  this.onTypePaginateChange(this.typePageEvent)
                },
                error => {
                  if(error.error.message){
                    this.toastr.error(error.error.message);
                  } else {
                    this.toastr.error('503 Server Unavailable');
                  }
                })
          }
        }
      )
  }

  updateType(type: CulturalCategoryType, newTypeName: string) {
    if (newTypeName == null) {
      return
    }
    // ako nije promenjeno ime, nema potebe za pozivom na bek
    if (type.name === newTypeName) {
      return
    }

    const updatedType: CulturalCategoryType = 
      new CulturalCategoryType(
      newTypeName
      )

      this.culturalSiteCategoryService.updateCulturalCategoryType(type.id, updatedType)
        .subscribe(
          response => {
          this.toastr.success('Successfully updated cultural category type!');
          // reload tabele
          this.onTypePaginateChange(this.typePageEvent)
          },
          error => {
            if(error.error.message){
              this.toastr.error(error.error.message);
            } else {
              this.toastr.error('503 Server Unavailable');
            }
          })
  }
}
