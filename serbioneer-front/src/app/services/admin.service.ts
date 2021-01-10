import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Admin } from '../model/admin.model';

export interface AdminData {
  content: Admin[];
  totalPages: number;
  totalElements: number;
  size: number;
}

@Injectable({
  providedIn: 'root',
})
export class AdminService {
  private headers = new HttpHeaders({ 'Content-Type': 'application/json' });

  constructor(private http: HttpClient) {}

  createAdmin(admin: Admin): Observable<any> {
    console.log('createAdmin');
    return this.http.post<Admin>(environment.apiEndpoint + 'admin', admin, {
      headers: this.headers,
      observe: 'response',
    });
  }
}
