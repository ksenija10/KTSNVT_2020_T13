import {HarnessLoader} from '@angular/cdk/testing';
import {TestbedHarnessEnvironment} from '@angular/cdk/testing/testbed';
import { ComponentFixture, TestBed } from "@angular/core/testing";
import { of } from "rxjs";
import { NewsfeedComponent } from "./newsfeed.component"
import { MatCardModule } from '@angular/material/card';
import { NewsService } from "src/app/services/news.service";
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatCardHarness } from '@angular/material/card/testing';
import { NewsComponent } from './news/news.component';

describe('NewsfeedComponent', () => {
    let component: NewsfeedComponent;
    let fixture: ComponentFixture<NewsfeedComponent>;
    //injektovani servisi i ostalo
    let newsService : any;
    let loader: HarnessLoader;

    beforeEach(() => {
        let newsServiceMock = {
            getAllSubscribedNews: jasmine.createSpy('getAllSubscribedNews')
                .and.returnValue(of({
                    content: [
                        {
                            information: 'Djoaki Rosini, Seviljski berberin. Subota, 23. januar u 19.00, scena Jovan Djordjevic',
                            dateTime: new Date('2021-01-16'),
                            culturalSiteName: 'Srpsko narodno pozoriste',
                            images: []
                        },
                        {
                            information: 'Premijera gostujuce predstave Amateri. Petak, 29. januar u 19.00, scena Pera Dobrinovic',
                            dateTime: new Date('2021-01-12'),
                            culturalSiteName: 'Srpsko narodno pozoriste',
                            images: []
                        },
                        {
                            information: 'Premijera gostujuce predstave Amateri. Petak, 29. januar u 19.00, scena Pera Dobrinovic',
                            dateTime: new Date('2021-01-11'),
                            culturalSiteName: 'Srpsko narodno pozoriste',
                            images: []
                        }
                    ],
                    totalPages: 1,
                    totalElements: 3,
                    size: 3
                }))
        }

        TestBed.configureTestingModule({
            declarations: [NewsfeedComponent, NewsComponent],
            providers: [
                { provide: NewsService, useValue: newsServiceMock }
            ],
            imports: [
                MatCardModule,
                BrowserAnimationsModule
            ]
        }).compileComponents();

        fixture = TestBed.createComponent(NewsfeedComponent);
        component = fixture.componentInstance;
        newsService = TestBed.inject(NewsService);
        loader = TestbedHarnessEnvironment.loader(fixture);
    })

    it('should get subscribed news on init', async() => {
        // "pozivamo" metodu koju testiramo
        component.ngOnInit();

        expect(newsService.getAllSubscribedNews).toHaveBeenCalledWith(0,3);
        expect(component.dataSource.length).toEqual(3);
        expect(component.page).toEqual(0);
    })

    it('should get subscribed news', async() => {
        // "pozivamo" metodu koju testiramo
        component.getNews();

        expect(newsService.getAllSubscribedNews).toHaveBeenCalledWith(0,2);
        expect(component.dataSource.length).toEqual(3);
        expect(component.page).toEqual(0);
    })

    it('should load new page on scroll', async() => {
        // "pozivamo" metodu koju testiramo
        component.onScroll();

        expect(component.page).toEqual(1);
        expect(newsService.getAllSubscribedNews).toHaveBeenCalledWith(1,2);
        expect(component.dataSource.length).toEqual(3);

        component.page = 0;

    })
})