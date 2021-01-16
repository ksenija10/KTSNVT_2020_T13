import { Component, OnInit, Input } from '@angular/core';
import { Router } from '@angular/router';
import { Comment } from 'src/app/model/comment.model';
import { CommentService } from 'src/app/services/comment.service';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { map } from 'rxjs/operators';
import { AuthenticationService } from 'src/app/services/authentication.service';

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

  constructor(
    private culturalSiteService : CulturalSiteService,
    private commentService : CommentService,
    private router : Router,
    private authenticationService : AuthenticationService
  ) { }

  ngOnInit(): void {
    this.inputText = this.comment.text;
    this.usersComment();
  }

  editComment(){
    this.editing = !this.editing;
  }

  deleteComment(){
    this.commentService.deleteComment(this.comment.id).subscribe();
    //sharing service for sibling communication
    this.culturalSiteService.setData(this.culturalSiteId);
    //navigacija na cultural site posle klika na row
    this.router.navigate(['cultural-site']);
    this.activeComment = false;
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
