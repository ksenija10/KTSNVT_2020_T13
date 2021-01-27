import { HarnessLoader } from '@angular/cdk/testing';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatDialog, MatDialogModule, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatDividerModule } from '@angular/material/divider';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatFormFieldHarness } from '@angular/material/form-field/testing';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatInputHarness } from '@angular/material/input/testing';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { Router } from '@angular/router';
import { NgImageSliderModule } from 'ng-image-slider';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { CommentService } from 'src/app/services/comment.service';
import { CommentComponent } from './comment.component';

describe('CommentComponent', () => {
    let component: CommentComponent;
    let fixture: ComponentFixture<CommentComponent>;
    let commentService: CommentService;
    let toastrService: ToastrService;
    let authenticationService: AuthenticationService;
    let router: Router;
    let dialog: MatDialog;
    let loader: HarnessLoader;
    const dialogRefSpyObject = jasmine.createSpyObj({
        afterClosed: of(true),
        close: null
    });
    dialogRefSpyObject.componentInstance = { body: '' };

    beforeEach(() => {
        const commentsServiceMock = {
            deleteComment: jasmine.createSpy('deleteComment')
                .and.returnValue(of({})),
            updateComment : jasmine.createSpy('updateComment')
                .and.returnValue(of({
                    id: 1,
                    name: 'Nameuser',
                    surname: 'Surnameuser',
                    username: 'user@user.com',
                    culturalSiteName: 'CulturalSite1',
                    text: 'CulturalSite1 was really good.',
                    approved: true,
                    images: []
                }
            ))
        };

        const authenticationServiceMock = {
            getLoggedInUserEmail: jasmine.createSpy('getLoggedInUserEmail')
                .and.returnValue(of('user@user.com'))
        };

        const dialogMock = {
            open: jasmine.createSpy('open')
                .and.returnValue(dialogRefSpyObject)
        };

        const routerMock = {
            navigate : jasmine.createSpy('navigate')
                .and.returnValue(of())
        };

        const toastrMock = {
            success : jasmine.createSpy('success')
                .and.returnValue(of('Successfully deleted comment!')),
            error : jasmine.createSpy('error')
                .and.returnValue(of('503 Server Unavailable'))
        };

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
                MatDialogModule,
                ReactiveFormsModule,
                FormsModule,
                MatFormFieldModule,
                MatInputModule
            ]
        }).compileComponents();

        fixture = TestBed.createComponent(CommentComponent);
        component = fixture.componentInstance;
        component.culturalSiteId = 1;
        component.comment = {
            id: 1,
            name: 'Nameuser',
            surname: 'Surnameuser',
            username: 'user@user.com',
            culturalSiteName: 'CulturalSite1',
            text: 'CulturalSite1 was really good.',
            approved: true,
            images: []
        };
        component.activeComment = true;
        component.editing = false;
        router = TestBed.inject(Router);
        dialog = TestBed.inject(MatDialog);
        toastrService = TestBed.inject(ToastrService);
        commentService = TestBed.inject(CommentService);
        authenticationService = TestBed.inject(AuthenticationService);
        loader = TestbedHarnessEnvironment.loader(fixture);
      });

    it('should initialize component', ( () => {
        spyOn(component, 'usersComment');

        component.ngOnInit();

        expect(component.inputText).toEqual(component.comment.text);
        expect(component.usersComment).toHaveBeenCalled();
        expect(component.userComment).toEqual(true);
    }));

    it('should click on edit button', ( async () => {
        component.ngOnInit();

        component.editComment();

        expect(component.editing).toEqual(true);
    }));

    it('should delete comment', ( () => {
        component.ngOnInit();

        component.deleteComment();

        expect(commentService.deleteComment).toHaveBeenCalledWith(component.comment.id);
        expect(toastrService.success).toHaveBeenCalledWith('Successfully deleted comment!');
        expect(router.navigate).toHaveBeenCalledOnceWith(['cultural-site/1']);
        expect(component.activeComment).toEqual(false);
    }));

    it('should update comment', ( async () => {
        component.editing = true;
        const commentText = await loader.getHarness(MatInputHarness.with({selector: '#edit-comment-input'}));
        await commentText.setValue('novi komentar');
        await commentText.blur();

        component.saveComment();

        expect(commentService.updateComment).toHaveBeenCalled();
        expect(component.editing).toEqual(false);
    }));

    it('should get text error message - empty field', async () => {
        component.editing = true;
        // popunjavanje forme
        const commentTextInput = await loader.getHarness(MatInputHarness.with({selector: '#edit-comment-input'}));
        await commentTextInput.setValue('');
        await commentTextInput.blur();

        const returned = component.getTextErrorMessage();
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('Required field');

        const textFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#edit-comment-form-field'}));
        expect(await textFormField.getTextErrors()).toEqual(['Required field']);
        expect(component.editCommentForm.invalid).toBeTruthy();
    });

    it('should not get type name error message - valid field', async () => {
        component.editing = true;
        // popunjavanje forme
        const commentTextInput = await loader.getHarness(MatInputHarness.with({selector: '#edit-comment-input'}));
        await commentTextInput.setValue('Izmenjen komentar');
        await commentTextInput.blur();

        const returned = component.getTextErrorMessage();
        // sta ocekujemo da je povratna vrednost
        expect(returned).toEqual('');

        const textFormField = await loader.getHarness(MatFormFieldHarness.with({selector: '#edit-comment-form-field'}));
        expect(await textFormField.getTextErrors()).toEqual([]);
        expect(component.editCommentForm.valid).toBeTruthy();
    });
});
