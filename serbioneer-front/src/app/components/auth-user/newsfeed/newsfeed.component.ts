import { Component, OnInit } from '@angular/core';
import { NewsDTO } from 'src/app/model/news.model';
import { NewsService } from 'src/app/services/news.service';

@Component({
  selector: 'app-newsfeed',
  templateUrl: './newsfeed.component.html',
  styleUrls: ['./newsfeed.component.sass'],
})
export class NewsfeedComponent implements OnInit {

  dataSource: NewsDTO[] = [];
  page = 0;

  constructor(
    private newsService: NewsService
    ) {}

  ngOnInit(): void {
    // neka za pocetak po defaultu dobavlja 3 novosti da bih videla da li infinite scroll radi
    this.newsService.getAllSubscribedNews(0, 3)
      .subscribe((responseData) => {
        this.dataSource = this.dataSource.concat(responseData.content);
    });
  }

  getNews(): void {
    this.newsService.getAllSubscribedNews(this.page, 2).subscribe((responseData) => {
      this.dataSource = this.dataSource.concat(responseData.content);
    });
  }

  onScroll(): void {
      this.page++;
      this.getNews();
  }

}
