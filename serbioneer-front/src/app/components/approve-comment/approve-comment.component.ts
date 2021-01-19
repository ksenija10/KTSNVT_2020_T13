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
  // vaj iz dis hir
  public fileReader : FileReader = new FileReader();
  
  imageSlider: Array<object> = []

  constructor(/*olso dis*/@Inject(PendingCommentsComponent) 
        private pendingComments : PendingCommentsComponent,
        private commentService: CommentService,
        private toastr: ToastrService) { 
        }

  ngOnInit(): void { 
    this.imageSlider = []
    this.comment.images.map(
      imageModel => {
        this.imageSlider.push({image: "data:image/jpg;base64,"+imageModel.content, thumbImage: "data:image/jpg;base64,"+imageModel.content, title: imageModel.name})
      }
    )
  }

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
