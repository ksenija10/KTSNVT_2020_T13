import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { catchError, map } from "rxjs/operators";
import { Observable, throwError } from "rxjs";
import { environment } from "../../environments/environment"

export class RatingDTO {

    constructor(
        public id: number,
        public value: number,
        public culturalSiteId: number,
        public authenticatedUserId: number
    ){}
};

export class RatingBackDTO {

    constructor(
        private value:number,
        private culturalSiteId: number,
        private authenticatedUserEmail: string
    ){};

};

export class RatingCreateDTO {

    constructor(
        public id: number,
        public value: number,
        public culturalSiteId: number,
        public authenticatedUserId: number
    ){};
};

@Injectable({
    providedIn: 'root'
})
export class RatingService {
    constructor(
        private http: HttpClient
    ) {}
    
    getUserRatingForCulturalSite(culturalSiteId : number, userEmail : string): Observable<RatingDTO>{

        const dto = new RatingBackDTO(0, culturalSiteId, userEmail);

        return this.http.post<RatingDTO>(environment.apiEndpoint + 'rating/user-site-rating/', dto).pipe(
            map((ratingData: RatingDTO) => ratingData),
            catchError(err => throwError(err))
        );
    }

    createRating(siteId : number, ratingVal : number): Observable<RatingDTO> {

        const dto = new RatingCreateDTO(0, ratingVal, siteId, 0);

        return this.http.post<RatingDTO>(environment.apiEndpoint + 'rating/cultural-site/' + siteId, dto).pipe(
            map((ratingData: RatingDTO) => ratingData),
            catchError(err => throwError(err))
        );
    }

    updateRating(id : number, ratingVal : number, siteId : number): Observable<RatingDTO> {

        const dto = new RatingCreateDTO(id, ratingVal, siteId, 0);

        return this.http.put<RatingDTO>(environment.apiEndpoint + 'rating', dto).pipe(
            map((ratingData: RatingDTO) => ratingData),
            catchError(err => throwError(err))
        );
    }

}