import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { map } from 'rxjs/operators';
import { CulturalSiteData, CulturalSiteService } from 'src/app/services/cultural-site.service';

export interface CulturalSite {
  name: string;
  address: string;
  city: string;
}

export class FilterData {
  culturalSiteCategorys: string[] = '';

  @NotNull
	private String categoryName;
	
	@NotNull
	private String categoryTypeName;
	
	@NotNull
	private String culturalSiteName;
	
	/*@NotNull
	private List<String> location;*/
	
	@NotNull
	private String location;
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

  displayedColumns: string[] = ['name', 'address', 'city'];
  dataSource!: CulturalSiteData;
  pageEvent!: PageEvent;

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;

  constructor(
    private culturalSiteService: CulturalSiteService
  ) {}

  ngOnInit(): void {
    this.initDataSource();
  }

  initDataSource() {
    //stavljeno 2 samo jer imamo malo podataka neka recimo bude 10 po defaultu
    //mozda nam ovo nece ni trebati
    /*this.culturalSiteService.findAllByPage(0, 2).pipe(
      map((culturalSiteData: CulturalSiteData) => this.dataSource = culturalSiteData)
    ).subscribe();*/
    this.culturalSiteService.filterByPage(0, 2,).pipe(
      map((culturalSiteData: CulturalSiteData) => this.dataSource = culturalSiteData)
    ).subscribe();
  }

  onPaginateChange(event: PageEvent) {
    let page = event.pageIndex;
    let size = event.pageSize;

    this.culturalSiteService.findAllByPage(page, size).pipe(
      map((culturalSiteData: CulturalSiteData) => this.dataSource = culturalSiteData)
    ).subscribe();
  }
}
