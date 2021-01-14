import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { throwError } from "rxjs";
import { catchError, map } from "rxjs/operators";
import { environment } from "src/environments/environment";
import { Image, ImageDTO } from "../model/image.model";

export interface NewsDto{
    id: number,
    information : string,
}

@Injectable({
providedIn: 'root'
})
export class ImageService {
    
    constructor(private http: HttpClient) { }

    createForComment(commentId : number, file : any){

        const formData = new FormData();
        formData.append('file', file);

        return this.http.post<Image>(environment.apiEndpoint + 'image/comment/' + commentId, formData).pipe(
            map((imageDto: Image) => imageDto),
            catchError(err => throwError(err))
          )
    }

    createForNews(newsId : number, file : any){

        const formData = new FormData();
        formData.append('file', file);

        return this.http.post<Image>(environment.apiEndpoint + 'image/news/' + newsId, formData).pipe(
            map((imageDto: Image) => imageDto),
            catchError(err => throwError(err))
          )
    }

    createForCulturalSite(siteId : number, file : any){

        const formData = new FormData();
        formData.append('file', file);

        return this.http.post<Image>(environment.apiEndpoint + 'image/cultural-site/' + siteId, formData).pipe(
            map((imageDto: Image) => imageDto),
            catchError(err => throwError(err))
          )
    }
}