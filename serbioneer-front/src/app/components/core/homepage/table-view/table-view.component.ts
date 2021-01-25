import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { PageEvent } from '@angular/material/paginator';
import { Router } from '@angular/router';
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

  constructor(
    private culturalSiteService: CulturalSiteService,
    private router: Router
  ) {}

  ngOnInit(): void {
  }

  onPaginateChange(event: PageEvent): void {
    // emitujemo dogadjaj
    this.pageChanged.emit(event);
  }

  onClickRow(id: number): void {
    // navigacija na cultural site posle klika na row
    this.router.navigate(['cultural-site/' + id]);
  }
}
