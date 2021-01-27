import { Component, Input, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { PageEvent } from '@angular/material/paginator';
import { map } from 'rxjs/operators';
import { CommentData } from 'src/app/services/comment.service';
import { CommentDto, CulturalSiteService } from 'src/app/services/cultural-site.service';
import { Image, SliderImage } from 'src/app/model/image.model';
import { ToastrService } from 'ngx-toastr';
import { ImageService } from 'src/app/services/image.service';

@Component({
  selector: 'app-comments-list',
  templateUrl: './comments-list.component.html',
  styleUrls: ['./comments-list.component.sass']
})
export class CommentsListComponent implements OnInit {

  @Input() culturalSiteId!: number;
  @Input() culturalSiteName!: string;
  @Input() userIsLogged!: boolean;
  comments: CommentData = {
    content: [],
    totalPages: 0,
    totalElements: 0,
    size: 0
  };
  pageEventComments: PageEvent = new PageEvent();
  page = 0;
  size = 1;

  constructor(
    private culturalSiteService: CulturalSiteService) { }

  ngOnInit(): void {
    this.fetchComments(this.culturalSiteId);
  }

  fetchComments(id: number): void {
    this.culturalSiteService.getAllCulturalSiteComments(id, this.page, this.size).pipe(
      map((comments: CommentData) => this.comments = comments)
    ).subscribe();
  }

  onPaginateChangeComments(event: PageEvent): void {
    this.pageEventComments = event;
    this.page = event.pageIndex;
    this.size = event.pageSize;
    this.fetchComments(this.culturalSiteId);
  }

  onEditComment(): void {
    // dobavi ponovo sve komentare
    this.fetchComments(this.culturalSiteId);
  }
}
