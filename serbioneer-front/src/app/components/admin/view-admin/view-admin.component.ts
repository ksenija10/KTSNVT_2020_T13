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
  dataSource!: AdminData;
  pageEvent: PageEvent = new PageEvent();

  @ViewChild(MatPaginator) paginator!: MatPaginator;

  constructor(
    private adminService: AdminService,
    private router: Router
  ) {
    this.pageEvent.pageIndex = 0;
    this.pageEvent.pageSize = 2;
  }

  ngOnInit(): void {
    this.initDataSource();
  }

  initDataSource() {
    this.adminService
      .findAllByPage(this.pageEvent.pageIndex, this.pageEvent.pageSize)
      .pipe(map((adminData: AdminData) => (this.dataSource = adminData)))
      .subscribe();
  }

  onPaginateChange(event: PageEvent) {
    this.pageEvent = event;
    this.getNewPage(this.pageEvent.pageIndex, this.pageEvent.pageSize);
  }

  getNewPage(index: number, size: number) {
    this.adminService
      .findAllByPage(index, size)
      .pipe(map((adminData: AdminData) => (this.dataSource = adminData)))
      .subscribe();
  }

  addAdmin() {
    this.router.navigate(['new-admin'])
  }
}
