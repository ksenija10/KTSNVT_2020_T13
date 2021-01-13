import { Component, OnInit } from '@angular/core';
import { PageEvent } from '@angular/material/paginator';
import { map } from 'rxjs/operators';
import { CulturalSiteCategory } from 'src/app/model/cultural-site-category.model';
import { CulturalCategoryTypeData, CulturalSiteCategoryData, CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';

@Component({
  selector: 'app-categories',
  templateUrl: './categories.component.html',
  styleUrls: ['./categories.component.sass']
})
export class CategoriesComponent implements OnInit {

  // Common
  actions: string[] = ['edit', 'delete']
  pageEvent: PageEvent = new PageEvent()
  displayedColumns: string[] = ['name', 'actions']

  // CategoryTable
  categoryDataSource!: CulturalSiteCategoryData

  // TypeTable
  typeDataSource!: CulturalCategoryTypeData

  // Chosen category
  chosenCategory!: CulturalSiteCategory;

  constructor(
    private culturalSiteCategoryService: CulturalSiteCategoryService
  ) {
    this.pageEvent.pageSize = 2;
    this.pageEvent.pageIndex = 0;
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
    // inicijalizacija type tabele
    this.culturalSiteCategoryService.getAllCategoryTypesByPage(1, 0, 2).pipe(
      map((culturalCategoryTypeData: CulturalCategoryTypeData) => 
        this.typeDataSource = culturalCategoryTypeData
      )
    ).subscribe()
  }

  choseCategory(category: CulturalSiteCategory) {
    this.chosenCategory = category
    this.onTypePaginateChange(this.pageEvent);
  }

  onCategoryPaginateChange(event: PageEvent) {
    // cuvanje poslednjeg event-a
    this.pageEvent = event;
    let page = this.pageEvent.pageIndex;
    let size = this.pageEvent.pageSize;
    this.culturalSiteCategoryService.getAllByPage(page, size).pipe(
      map((culturalSiteCategoryData: CulturalSiteCategoryData) => 
        this.categoryDataSource = culturalSiteCategoryData
      )
    ).subscribe()
  }

  onTypePaginateChange(event: PageEvent) {
    // cuvanje poslednjeg event-a
    this.pageEvent = event;
    let page = this.pageEvent.pageIndex;
    let size = this.pageEvent.pageSize;
    if (this.chosenCategory !== null) {
      let categoryId = this.chosenCategory.id;
      this.culturalSiteCategoryService.getAllCategoryTypesByPage(categoryId, page, size).pipe(
        map((culturalCategoryTypeData: CulturalCategoryTypeData) => 
          this.typeDataSource = culturalCategoryTypeData
        )
      ).subscribe()
    }
  }
}
