import { Component, Input, OnInit, ViewChild } from '@angular/core';
import { Comment } from '../../model/comment';
import { map } from 'rxjs/operators';
import { CommentService } from '../../services/comment.service';
import { CommentData } from 'src/app/services/comment.service';
import { MatPaginator, PageEvent } from '@angular/material/paginator';

@Component({
  selector: 'app-pending-comments',
  templateUrl: './pending-comments.component.html',
  styleUrls: ['./pending-comments.component.sass']
})
export class PendingCommentsComponent implements OnInit {

  commentsData! : CommentData;
  pageEvent: PageEvent = new PageEvent();

  @ViewChild(MatPaginator) paginator!: MatPaginator;

  constructor(private commentService: CommentService) { 
    this.pageEvent.pageSize = 1;
    this.pageEvent.pageIndex = 0;
  }

  ngOnInit(): void {
    this.fetchComments();
  }

  fetchComments() : void {
      this.commentService.getComments().pipe(
        map((commentData: CommentData) => this.commentsData = commentData)
      ).subscribe();
  }

  onPaginateChange(event : PageEvent){
    this.pageEvent = event;
    this.onGetNewPage();
  }  

  onGetNewPage() {
    let page = this.pageEvent.pageIndex;
    let size = this.pageEvent.pageSize;
    this.commentService.getComments(page, size).pipe(
      map((comments: CommentData) => this.commentsData = comments)
    ).subscribe();
  }
}
