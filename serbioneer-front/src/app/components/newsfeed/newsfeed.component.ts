import { Component, OnInit } from '@angular/core';
import { PageEvent } from '@angular/material/paginator';
import { NewsDTOInterface } from 'src/app/model/news.model';
import { NewsDataByPage, NewsService } from 'src/app/services/news.service';

@Component({
  selector: 'app-newsfeed',
  templateUrl: './newsfeed.component.html',
  styleUrls: ['./newsfeed.component.sass'],
})
export class NewsfeedComponent implements OnInit {
  dataSource!: NewsDataByPage;

  constructor(private newsService: NewsService, private window: Window) {}

  ngOnInit(): void {
    //neka za pocetak po defaultu dobavlja 1 novost da bih videla da li infinite scroll radi
    this.newsService.getAllSubscribedNews(0, 1).subscribe((responseData) => {
      this.dataSource = responseData;
    });
  }

  onPaginateChange(event: PageEvent) {
    let page = event.pageIndex;
    let size = event.pageSize;

    window.scroll(0, 0);

    this.newsService
      .getAllSubscribedNews(page, size)
      .subscribe((responseData) => {
        window.scroll(0, 0);
        this.dataSource = responseData;
      });
  }
}
