import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { Image } from '../model/image.model';

@Injectable({
providedIn: 'root'
})
export class ImageService {

    constructor(private http: HttpClient) { }

    createForComment(commentId: number, file: any): Observable<Image> {

        const formData = new FormData();
        formData.append('file', file);

        return this.http.post<Image>(environment.apiEndpoint + 'image/comment/' + commentId, formData).pipe(
            map((imageDto: Image) => imageDto),
            catchError(err => throwError(err))
          );
    }

    createForNews(newsId: number, file: any): Observable<Image> {

        const formData = new FormData();
        formData.append('file', file);

        return this.http.post<Image>(environment.apiEndpoint + 'image/news/' + newsId, formData).pipe(
            map((imageDto: Image) => imageDto),
            catchError(err => throwError(err))
          );
    }

    createForCulturalSite(siteId: number, file: any): Observable<Image> {

        const formData = new FormData();
        formData.append('file', file);

        return this.http.post<Image>(environment.apiEndpoint + 'image/cultural-site/' + siteId, formData).pipe(
            map((imageDto: Image) => imageDto),
            catchError(err => throwError(err))
          );
    }
}
