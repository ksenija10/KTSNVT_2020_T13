import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, FormGroupDirective, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { PageEvent } from '@angular/material/paginator';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { ConfirmDeleteDialogComponent } from 'src/app/components/core/confirm-dialog/confirm-dialog.component';
import { CulturalSiteCategory } from 'src/app/model/cultural-site-category.model';
import { CulturalSiteCategoryData, CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { onlyContainsLettersAndSpaces, smoothScroll } from 'src/app/util/util';

@Component({
  selector: 'app-categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.sass']
})
export class CategoriesComponent implements OnInit {

  // Common
  actions: string[] = ['edit', 'delete'];
  displayedColumns: string[] = ['name', 'actions'];
  namePattern = '([A-ZŠĐČĆŽ]{1}[a-zšđčćž]*)( [a-zšđčćž]*)*';

  // Category
  categoryDataSource: CulturalSiteCategoryData = {content: [], size: 0, totalElements: 0, totalPages: 0};
  categoryPageEvent: PageEvent = new PageEvent();
  addCategoryForm: FormGroup;
  categoryEntity = 'cultural site category';

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
    });
  }

  ngOnInit(): void {
    this.initDataSource();
  }

  initDataSource(): void {
    // inicijalizacija category tabele
    this.culturalSiteCategoryService.getAllByPage(0, 2).pipe(
      map((culturalSiteCategoryData: CulturalSiteCategoryData) =>
        this.categoryDataSource = culturalSiteCategoryData
      )
    ).subscribe();
  }

  chooseCategory(category: CulturalSiteCategory): void {
    smoothScroll();
    this.chosenCategory = category;
  }

  onCategoryPaginateChange(event: PageEvent): void {
    // cuvanje poslednjeg event-a
    this.categoryPageEvent = event;
    const page = this.categoryPageEvent.pageIndex;
    const size = this.categoryPageEvent.pageSize;
    // this.categoryDataSource.loadCategories(page, size);
    this.culturalSiteCategoryService.getAllByPage(page, size).pipe(
      map((culturalSiteCategoryData: CulturalSiteCategoryData) =>
        this.categoryDataSource = culturalSiteCategoryData
      )
    ).subscribe();
  }

  // add new category
  onAddCategory(categoryFormDirective: FormGroupDirective): void {
    if (this.addCategoryForm.invalid) {
      return;
    }

    const newCat: CulturalSiteCategory =
      new CulturalSiteCategory(
        this.addCategoryForm.value.name
      );

    this.culturalSiteCategoryService.createCulturalSiteCategory(newCat)
        .subscribe(
          response => {
            this.toastr.success('Successfully added new category!');
            this.addCategoryForm.reset();
            categoryFormDirective.resetForm();
            this.onCategoryPaginateChange(this.categoryPageEvent);
          },
          error => {
            if (error.error.message){
              this.toastr.error(error.error.message);
            } else {
              this.toastr.error('503 Server Unavailable');
            }
            this.addCategoryForm.reset();
            categoryFormDirective.resetForm();
          });
  }

  getCategoryNameErrorMessage(): string {
    if (this.addCategoryForm.controls.name.touched) {
      if (this.addCategoryForm.controls.name.hasError('pattern')) {
        if (onlyContainsLettersAndSpaces(this.addCategoryForm.controls.name.value)) {
          return 'Must start with capital letter';
        } else {
          return 'Cannot contain special characters or numbers';
        }
      }
      return this.addCategoryForm.controls.name.hasError('required') ? 'Required field' : '';
    }
    return '';
  }

  // delete category
  confirmDeleteCategory(category: CulturalSiteCategory): void {

    const dialogRef = this.dialog.open(ConfirmDeleteDialogComponent, {
      data: {
        entity: 'category',
        name: category.name
      }
    });

    dialogRef.afterClosed()
      .subscribe(
        response => {
          if (response) {
            this.culturalSiteCategoryService.deleteCulturalSiteCategory(category.id)
              .subscribe(
                serviceResponse => {
                  this.toastr.success('Successfully deleted cultural site category!');
                  // reload tabele
                  this.onCategoryPaginateChange(this.categoryPageEvent);
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

  // edit category
  updateCategory(category: CulturalSiteCategory, newCategoryName: string): void {
    if (newCategoryName == null) {
       return;
    }
    // ako nije promenjeno ime, nema potebe za pozivom na bek
    if (category.name === newCategoryName) {
      return;
    }

    const updatedCategory: CulturalSiteCategory =
      new CulturalSiteCategory(
        newCategoryName
      );

    this.culturalSiteCategoryService.updateCulturalSiteCategory(category.id, updatedCategory)
      .subscribe(
        response => {
          this.toastr.success('Successfully updated cultural site category!');
          // reload tabele
          this.chosenCategory = response;
          this.onCategoryPaginateChange(this.categoryPageEvent);
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
