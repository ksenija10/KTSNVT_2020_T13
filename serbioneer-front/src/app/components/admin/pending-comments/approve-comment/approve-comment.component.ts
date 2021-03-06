import { Component, EventEmitter, Inject, Input, OnInit, Output } from '@angular/core';
import { Comment } from '../../../../model/comment.model';
import { PendingCommentsComponent } from '../pending-comments.component';
import { CommentService } from '../../../../services/comment.service';
import { ToastrService } from 'ngx-toastr';
import { SliderImage } from 'src/app/model/image.model';

@Component({
  selector: 'app-approve-comment',
  templateUrl: './approve-comment.component.html',
  styleUrls: ['./approve-comment.component.sass']
})
export class ApproveCommentComponent implements OnInit {

  @Input() comment!: Comment;
  public noImages = true;

  @Output() commentSaidFetch: EventEmitter<void> = new EventEmitter<void>();

  imageSlider: Array<SliderImage> = [];

  constructor(
    private commentService: CommentService,
    private toastr: ToastrService) {}

  ngOnInit(): void {
    this.imageSlider = [];
    this.comment.images.map(
      imageModel => {
        this.imageSlider.push({
          image: 'data:image/jpg;base64,' + imageModel.content,
          thumbImage: 'data:image/jpg;base64,' + imageModel.content,
          title: imageModel.name
        });
      }
    );
  }

  public approveComment(): void {
    this.commentService.aproveComment(this.comment.id).subscribe(
      res => {
        this.commentSaidFetch.emit();
        this.toastr.success('Comment approved successfully!');
      }
    );
  }

  public declineComment(): void {
    this.commentService.declineComment(this.comment.id).subscribe(
      res => {
        this.commentSaidFetch.emit();
        this.toastr.success('Comment rejected successfully!');
      }
    );
  }

}
