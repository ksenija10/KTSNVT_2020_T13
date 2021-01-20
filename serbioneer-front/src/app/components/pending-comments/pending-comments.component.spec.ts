import { ChangeDetectorRef, DebugElement, NgModule } from "@angular/core";
import { ComponentFixture, fakeAsync, TestBed, tick, async } from "@angular/core/testing";
import { By } from "@angular/platform-browser";
import { of } from "rxjs";
import { CommentService } from "src/app/services/comment.service";
import { PendingCommentsComponent } from "./pending-comments.component";
import {HarnessLoader} from '@angular/cdk/testing';
import {TestbedHarnessEnvironment} from '@angular/cdk/testing/testbed';
import {MatPaginatorHarness} from '@angular/material/paginator/testing';
import {MatListItemHarness} from '@angular/material/list/testing';
import { MatListModule } from "@angular/material/list";
import { MatPaginator, MatPaginatorModule } from "@angular/material/paginator";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { ApproveCommentComponent } from "../approve-comment/approve-comment.component";
import { MatIcon, MatIconModule } from "@angular/material/icon";

describe('PendingCommentsComponent', () => {
    let component: PendingCommentsComponent;
    let fixture: ComponentFixture<PendingCommentsComponent>;
    let commentService: any;
    let router: any;
    let loader : HarnessLoader;
    let paginator : any;
  
    beforeEach(() => {
      let commentsServiceMock = {
        getComments: jasmine.createSpy('getComments')
            .and.returnValue(of({
                content: [
                {}, 
                {},
                {},
                {}
            ],
                totalPages: 2, 
                totalElements: 4, 
                size: 2,    
            }
        ))
      };
  
      let routerMock = {
        navigate: jasmine.createSpy('navigate')
      };

      let paginatorMock = {
        paginator: jasmine.createSpy('paginator')
      }
  
      TestBed.configureTestingModule({
        declarations:   [ PendingCommentsComponent ],
        providers:      [ {provide: CommentService, useValue: commentsServiceMock },
                         { provide: router, useValue: routerMock },
                         { provide: paginator, useValue: paginatorMock} ],
        imports: [
          MatListModule,
          MatPaginatorModule,
          BrowserAnimationsModule,
          MatIconModule
        ]
      }).compileComponents();
  
      fixture = TestBed.createComponent(PendingCommentsComponent);
      component = fixture.componentInstance;
      //component.paginator = new MatPaginator(new MatPaginatorIntl(), ChangeDetectorRef.prototype);
      commentService = TestBed.inject(CommentService);
      router = TestBed.inject(router);
      loader = TestbedHarnessEnvironment.loader(fixture);
    });

    it('should fetch the list of comments on init', ( async () => {
      component.ngOnInit();

      expect(commentService.getComments).toHaveBeenCalled();

      fixture.whenStable()
      .then(async () => {
          expect(component.commentsData.content.length).toBe(4);
          fixture.detectChanges();
          let elements: DebugElement[] = 
              fixture.debugElement.queryAll(By.css('mat-list-item'));
          expect(elements.length).toBe(4);
          // paginator
          const paginator = await loader.getHarness(MatPaginatorHarness.with({selector: '#pending-comments-paginator'}))
          const label = await paginator.getRangeLabel();
          expect(label).toEqual('1 – 2 of 4');
        });
    }));

    it('should change page in paginator', async () => {
      component.ngOnInit();

      expect(commentService.getComments).toHaveBeenCalled();

      const paginator = await loader.getHarness(MatPaginatorHarness.with({selector: '#pending-comments-paginator'}))
      
      await paginator.goToNextPage()

      expect(commentService.getComments).toHaveBeenCalled();
      expect(component.pageEvent.pageIndex).toEqual(1);
    })

})