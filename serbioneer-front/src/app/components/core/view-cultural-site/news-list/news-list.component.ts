import { Component, Input, OnInit } from '@angular/core';
import { PageEvent } from '@angular/material/paginator';
import { map } from 'rxjs/operators';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { NewsData } from 'src/app/services/news.service';

@Component({
  selector: 'app-news-list',
  templateUrl: './news-list.component.html',
  styleUrls: ['./news-list.component.sass']
})
export class NewsListComponent implements OnInit {

  @Input() culturalSiteId!: number;
  @Input() culturalSiteName!: string;
  @Input() adminIsLogged!: boolean;
  news: NewsData = {
    content: [],
    totalPages: 0,
    totalElements: 0,
    size: 0
  };
  pageEventNews: PageEvent = new PageEvent();
  page = 0;
  size = 1;

  constructor(private culturalSiteService: CulturalSiteService) { }

  ngOnInit(): void {
    this.fetchNews(this.culturalSiteId);
  }

  fetchNews(id: number): void {
    this.culturalSiteService.getAllCulturalSiteNews(id, this.page, this.size).pipe(
      map((news: NewsData) => this.news = news)
    ).subscribe();
  }

  onPaginateChangeNews(event: PageEvent): void {
    this.pageEventNews = event;
    this.page = event.pageIndex;
    this.size = event.pageSize;
    this.fetchNews(this.culturalSiteId);
  }

}
