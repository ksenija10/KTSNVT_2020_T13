import { Component, EventEmitter } from "@angular/core";
import { ComponentFixture, TestBed } from "@angular/core/testing";
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { CommentService } from "src/app/services/comment.service";
import { ApproveCommentComponent } from "./approve-comment.component";

describe('ApproveCommentComponent', () => {
    let component: ApproveCommentComponent;
    let fixture: ComponentFixture<ApproveCommentComponent>;
    let commentService: any;
    let toastrService : any;
    beforeEach(() => {
      let commentsServiceMock = {
        aproveComment: jasmine.createSpy('aproveComment')
            .and.returnValue(of({
                id: 1,
                name: "Nameuser",
                surname: "Surnameuser",
                username: "user@user.com",
                culturalSiteName: "CulturalSite1",
                text: "CulturalSite1 was really good.",
                approved: true,
                images: []
            }
        )),
        declineComment: jasmine.createSpy('declineComment')
            .and.returnValue(of({})),
      };
  
      let commentSaidFetchMock = {
        emit: jasmine.createSpy('emit')
      }

      let toastrMock = {
        success: jasmine.createSpy('success')
      }

      TestBed.configureTestingModule({
        declarations:   [ ApproveCommentComponent ],
        providers:      [ {provide: CommentService, useValue: commentsServiceMock },
                          {provide: ToastrService, useValue: toastrMock},
                          {provide: EventEmitter, useValue: commentSaidFetchMock}]
      }).compileComponents();
  
      fixture = TestBed.createComponent(ApproveCommentComponent);
      component = fixture.componentInstance;
      component.comment = {
        id: 1,
        name: "Nameuser",
        surname: "Surnameuser",
        username: "user@user.com",
        culturalSiteName: "CulturalSite1",
        text: "CulturalSite1 was really good.",
        approved: true,
        images: []
      }
      component.commentSaidFetch = TestBed.inject(EventEmitter);
      commentService = TestBed.inject(CommentService);
      toastrService = TestBed.inject(ToastrService);
    });

    it('should approve a comment', ( async () => {
      component.approveComment();
      //spyOn(component.commentSaidFetch, 'emit');

      expect(commentService.aproveComment).toHaveBeenCalledWith(1);
      expect(toastrService.success).toHaveBeenCalledWith('Comment approved successfully!');
      expect(component.commentSaidFetch.emit).toHaveBeenCalledWith();
    }))

    it('should decline a comment', ( async () => {
      component.declineComment();

      expect(commentService.declineComment).toHaveBeenCalledWith(1);
      expect(toastrService.success).toHaveBeenCalledWith('Comment rejected successfully!');
      expect(component.commentSaidFetch.emit).toHaveBeenCalledWith();
    }))
})