import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { map } from 'rxjs/operators';
import { FilterDTO } from 'src/app/model/filter-cultural-site.model';
import { CulturalSiteData, CulturalSiteService } from 'src/app/services/cultural-site.service';

export interface CulturalSite {
  name: string;
  address: string;
  city: string;
}

@Component({
  selector: 'app-table-view',
  templateUrl: './table-view.component.html',
  styleUrls: ['./table-view.component.sass']
})
export class TableViewComponent implements OnInit  {

  //displayed for filter
  @Input() location: string = '';
  @Input() name: string = '';
  @Input() culturalSiteCategorys: string[] = [];

  displayedColumns: string[] = ['name', 'category', 'categoryType', 'address', 'city'];
  dataSource!: CulturalSiteData;
  pageEvent: PageEvent = new PageEvent();

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  constructor(
    private culturalSiteService: CulturalSiteService
  ) {
    this.pageEvent.pageSize = 2;
    this.pageEvent.pageIndex = 0;
  }

  ngOnInit(): void {
    this.initDataSource();
  }

  initDataSource() {
    //stavljeno 2 samo jer imamo malo podataka neka recimo bude 10 po defaultu
    //mozda nam ovo nece ni trebati
    this.culturalSiteService.findAllByPage(0, 2).pipe(
      map((culturalSiteData: CulturalSiteData) => this.dataSource = culturalSiteData)
    ).subscribe();
    /*this.culturalSiteService.filterByPage(0, 2,).pipe(
      map((culturalSiteData: CulturalSiteData) => this.dataSource = culturalSiteData)
    ).subscribe();*/
  }

  onPaginateChange(event: PageEvent) {

    // cuvanje poslednjeg event-a
    this.pageEvent = event;

    this.onFilter();
  }

  onFilter() {
    let page = this.pageEvent.pageIndex;
    let size = this.pageEvent.pageSize;
    let filterDto: FilterDTO = new FilterDTO(this.culturalSiteCategorys, this.name, this.location);
    this.culturalSiteService.filterByPage(page, size, filterDto).pipe(
      map((filteredCulturalSiteData: CulturalSiteData) => this.dataSource = filteredCulturalSiteData)
    ).subscribe();
  }
}
