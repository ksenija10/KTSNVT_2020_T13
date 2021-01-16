import { CollectionViewer } from "@angular/cdk/collections";
import { DataSource } from "@angular/cdk/table";
import { BehaviorSubject, Observable, of } from "rxjs";
import { catchError, finalize } from "rxjs/operators";
import { CulturalSiteCategory } from "../model/cultural-site-category.model";
import { CulturalSiteCategoryData, CulturalSiteCategoryService } from "../services/cultural-site-category.service";

export class CategoriesDataSource implements DataSource<CulturalSiteCategory> {

    private categoriesSubject = new BehaviorSubject<CulturalSiteCategory[]>([]);
    public totalElementsSubject = new BehaviorSubject<number>(0);
    private loadingSubject = new BehaviorSubject<boolean>(false);

    public loading$ = this.loadingSubject.asObservable();

    constructor(
        private culturalSiteCategoryService: CulturalSiteCategoryService
        ) {}

    connect(collectionViewer: CollectionViewer): Observable<CulturalSiteCategory[]> {
        return this.categoriesSubject.asObservable();
    }

    disconnect(collectionViewer: CollectionViewer): void {
        this.categoriesSubject.complete();
        this.loadingSubject.complete();
    }

    loadCategories(pageIndex = 0, pageSize = 2) {

        this.loadingSubject.next(true);

        this.culturalSiteCategoryService.getAllByPage(pageIndex, pageSize)
            .pipe(
                catchError(() => of([])),
                finalize(() => this.loadingSubject.next(false))
            ).subscribe(culturalSiteCategories => {
                    if(this.isCulturalSiteCategoryData(culturalSiteCategories)) {
                        this.categoriesSubject.next(culturalSiteCategories.content)
                        this.totalElementsSubject.next(culturalSiteCategories.totalElements)
                    } else {
                        this.categoriesSubject.next(culturalSiteCategories)
                        this.totalElementsSubject.next(0)
                    }
                })
    }

    isCulturalSiteCategoryData(data: CulturalSiteCategoryData | never[]): 
        data is CulturalSiteCategoryData {
        return (data as CulturalSiteCategoryData).content !== undefined;
    }
}