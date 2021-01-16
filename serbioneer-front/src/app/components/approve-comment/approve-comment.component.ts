import { Component, Inject, Input, OnInit } from '@angular/core';
import { Comment } from '../../model/comment.model';
import { PendingCommentsComponent } from '../pending-comments/pending-comments.component';
import { CommentService } from '../../services/comment.service';
import { ToastrService } from 'ngx-toastr';

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
        private commentService: CommentService,
        private toastr: ToastrService) { 
        }

  ngOnInit(): void { }

  public approveComment(event : Event) : void {
    this.commentService.aproveComment(this.comment.id).subscribe(
      res => {
        this.pendingComments.fetchComments();
        this.toastr.success('Comment approved successfully!');
      }
    )
  }

  public declineComment(event : Event) : void {
    this.commentService.declineComment(this.comment.id).subscribe(
      res => {
        this.pendingComments.fetchComments();
        this.toastr.success('Comment rejected successfully!');
      }
    )
  }

}
