import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, throwError } from 'rxjs';
import { catchError, map } from 'rxjs/operators';
import { Comment } from 'src/app/model/comment.model';
import { environment } from '../../environments/environment';

export class CommentData {
    constructor(
        public content: Comment[],
        public totalPages: number,
        public totalElements: number,
        public size: number) {}
}

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

    aproveComment(commentId: number): Observable<Comment> {
        return this.http.put<Comment>(environment.apiEndpoint + 'comment/' + commentId + '/approval', {}).pipe(
            catchError(err => throwError(err))
        );
    }

    declineComment(commentId: number): Observable<void> {
        return this.http.delete<void>(environment.apiEndpoint + 'comment/' + commentId + '/approval').pipe(
            catchError(err => throwError(err))
        );
    }

    updateComment(id: number, updatedComment: Comment): Observable<Comment> {
        return this.http.put<Comment>(environment.apiEndpoint + 'comment/' + id, updatedComment).pipe(
            catchError(err => throwError(err))
        );
    }

    deleteComment(id: number): Observable<void> {
        return this.http.delete<void>(environment.apiEndpoint + 'comment/' + id);
    }
}
