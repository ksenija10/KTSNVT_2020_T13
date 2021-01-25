import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
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

  createAdmin(admin: Admin): Observable<Admin> {

    return this.http.post<Admin>(environment.apiEndpoint + 'admin', admin, {
      headers: this.headers
    });
  }

  findAllByPage(page: number, size: number): Observable<AdminData> {
    let params = new HttpParams();

    params = params.append('page', String(page));
    params = params.append('size', String(size));

    return this.http
      .get<AdminData>(environment.apiEndpoint + 'admin/by-page', { params })
      .pipe(
        map((adminData: AdminData) => adminData),
        catchError((err) => throwError(err))
    );
  }
}
