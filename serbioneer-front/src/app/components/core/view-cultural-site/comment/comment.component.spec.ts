import { ComponentFixture, fakeAsync, TestBed } from "@angular/core/testing";
import { MatDialog, MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from "@angular/material/dialog";
import { MatDividerModule } from "@angular/material/divider"
import { MatIconModule } from "@angular/material/icon";
import { By } from "@angular/platform-browser";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { Router } from "@angular/router";
import { NgImageSliderModule } from "ng-image-slider"
import { ToastrService } from "ngx-toastr";
import { of } from "rxjs";
import { AuthenticationService } from "src/app/services/authentication.service";
import { CommentService } from "src/app/services/comment.service";
import { CommentComponent } from "./comment.component";

describe('CommentComponent', () => {
    let component: CommentComponent;
    let fixture: ComponentFixture<CommentComponent>;
    let commentService: any;
    let toastrService: any;
    let authenticationService: any;
    let router: any;
    let dialog: any;
    let dialogRefSpyObject = jasmine.createSpyObj({
        afterClosed: of(true),
        close: null
    })
    dialogRefSpyObject.componentInstance = { body: '' };

    beforeEach(() => {
        let commentsServiceMock = {
            deleteComment: jasmine.createSpy('deleteComment')
                .and.returnValue(of({})),
            updateComment : jasmine.createSpy('updateComment')
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
            ))
        };
        
        let authenticationServiceMock = {
            getLoggedInUserEmail: jasmine.createSpy('getLoggedInUserEmail')
                .and.returnValue(of('user@user.com'))
        };

        let dialogMock = {
            open: jasmine.createSpy('open')
                .and.returnValue(dialogRefSpyObject)
        }
    
        let routerMock = {
            navigate : jasmine.createSpy('navigate')
                .and.returnValue(of())
        }

        let toastrMock = {
            success : jasmine.createSpy('success')
                .and.returnValue(of('Successfully deleted comment!')),
            error : jasmine.createSpy('error')
                .and.returnValue(of('503 Server Unavailable'))
        }

        TestBed.configureTestingModule({
            declarations:   [ CommentComponent ],
            providers:      [ {provide: CommentService, useValue: commentsServiceMock },
                              {provide: AuthenticationService, useValue: authenticationServiceMock },
                              { provide: MAT_DIALOG_DATA, useValue: {} },
                              { provide: MatDialog, useValue: dialogMock },
                              { provide: Router, useValue: routerMock },
                              { provide: ToastrService, useValue: toastrMock }],
            imports: [
                BrowserAnimationsModule,
                MatIconModule,
                NgImageSliderModule,
                MatDividerModule,
                MatDialogModule
            ]
        }).compileComponents();
    
        fixture = TestBed.createComponent(CommentComponent);
        component = fixture.componentInstance;
        component.culturalSiteId = 1;
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
        component.activeComment = true;
        component.editing = false;
        router = TestBed.inject(Router);
        dialog = TestBed.inject(MatDialog);
        toastrService = TestBed.inject(ToastrService);
        commentService = TestBed.inject(CommentService);
        authenticationService = TestBed.inject(AuthenticationService);
      });

    it('should initialize component', ( () => {
        spyOn(component, 'usersComment');

        component.ngOnInit();

        expect(component.inputText).toEqual(component.comment.text);
        expect(component.usersComment).toHaveBeenCalled()
        expect(component.userComment).toEqual(true);
    }))

    it('should click on edit button', ( async () => {
        component.ngOnInit();

        component.editComment();

        expect(component.editing).toEqual(true);
    }))

    it('should delete comment', ( () => {
        component.ngOnInit();

        component.deleteComment();

        expect(commentService.deleteComment).toHaveBeenCalledWith(component.comment.id);
        expect(toastrService.success).toHaveBeenCalledWith('Successfully deleted comment!');
        expect(router.navigate).toHaveBeenCalledOnceWith(['cultural-site/1']);
        expect(component.activeComment).toEqual(false);
    }))

    it('should update comment', ( async () => {
        
        let event = {target: { inputText: { value: 'Some changed comment.'} } }
        component.editing = true;
        component.saveComment(event);

        expect(commentService.updateComment).toHaveBeenCalled();
        expect(component.editing).toEqual(false);
    }))
})