import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { ConfirmDeleteDialogComponent } from 'src/app/components/core/confirm-dialog/confirm-dialog.component';
import { Comment } from 'src/app/model/comment.model';
import { SliderImage } from 'src/app/model/image.model';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { CommentService } from 'src/app/services/comment.service';

@Component({
  selector: 'app-comment',
  templateUrl: './comment.component.html',
  styleUrls: ['./comment.component.sass']
})
export class CommentComponent implements OnInit {

  @Input() culturalSiteId!: number;
  @Input() comment!: Comment;
  editing = false;
  copyComment!: Comment;
  activeComment = true;
  inputText = '';
  userComment = true;

  commentImageSlider: Array<SliderImage> = [];

  editCommentForm: FormGroup;

  @Output() editedComment: EventEmitter<void> = new EventEmitter<void>();

  constructor(
    // private culturalSiteService : CulturalSiteService,
    private commentService: CommentService,
    private router: Router,
    private authenticationService: AuthenticationService,
    private toastr: ToastrService,
    private dialog: MatDialog,
  ) {
    this.editCommentForm = new FormGroup({
      text: new FormControl('', [Validators.required])
    });
   }

  ngOnInit(): void {
    this.inputText = this.comment.text;
    this.usersComment();
    this.commentImageSlider = [];
    this.comment.images.map(
      imageModel => {
        this.commentImageSlider.push({
          image: 'data:image/jpg;base64,' + imageModel.content,
          thumbImage: 'data:image/jpg;base64,' + imageModel.content,
          title: imageModel.name
        });
      }
    );
  }

  editComment(): void {
    this.editing = !this.editing;
    this.editCommentForm.get('text')?.setValue(this.comment.text);
  }

  deleteComment(): void {
    // confirm delete dialog
    const dialogRef = this.dialog.open(ConfirmDeleteDialogComponent, {
      data: {
        entity: 'comment',
        name: ''
      }
    });
    dialogRef.afterClosed()
      .subscribe(
        (response: boolean) => {
          if (response) {
          this.commentService.deleteComment(this.comment.id)
            .subscribe(
              serviceResponse => {
                this.toastr.success('Successfully deleted comment!');
                // navigacija na cultural site posle klika na row
                this.router.navigate(['cultural-site/' + this.culturalSiteId]);
                this.activeComment = false;
              },
              error => {
                if (error.error.message){
                  this.toastr.error(error.error.message);
                } else {
                  this.toastr.error('503 Server Unavailable');
                }
              });
        }
      });
  }

  saveComment(): void {
    if (this.editCommentForm.invalid) {
      return;
    }
    const editCommentText = this.editCommentForm.get('text')?.value;
    if (editCommentText !== this.comment.text){
      this.comment.text = editCommentText;
      this.comment.approved = false;
      this.commentService.updateComment(this.comment.id, this.comment).pipe(
        map((updatedComment: Comment) => {
          //this.inputText = updatedComment.text;
          //this.comment = updatedComment;
          this.editing = !this.editing;
        })
      ).subscribe(
        response => {
          this.toastr.success('Successfully edited your cultural site review!\n' +
                              'Your review will be visible after approval.');
          this.editCommentForm.reset();
          this.editedComment.emit();
        },
        error => {
          if (error.error.message){
            this.toastr.error(error.error.message);
          } else {
            this.toastr.error('503 Server Unavailable');
          }
        });
    } else {
      this.editing = !this.editing;
    }
  }

  usersComment(): void {
    const email = this.authenticationService.getLoggedInUserEmail();
    if (this.comment.username === email){
      this.userComment = true;
    }
    else{
      this.userComment = false;
    }
  }

  getTextErrorMessage(): string {
    if (this.editCommentForm.controls.text.touched) {
      if ( this.editCommentForm.controls.text.hasError('required')) {
      return 'Required field';
      }
    }
    return '';
  }
}
