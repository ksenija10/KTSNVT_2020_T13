import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, FormGroupDirective, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { PageEvent } from '@angular/material/paginator';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { ConfirmDeleteDialog } from 'src/app/dialogs/confirm-dialog/confirm-dialog.component';
import { CulturalSiteCategory } from 'src/app/model/cultural-site-category.model';
import { CulturalSiteCategoryData, CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { calculateLastPage, onlyContainsLettersAndSpaces, smoothScroll } from 'src/app/util/util';

@Component({
  selector: 'app-categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.sass']
})
export class CategoriesComponent implements OnInit {

  // Common
  actions: string[] = ['edit', 'delete']
  displayedColumns: string[] = ['name', 'actions']
  namePattern = "([A-ZŠĐČĆŽ]{1}[a-zšđčćž]*)( [a-zšđčćž]*)*"

  // Category
  categoryDataSource: CulturalSiteCategoryData = {content: [], size: 0, totalElements: 0, totalPages: 0}
  categoryPageEvent: PageEvent = new PageEvent()
  addCategoryForm: FormGroup;
  categoryEntity: string = "cultural site category"

  // Chosen category
  chosenCategory!: CulturalSiteCategory;

  constructor(
    private culturalSiteCategoryService: CulturalSiteCategoryService,
    private toastr: ToastrService,
    private dialog: MatDialog,
  ) {
    this.categoryPageEvent.pageSize = 2;
    this.categoryPageEvent.pageIndex = 0;
    // forms
    this.addCategoryForm = new FormGroup({
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
  }

  onCategoryPaginateChange(event: PageEvent) {
    // cuvanje poslednjeg event-a
    this.categoryPageEvent = event;
    let page = this.categoryPageEvent.pageIndex;
    let size = this.categoryPageEvent.pageSize;
    // this.categoryDataSource.loadCategories(page, size);
    this.culturalSiteCategoryService.getAllByPage(page, size).pipe(
      map((culturalSiteCategoryData: CulturalSiteCategoryData) => 
        this.categoryDataSource = culturalSiteCategoryData
      )
    ).subscribe()
  }

  // add new category
  onAddCategory(categoryFormDirective: FormGroupDirective) {
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
            categoryFormDirective.resetForm();
            this.onCategoryPaginateChange(this.categoryPageEvent);
          },
          error => {
            if(error.error.message){
              this.toastr.error(error.error.message);
            } else {
              this.toastr.error('503 Server Unavailable');
            }
            this.addCategoryForm.reset();
            categoryFormDirective.resetForm();
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

  // delete category
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
                  // reload tabele
                  this.onCategoryPaginateChange(this.categoryPageEvent)
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

  // edit category
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
          // reload tabele
          this.onCategoryPaginateChange(this.categoryPageEvent)
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
