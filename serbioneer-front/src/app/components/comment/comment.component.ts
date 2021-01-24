import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
import { Comment } from 'src/app/model/comment.model';
import { CommentService } from 'src/app/services/comment.service';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { map } from 'rxjs/operators';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { ConfirmDeleteDialog } from 'src/app/dialogs/confirm-dialog/confirm-dialog.component';
import { ToastrService } from 'ngx-toastr';
import { MatDialog } from '@angular/material/dialog';

@Component({
  selector: 'app-comment',
  templateUrl: './comment.component.html',
  styleUrls: ['./comment.component.sass']
})
export class CommentComponent implements OnInit {

  @Input() culturalSiteId! : any;
  @Input() comment! : Comment;
  editing : boolean = false;
  copyComment! : Comment;
  activeComment : boolean = true;
  inputText = "";
  userComment : boolean = true;

  commentImageSlider: Array<object> = []

  constructor(
    private culturalSiteService : CulturalSiteService,
    private commentService : CommentService,
    private router : Router,
    private authenticationService : AuthenticationService,
    private toastr : ToastrService,
    private dialog: MatDialog
  ) { }

  ngOnInit(): void {
    this.inputText = this.comment.text;
    this.usersComment();
    this.commentImageSlider = []
    this.comment.images.map(
      imageModel => {
        this.commentImageSlider.push({image: "data:image/jpg;base64,"+imageModel.content, thumbImage: "data:image/jpg;base64,"+imageModel.content, title: imageModel.name})
      }
    )
  }

  editComment(){
    this.editing = !this.editing;
  }

  deleteComment(){
    // confirm delete dialog
    const dialogRef = this.dialog.open(ConfirmDeleteDialog, {
      data: {
        entity: 'comment',
        name: ''
      }
    })
    dialogRef.afterClosed()
      .subscribe(
        (response: boolean) => {
          if (response) {
          this.commentService.deleteComment(this.comment.id)
            .subscribe(
              response => {
                this.toastr.success('Successfully deleted comment!');
                //navigacija na cultural site posle klika na row
                this.router.navigate(['cultural-site/'+this.culturalSiteId]);
                this.activeComment = false;
              },
              error => {
                if(error.error.message){
                  this.toastr.error(error.error.message);
                } else {
                  this.toastr.error('503 Server Unavailable');
                }
              });
        }
      })
  }

  saveComment(event : any){
    const newComment = event!.target.inputText.value
    if(newComment != this.comment.text){
      this.comment.text = newComment;
      this.commentService.updateComment(this.comment.id, this.comment).pipe(
        map((updatedComment : Comment) => {
          this.inputText = updatedComment.text;
          this.comment = updatedComment;
          this.editing = !this.editing;
        })
      ).subscribe()
    } else {
      this.editing = !this.editing;
    }
  }

  usersComment(){
    let email = this.authenticationService.getLoggedInUserEmail()
    if(this.comment.username == email){
      this.userComment = true;
    }
    else{
      this.userComment = false;
    }
  }
}
