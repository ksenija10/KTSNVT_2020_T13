import { Component, OnInit } from '@angular/core';
import { PageEvent } from '@angular/material/paginator';
import { map } from 'rxjs/operators';
import { CommentData } from 'src/app/services/comment.service';
import { CommentService } from '../../../services/comment.service';

@Component({
  selector: 'app-pending-comments',
  templateUrl: './pending-comments.component.html',
  styleUrls: ['./pending-comments.component.sass']
})
export class PendingCommentsComponent implements OnInit {

  commentsData: CommentData = {
    content : [],
    totalPages: 0,
    totalElements: 0,
    size : 0
  };

  pageEvent: PageEvent = new PageEvent();

  progressBar = true;

  constructor(private commentService: CommentService) {
    this.pageEvent.pageSize = 1;
    this.pageEvent.pageIndex = 0;
  }

  ngOnInit(): void {
    this.fetchComments();
  }

  fetchComments(): void {
      this.commentService.getComments().pipe(
        map((commentData: CommentData) => this.commentsData = commentData)
      ).subscribe(() => this.progressBar = false);
  }

  onPaginateChange(event: PageEvent): void {
    this.pageEvent = event;
    this.onGetNewPage();
  }

  onGetNewPage(): void {
    this.progressBar = true;
    const page = this.pageEvent.pageIndex;
    const size = this.pageEvent.pageSize;
    this.commentService.getComments(page, size).pipe(
      map((comments: CommentData) => this.commentsData = comments)
    ).subscribe(() => this.progressBar = false);
  }
}
