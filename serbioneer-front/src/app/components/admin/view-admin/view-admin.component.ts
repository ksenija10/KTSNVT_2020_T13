import { Component, OnInit } from '@angular/core';

export interface Admin {
  name: string;
  surname: string;
  email: string;
  dateOfBirth: Date;
}

@Component({
  selector: 'app-view-admin',
  templateUrl: './view-admin.component.html',
  styleUrls: ['./view-admin.component.sass'],
})
export class ViewAdminComponent implements OnInit {
  displayedColumns: string[] = ['name', 'surname', 'email', 'date of birth'];
  //dataSource!: AdminData;

  constructor() {}

  ngOnInit(): void {}
}
