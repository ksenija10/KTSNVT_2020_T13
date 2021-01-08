import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { CulturalSite } from '../model/cultural-site.model';
import { FilterDTO } from '../model/filter-cultural-site.model';

export interface CulturalSiteData {
  content: CulturalSite[];
  totalPages: number;
  totalElements: number;
  size: number;
}

@Injectable({
  providedIn: 'root',
})
export class CulturalSiteService {
  constructor(private http: HttpClient) {}

  findAllByPage(page: number, size: number): Observable<CulturalSiteData> {
    let params = new HttpParams();

    params = params.append('page', String(page));
    params = params.append('size', String(size));

    return this.http
      .get<CulturalSiteData>(
        environment.apiEndpoint + 'cultural-site/by-page',
        { params }
      )
      .pipe(
        map((culturalSiteData: CulturalSiteData) => culturalSiteData),
        catchError((err) => throwError(err))
      );
  }

  //cultural-site/filter/by-page
  filterByPage(
    page: number,
    size: number,
    filterDto: FilterDTO
  ): Observable<CulturalSiteData> {
    let params = new HttpParams();

    params = params.append('page', String(page));
    params = params.append('size', String(size));

    return this.http
      .post<CulturalSiteData>(
        environment.apiEndpoint + 'cultural-site/filter/by-page',
        filterDto,
        { params }
      )
      .pipe(
        map((culturalSiteData: CulturalSiteData) => culturalSiteData),
        catchError((err) => throwError(err))
      );
  }

  findAllLocations() {
    return this.http
      .get<string[]>(environment.apiEndpoint + 'cultural-site/locations')
      .pipe(
        map((locationsData: string[]) => locationsData),
        catchError((err) => throwError(err))
      );
  }
}
