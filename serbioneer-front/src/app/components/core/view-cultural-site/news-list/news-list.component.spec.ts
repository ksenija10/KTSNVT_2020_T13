import { HarnessLoader } from '@angular/cdk/testing';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MatPaginatorModule, PageEvent } from '@angular/material/paginator';
import { MatPaginatorHarness } from '@angular/material/paginator/testing';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { of } from 'rxjs';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';

import { NewsListComponent } from './news-list.component';

describe('NewsListComponent', () => {
  let component: NewsListComponent;
  let fixture: ComponentFixture<NewsListComponent>;
  let culturalSiteService: CulturalSiteService;
  let loader: HarnessLoader;

  beforeEach(async () => {
    const culturalSiteServiceMock = {
      getAllCulturalSiteNews: jasmine.createSpy('getAllCulturalSiteNews')
        .and.returnValue(of({
            content: [ {}, {} ],
            totalPages: 1,
            totalElements: 2,
            size: 2
        }))
    };

    TestBed.configureTestingModule({
      declarations: [ NewsListComponent ],
      providers: [
        { provide: CulturalSiteService, useValue: culturalSiteServiceMock }
      ],
      imports: [
        BrowserAnimationsModule,
        MatPaginatorModule
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(NewsListComponent);
    component = fixture.componentInstance;
    culturalSiteService = TestBed.inject(CulturalSiteService);
    loader = TestbedHarnessEnvironment.loader(fixture);
    // "prosledjivanje" @Input vrednosti
    component.culturalSiteId = 1;
    component.culturalSiteName = 'Kulturno dobro';
    component.adminIsLogged = false;
  });

  it('should create', () => {
    expect(component).toBeTruthy();
    expect(component.page).toEqual(0);
    expect(component.size).toEqual(1);
  });

  it('should fetch news for cultural site', () => {
    component.ngOnInit();

    expect(culturalSiteService.getAllCulturalSiteNews).toHaveBeenCalledWith(1, 0, 1);
    expect(component.news.content.length).toEqual(2);
    expect(component.news.totalPages).toEqual(1);
    expect(component.news.totalElements).toEqual(2);
    expect(component.news.size).toEqual(2);
    // provera u htmlu
    fixture.whenStable().then(async () => {
      fixture.detectChanges();
      const commentListPaginator = await loader.getHarness(MatPaginatorHarness.with({selector: '#news-list-paginator'}));
      const paginatorLabel = await commentListPaginator.getRangeLabel();
      expect(paginatorLabel).toEqual('1 – 2 of 2');
    });
  });

  it('should change news pagination', () => {
    const event: PageEvent = new PageEvent();
    event.pageIndex = 1;
    event.pageSize = 2;

    component.onPaginateChangeNews(event);

    expect(component.page).toEqual(event.pageIndex);
    expect(component.size).toEqual(event.pageSize);
    expect(culturalSiteService.getAllCulturalSiteNews).toHaveBeenCalledWith(1, event.pageIndex, event.pageSize);
  });
});
