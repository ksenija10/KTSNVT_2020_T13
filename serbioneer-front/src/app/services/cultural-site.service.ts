import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import {
  CulturalSite,
  CulturalSiteView,
  SubscribedCulturalSiteDTO,
} from '../model/cultural-site.model';
import { FilterDTO } from '../model/filter-cultural-site.model';
import { NewsDTO } from '../model/news.model';
import { Image } from 'src/app/model/image.model';
import { CommentData } from './comment.service';
import { NewsDto } from './image.service';

export interface CulturalSiteData {
  content: CulturalSite[];
  totalPages: number;
  totalElements: number;
  size: number;
}

export interface NewsData {
  content: NewsDTO[];
  totalPages: number;
  totalElements: number;
  size: number;
}

export class CommentDto {
  id?: number;
  name?: string;
  surname?: string;
  culturalSiteName?: string;
  text: string;
  approved?: boolean;
  images?: Image[];

  constructor(text: string) {
    this.text = text;
  }
}

@Injectable({
  providedIn: 'root',
})
export class CulturalSiteService {
  private headers = new HttpHeaders({ 'Content-Type': 'application/json' });

  constructor(private http: HttpClient) {}

  findAllByPage(page: number, size: number): Observable<CulturalSiteData> {
    let params = new HttpParams();

    params = params.append('page', String(page));
    params = params.append('size', String(size));

    return this.http
      .get<CulturalSiteData>(
        environment.apiEndpoint + 'cultural-site/by-page',
        { params }
      );
  }

  findAllSubscribedByPage(page: number, size: number, email: string): Observable<CulturalSiteData> {
    let params = new HttpParams();

    params = params.append('page', String(page));
    params = params.append('size', String(size));
    params = params.append('userEmail', email);

    return this.http
      .get<CulturalSiteData>(
        environment.apiEndpoint + 'cultural-site/subscribed/by-page',
        { params }
      );
  }

  // cultural-site/filter/by-page
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
      );
  }

  filterSubscribedByPage(
    page: number,
    size: number,
    email: string,
    filterDto: FilterDTO
  ): Observable<CulturalSiteData> {
    let params = new HttpParams();

    params = params.append('page', String(page));
    params = params.append('size', String(size));
    params = params.append('userEmail', email);

    return this.http
      .post<CulturalSiteData>(
        environment.apiEndpoint + 'cultural-site/subscribed/filter/by-page',
        filterDto,
        { params }
      );
  }

  findAllLocations(): Observable<string[]> {
    return this.http
      .get<string[]>(environment.apiEndpoint + 'cultural-site/locations');
  }

  createNews(news: NewsDTO, culturalSiteId: number): Observable<NewsDto> {
    const params = new HttpParams();

    return this.http
      .post<NewsDto>(
        environment.apiEndpoint + 'cultural-site/' + culturalSiteId + '/news',
        news
      )
      .pipe(catchError((err) => throwError(err)));
  }

  getCulturalSite(id: number): Observable<CulturalSiteView> {
    return this.http
      .get<CulturalSiteView>(environment.apiEndpoint + 'cultural-site/' + id)
      .pipe(
        map((culturalSite: CulturalSiteView) => culturalSite),
        catchError((err) => throwError(err))
      );
  }

  getAllCulturalSiteNews(id: number, page = 0, size = 2): Observable<NewsData> {
    let params = new HttpParams();

    params = params.append('page', String(page));
    params = params.append('size', String(size));

    return this.http
      .get<NewsData>(
        environment.apiEndpoint + 'cultural-site/' + id + '/news/by-page',
        { params }
      )
      .pipe(
        map((news: NewsData) => news),
        catchError((err) => throwError(err))
      );
  }

  getAllCulturalSiteComments(id: number, page = 0, size = 2): Observable<CommentData> {
    let params = new HttpParams();

    params = params.append('page', String(page));
    params = params.append('size', String(size));

    return this.http
      .get<CommentData>(
        environment.apiEndpoint + 'cultural-site/' + id + '/comment/by-page',
        { params }
      )
      .pipe(
        map((comments: CommentData) => comments),
        catchError((err) => throwError(err))
      );
  }

  getUserCulturalSite(subscribedCulturalSiteDTO: SubscribedCulturalSiteDTO): Observable<SubscribedCulturalSiteDTO> {
    return this.http
      .post<SubscribedCulturalSiteDTO>(
        environment.apiEndpoint + 'cultural-site/subsribed-on-site',
        subscribedCulturalSiteDTO
      )
      .pipe(
        map((culturalSiteDto: SubscribedCulturalSiteDTO) => culturalSiteDto),
        catchError((err) => throwError(err))
      );
  }

  createComment(siteId: number, text: string): Observable<CommentDto> {
    const comment = new CommentDto(text);
    return this.http
      .post<CommentDto>(
        environment.apiEndpoint + 'cultural-site/' + siteId + '/comment',
        comment
      )
      .pipe(
        map((newComment: CommentDto) => newComment),
        catchError((err) => throwError(err))
      );
  }

  createCulturalSite(culturalSite: CulturalSite): Observable<CulturalSite> {
    return this.http.post<CulturalSite>(
      environment.apiEndpoint + 'cultural-site',
      culturalSite,
      {
        headers: this.headers
      }
    );
  }

  updateCulturalSite(culturalSiteId: number, culturalSite: CulturalSite): Observable<CulturalSite> {
    return this.http.put<CulturalSite>(
      environment.apiEndpoint + 'cultural-site/' + culturalSiteId,
      culturalSite
    );
  }

  deleteCulturalSite(culturalSiteId: number): Observable<void> {
    return this.http.delete<void>(environment.apiEndpoint + 'cultural-site/' + culturalSiteId);
  }
}
