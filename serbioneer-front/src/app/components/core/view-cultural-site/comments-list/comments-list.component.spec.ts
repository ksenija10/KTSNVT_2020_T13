import { HarnessLoader } from '@angular/cdk/testing';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MatPaginatorModule, PageEvent } from '@angular/material/paginator';
import { MatPaginatorHarness } from '@angular/material/paginator/testing';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { of } from 'rxjs';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';

import { CommentsListComponent } from './comments-list.component';

describe('CommentListComponent', () => {
  let component: CommentsListComponent;
  let fixture: ComponentFixture<CommentsListComponent>;
  let culturalSiteService: CulturalSiteService;
  let loader: HarnessLoader;

  beforeEach(async () => {
    const culturalSiteServiceMock = {
      getAllCulturalSiteComments: jasmine.createSpy('getAllCulturalSiteComments')
        .and.returnValue(of({
            content: [ {}, {} ],
            totalPages: 1,
            totalElements: 2,
            size: 2
        }))
    };

    TestBed.configureTestingModule({
      declarations: [ CommentsListComponent ],
      providers: [
        { provide: CulturalSiteService, useValue: culturalSiteServiceMock }
      ],
      imports: [
        BrowserAnimationsModule,
        MatPaginatorModule
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(CommentsListComponent);
    component = fixture.componentInstance;
    culturalSiteService = TestBed.inject(CulturalSiteService);
    loader = TestbedHarnessEnvironment.loader(fixture);
    // "prosledjivanje" @Input vrednosti
    component.culturalSiteId = 1;
    component.culturalSiteName = 'Kulturno dobro';
    component.userIsLogged = true;
  });

  it('should create', () => {
    expect(component).toBeTruthy();
    expect(component.page).toEqual(0);
    expect(component.size).toEqual(1);
  });

  it('should fetch comments for cultural site', () => {
    component.ngOnInit();

    expect(culturalSiteService.getAllCulturalSiteComments).toHaveBeenCalledWith(1, 0, 1);
    expect(component.comments.content.length).toEqual(2);
    expect(component.comments.totalPages).toEqual(1);
    expect(component.comments.totalElements).toEqual(2);
    expect(component.comments.size).toEqual(2);
    // provera u htmlu
    fixture.whenStable().then(async () => {
      fixture.detectChanges();
      const commentListPaginator = await loader.getHarness(MatPaginatorHarness.with({selector: '#comment-list-paginator'}));
      const paginatorLabel = await commentListPaginator.getRangeLabel();
      expect(paginatorLabel).toEqual('1 – 2 of 2');
    });
  });

  it('should change comment pagination', () => {
    const event: PageEvent = new PageEvent();
    event.pageIndex = 1;
    event.pageSize = 2;

    component.onPaginateChangeComments(event);

    expect(component.page).toEqual(event.pageIndex);
    expect(component.size).toEqual(event.pageSize);
    expect(culturalSiteService.getAllCulturalSiteComments).toHaveBeenCalledWith(1, event.pageIndex, event.pageSize);
  });

  it('should fetch comments without the edited one', () => {
    component.onEditComment();

    expect(culturalSiteService.getAllCulturalSiteComments).toHaveBeenCalledWith(1, 0, 1);
    expect(component.comments.content.length).toEqual(2);
    expect(component.comments.totalPages).toEqual(1);
    expect(component.comments.totalElements).toEqual(2);
    expect(component.comments.size).toEqual(2);
  });
});
