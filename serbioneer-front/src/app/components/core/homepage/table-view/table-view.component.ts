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
  selector: 'app-table-view',
  templateUrl: './table-view.component.html',
  styleUrls: ['./table-view.component.sass']
})
export class TableViewComponent implements OnInit  {

  @Input() dataSource: CulturalSiteData = {content: [], size: 0, totalElements: 0, totalPages: 0};

  displayedColumns: string[] = ['name', 'category', 'categoryType', 'address', 'city'];

  // emitujemo promenu paginatora
  @Output() pageChanged: EventEmitter<PageEvent> = new EventEmitter<PageEvent>();

  //slanje id-ja cultural site-a
  @Output() redirect:EventEmitter<any> = new EventEmitter();

  constructor(
    private culturalSiteService: CulturalSiteService,
    private router : Router
  ) {}

  ngOnInit(): void {
  }

  onPaginateChange(event: PageEvent) {
    // emitujemo dogadjaj
    this.pageChanged.emit(event);
  }

  onClickRow(id:number) {
    //navigacija na cultural site posle klika na row
    this.router.navigate(['cultural-site/'+id]);
  }
}
