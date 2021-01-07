import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { map } from "rxjs/operators";
import { environment } from "src/environments/environment";
import { CulturalSiteCategory } from "../model/cultural-site-category.model";

@Injectable({
    providedIn: 'root'
})
export class CulturalSiteCategoryService{

    private headers = new HttpHeaders({'Content-Type': 'application/json'});

    constructor(
        private http: HttpClient
    ) {}

    getAllCulturalSiteCategorys() : Observable<any> {
        return this.http.get<CulturalSiteCategory[]>(environment.apiEndpoint + 'cultural-site-category',
        {headers: this.headers})
        .pipe(
            map((responseData) => {
                //ovde treba jos jedna map
              let names: string[] = [];
              for (let culturalSite of responseData) {
                names.push(culturalSite.name);
              }
              return names;
        }))
    }
}