import { HttpClient, HttpHeaders, HttpParams } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable, throwError } from "rxjs";
import { catchError, map } from "rxjs/operators";
import { environment } from "src/environments/environment";
import { CulturalCategoryType } from "../model/cultural-category-type.model";
import { CulturalSiteCategory } from "../model/cultural-site-category.model";

export interface CulturalSiteCategoryData {
    content: CulturalSiteCategory[];
    totalPages: number;
    totalElements: number;
    size: number;
}

export interface CulturalCategoryTypeData {
    content: CulturalCategoryType[];
    totalPages: number;
    totalElements: number;
    size: number;
}

@Injectable({
    providedIn: 'root'
})
export class CulturalSiteCategoryService{

    private headers = new HttpHeaders({'Content-Type': 'application/json'});

    constructor(
        private http: HttpClient
    ) {}

    getAllCulturalSiteCategorys() : Observable<any> {
        return this.http.get<CulturalSiteCategory[]>(environment.apiEndpoint + 'cultural-site-category',)
        /*{headers: this.headers})*/
    }

    getAllByPage(page: number, size: number): Observable<CulturalSiteCategoryData> {
        let params = new HttpParams();
        
        params = params.append('page', String(page));
        params = params.append('size', String(size));

        return this.http
            .get<CulturalSiteCategoryData>(
                environment.apiEndpoint + 'cultural-site-category/by-page',
                {params: params}
            )
    }

    getAllCategoryTypesByPage(categoryId: number, page: number, size: number): Observable<CulturalCategoryTypeData> {
        let params = new HttpParams();

        params = params.append('page', String(page));
        params = params.append('size', String(size));

        return this.http
            .get<CulturalCategoryTypeData>(
                environment.apiEndpoint + 'cultural-site-category/' + categoryId + "/type/by-page",
                {params: params}
            )
    }

    createCulturalSiteCategory(newCategoryDto: CulturalSiteCategory): Observable<Object> {
        return this.http.post(environment.apiEndpoint + 'cultural-site-category', newCategoryDto, {
            headers: this.headers
        })
    }
    createCulturalCategoryType(categoryId: number, newTypeDto: CulturalCategoryType): Observable<Object> {
        return this.http.post(environment.apiEndpoint + 'cultural-site-category/' + categoryId + '/type', newTypeDto, {
            headers: this.headers
        })
    }

    deleteCulturalSiteCategory(categoryId: number): Observable<Object> {
        return this.http.delete(environment.apiEndpoint + 'cultural-site-category/' + categoryId, {
            headers: this.headers
        })
    }
    deleteCulturalSiteType(typeId: number): Observable<Object> {
        return this.http.delete(environment.apiEndpoint + 'cultural-site-category/type/' + typeId, {
            headers: this.headers
        })
    }
    
    updateCulturalSiteCategory(categoryId: number, updatedCategoryDto: CulturalSiteCategory): Observable<any> {
        return this.http.put(environment.apiEndpoint + 'cultural-site-category/' + categoryId, updatedCategoryDto, {
            headers: this.headers
        })
    }
    // pitanje -> kako da vratim Observable<CulturalSiteCategory>
    updateCulturalCategoryType(typeId: number, updatedTypeDto: CulturalCategoryType): Observable<any> {
        return this.http.put(environment.apiEndpoint + 'cultural-site-category/type/' + typeId, updatedTypeDto, {
            headers: this.headers
        })
    }
}