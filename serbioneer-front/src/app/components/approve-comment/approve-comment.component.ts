import { Component, Inject, Input, OnInit } from '@angular/core';
import { Comment } from '../../model/comment';
import { PendingCommentsComponent } from '../pending-comments/pending-comments.component';
import { CommentService } from '../../services/comment.service';

@Component({
  selector: 'app-approve-comment',
  templateUrl: './approve-comment.component.html',
  styleUrls: ['./approve-comment.component.sass']
})
export class ApproveCommentComponent implements OnInit {

  @Input() comment:Comment = new Comment();
  public noImages = true;
  public fileReader : FileReader = new FileReader();

  constructor(@Inject(PendingCommentsComponent) 
        private pendingComments : PendingCommentsComponent,
        private commentService: CommentService) { 
        }

  ngOnInit(): void { }

  public approveComment(event : Event) : void {
    this.commentService.aproveComment(this.comment.id).subscribe(
      res => {
        this.pendingComments.fetchComments();
      },
      err => {
        console.log(err.message)
      }
    )
  }

  public declineComment(event : Event) : void {
    this.commentService.declineComment(this.comment.id).subscribe(
      res => {
        this.pendingComments.fetchComments();
      },
      err => {
        console.log(err.message)
      }
    )
  }

}
