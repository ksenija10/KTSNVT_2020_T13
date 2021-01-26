import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { map, catchError} from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { NewsDTO } from '../model/news.model';

export interface NewsData {
    content: NewsDTO[];
    totalPages: number;
    totalElements: number;
    size: number;
}

@Injectable({
    providedIn: 'root'
})
export class NewsService {

    constructor(
        private http: HttpClient
    ) {}

    getAllSubscribedNews(page: number, size: number): Observable<NewsData> {
        let params = new HttpParams();

        params = params.append('page', String(page));
        params = params.append('size', String(size));

        return this.http.get<NewsData>(environment.apiEndpoint + 'news/subscribed/by-page', { params }).pipe(
            map((newDTOs: NewsData) => newDTOs),
            catchError(err => throwError(err))
        );
    }

}
