import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { PageEvent } from '@angular/material/paginator';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { ConfirmDeleteDialog } from 'src/app/dialogs/confirm-dialog/confirm-dialog.component';
import { CulturalCategoryType } from 'src/app/model/cultural-category-type.model';
import { CulturalSiteCategory } from 'src/app/model/cultural-site-category.model';
import { CulturalCategoryTypeData, CulturalSiteCategoryData, CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { onlyContainsLettersAndSpaces, smoothScroll } from 'src/app/util/util';

@Component({
  selector: 'app-categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.sass']
})
export class CategoriesComponent implements OnInit {

  // Common
  actions: string[] = ['edit', 'delete']
  displayedColumns: string[] = ['name', 'actions']
  namePattern = "([A-Z]{1}[a-z]*)( [a-z]*)*"

  // Category
  categoryDataSource!: CulturalSiteCategoryData
  categoryPageEvent: PageEvent = new PageEvent()
  addCategoryForm: FormGroup;
  categoryEntity: string = "cultural site category"

  // Type
  typeDataSource: CulturalCategoryTypeData = {content: [], totalElements: 0, totalPages: 0, size: 0}
  typePageEvent: PageEvent = new PageEvent()
  addTypeForm: FormGroup;
  typeEntity: string = "cultural category type"

  // Chosen category
  chosenCategory!: CulturalSiteCategory;

  constructor(
    private culturalSiteCategoryService: CulturalSiteCategoryService,
    private toastr: ToastrService,
    private dialog: MatDialog
  ) {
    this.categoryPageEvent.pageSize = 2;
    this.categoryPageEvent.pageIndex = 0;
    this.typePageEvent.pageSize = 2;
    this.typePageEvent.pageIndex = 0;
    // forms
    this.addCategoryForm = new FormGroup({
      name: new FormControl('', [Validators.required, Validators.pattern(this.namePattern)])
    })
    this.addTypeForm = new FormGroup({
      name: new FormControl('', [Validators.required, Validators.pattern(this.namePattern)])
    })
  }

  ngOnInit(): void {
    this.initDataSource();
  }

  initDataSource() {
    // inicijalizacija category tabele
    this.culturalSiteCategoryService.getAllByPage(0, 2).pipe(
      map((culturalSiteCategoryData: CulturalSiteCategoryData) => 
        this.categoryDataSource = culturalSiteCategoryData
      )
    ).subscribe()
  }

  chooseCategory(category: CulturalSiteCategory) {
    smoothScroll()
    this.chosenCategory = category
    this.onTypePaginateChange(this.typePageEvent);
  }

  onCategoryPaginateChange(event: PageEvent) {
    // cuvanje poslednjeg event-a
    this.categoryPageEvent = event;
    let page = this.categoryPageEvent.pageIndex;
    let size = this.categoryPageEvent.pageSize;
    this.culturalSiteCategoryService.getAllByPage(page, size).pipe(
      map((culturalSiteCategoryData: CulturalSiteCategoryData) => 
        this.categoryDataSource = culturalSiteCategoryData
      )
    ).subscribe()
  }

  onTypePaginateChange(event: PageEvent) {
    // cuvanje poslednjeg event-a
    this.typePageEvent = event;
    let page = this.typePageEvent.pageIndex;
    let size = this.typePageEvent.pageSize;
    if (this.chosenCategory !== null) {
      let categoryId = this.chosenCategory.id;
      this.culturalSiteCategoryService.getAllCategoryTypesByPage(categoryId, page, size).pipe(
        map((culturalCategoryTypeData: CulturalCategoryTypeData) => 
          this.typeDataSource = culturalCategoryTypeData
        )
      ).subscribe()
    }
  }

  // add new category/type

  onAddCategory() {
    if(this.addCategoryForm.invalid) {
      return;
    }

    const newCat: CulturalSiteCategory = 
      new CulturalSiteCategory(
        this.addCategoryForm.value.name
      )
    
    this.culturalSiteCategoryService.createCulturalSiteCategory(newCat)
        .subscribe(
          response => {
            this.toastr.success('Successfully added new category!');
            this.addCategoryForm.reset();
          },
          error => {
            if(error.error.message){
              this.toastr.error(error.error.message);
            } else {
              this.toastr.error('503 Server Unavailable');
            }
            this.addCategoryForm.reset();
          })
  }

  onAddType() {
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
      },
      error => {
        if(error.error.message){
          this.toastr.error(error.error.message);
        } else {
          this.toastr.error('503 Server Unavailable');
        }
        this.addTypeForm.reset();
      })
  }

  getCategoryNameErrorMessage() {
    if(this.addCategoryForm.controls['name'].touched) {
      if(this.addCategoryForm.controls['name'].hasError('pattern')) {
        if(onlyContainsLettersAndSpaces(this.addCategoryForm.controls['name'].value)) {
          return 'Must start with capital letter';
        } else {
          return 'Cannot contain special characters or numbers'
        }
      }
      return this.addCategoryForm.controls['name'].hasError('required') ? 'Required field' : '';
    }
    return '';
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

  // delete category/type
  confirmDeleteCategory(category: CulturalSiteCategory) {

    const dialogRef = this.dialog.open(ConfirmDeleteDialog, {
      data: {
        entity: 'category',
        name: category.name
      }
    })

    dialogRef.afterClosed()
      .subscribe(
        response => {
          if(response) {
            this.culturalSiteCategoryService.deleteCulturalSiteCategory(category.id)
              .subscribe(
                response => {
                  this.toastr.success('Successfully deleted cultural site category!');
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

  // edit category/type
  updateCategory(category: CulturalSiteCategory, newCategoryName: string) {
    if (newCategoryName == null) {
       return
    }
    // ako nije promenjeno ime, nema potebe za pozivom na bek
    if (category.name === newCategoryName) {
      return
    }
    
    const updatedCategory: CulturalSiteCategory = 
      new CulturalSiteCategory(
        newCategoryName
      )

    this.culturalSiteCategoryService.updateCulturalSiteCategory(category.id, updatedCategory)
      .subscribe(
        response => {
          this.toastr.success('Successfully updated cultural site category!');
        },
        error => {
          if(error.error.message){
            this.toastr.error(error.error.message);
          } else {
            this.toastr.error('503 Server Unavailable');
          }
        })
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
