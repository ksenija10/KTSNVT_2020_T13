import { Component, Input, OnInit, ViewChild, EventEmitter, Output } from '@angular/core';
import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';
import { map } from 'rxjs/operators';
import { FilterDTO } from 'src/app/model/filter-cultural-site.model';
import { CulturalSiteData, CulturalSiteService } from 'src/app/services/cultural-site.service';

export interface CulturalSite {
  name: string;
  address: string;
  city: string;
}

@Component({
  selector: 'app-cultural-sites-table',
  templateUrl: './cultural-sites-table.component.html',
  styleUrls: ['./cultural-sites-table.component.sass']
})
export class CulturalSitesTableComponent implements OnInit  {

  //displayed for filter
  @Input() location: string = '';
  @Input() name: string = '';
  @Input() culturalSiteCategorys: string[] = [];

  displayedColumns: string[] = ['name', 'category', 'categoryType', 'address', 'city'];
  dataSource!: CulturalSiteData;
  pageEvent: PageEvent = new PageEvent();

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  //slanje id-ja cultural site-a
  @Output() redirect:EventEmitter<any> = new EventEmitter();

  constructor(
    private culturalSiteService: CulturalSiteService,
    private router : Router
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

  onClickRow(id:number) {
    //sharing service for sibling communication
    this.culturalSiteService.setData(id);
    //navigacija na cultural site posle klika na row
    this.router.navigate(['cultural-site']);
  }
}
