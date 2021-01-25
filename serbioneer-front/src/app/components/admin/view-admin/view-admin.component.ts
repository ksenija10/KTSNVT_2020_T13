import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { AdminData, AdminService } from 'src/app/services/admin.service';
import { map } from 'rxjs/operators';
import { Router } from '@angular/router';

@Component({
  selector: 'app-view-admin',
  templateUrl: './view-admin.component.html',
  styleUrls: ['./view-admin.component.sass'],
})
export class ViewAdminComponent implements OnInit {
  displayedColumns: string[] = ['name', 'surname', 'email', 'dateOfBirth'];
  dataSource: AdminData = {content: [], totalElements: 0, totalPages: 0, size: 0};
  pageEvent: PageEvent = new PageEvent();

  @ViewChild(MatPaginator) paginator!: MatPaginator;

  constructor(private adminService: AdminService, private router: Router) {
    this.pageEvent.pageIndex = 0;
    this.pageEvent.pageSize = 2;
  }

  ngOnInit(): void {
    this.initDataSource();
  }

  initDataSource(): void {
    this.adminService
      .findAllByPage(this.pageEvent.pageIndex, this.pageEvent.pageSize)
      .pipe(map((adminData: AdminData) => (this.dataSource = adminData)))
      .subscribe();
  }

  onPaginateChange(event: PageEvent): void {
    this.pageEvent = event;
    this.getNewPage(this.pageEvent.pageIndex, this.pageEvent.pageSize);
  }

  getNewPage(index: number, size: number): void {
    this.adminService
      .findAllByPage(index, size)
      .pipe(map((adminData: AdminData) => (this.dataSource = adminData)))
      .subscribe();
  }

  addAdmin(): void {
    this.router.navigate(['admin/new-admin']);
  }
}
