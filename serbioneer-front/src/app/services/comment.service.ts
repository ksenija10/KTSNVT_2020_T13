import { HttpClient, HttpHeaders, HttpParams, HttpResponse } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable, throwError } from "rxjs";
import { catchError, map } from "rxjs/operators";
import { environment } from "../../environments/environment"
import { Comment } from 'src/app/model/comment';

export interface CommentData {
    content: Comment[],
    totalPages: number,
    totalElements: number,
    size: number,
};

@Injectable({
    providedIn: 'root'
})
export class CommentService {
    constructor(
        private http: HttpClient
    ) {}

    getComments(pageNumber = 0, size = 2): Observable<CommentData> {
        let params = new HttpParams();

        params = params.append('page', String(pageNumber));
        params = params.append('size', String(size));

        return this.http.get<CommentData>(environment.apiEndpoint + 'comment/unapproved/by-page', {params}).pipe(
            map((commentData: CommentData) => commentData),
            catchError(err => throwError(err))
        );
    }

    aproveComment(commentId : number) {
        let params = new HttpParams();

        params = params.append('id', String(commentId));

        return this.http.put(environment.apiEndpoint + 'comment/' + commentId + '/approval', {params}).pipe(
            catchError(err => throwError(err))
        );
    }

    declineComment(commentId : number) {
        let params = new HttpParams();

        params = params.append('id', String(commentId));

        return this.http.delete(environment.apiEndpoint + 'comment/' + commentId + '/approval', {params}).pipe(
            catchError(err => throwError(err))
        );
    }

    updateComment(id : number, updatedComment : Comment){
        return this.http.put<Comment>(environment.apiEndpoint + 'comment/' + id, updatedComment).pipe(
            catchError(err => throwError(err))
        );
    }

    deleteComment(id : number){
        return this.http.delete<void>(environment.apiEndpoint + 'comment/' + id);
    }
}