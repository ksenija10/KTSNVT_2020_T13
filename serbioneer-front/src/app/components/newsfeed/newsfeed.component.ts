import { Component, OnInit } from '@angular/core';
import { NewsDTOInterface } from 'src/app/model/news.model';
import { NewsService } from 'src/app/services/news.service';

@Component({
  selector: 'app-newsfeed',
  templateUrl: './newsfeed.component.html',
  styleUrls: ['./newsfeed.component.sass'],
})
export class NewsfeedComponent implements OnInit {

  dataSource: NewsDTOInterface[] = [];
  page: number = 0;

  constructor(private newsService: NewsService, private window: Window) {}

  ngOnInit(): void {
    //neka za pocetak po defaultu dobavlja 2 novosti da bih videla da li infinite scroll radi
    this.newsService.getAllSubscribedNews(0, 2)
      .subscribe((responseData) => {
        this.dataSource = this.dataSource.concat(responseData.content)
    });
  }

  getNews() {
    this.newsService.getAllSubscribedNews(this.page, 2).subscribe((responseData) => {
      this.dataSource = this.dataSource.concat(responseData.content)
    });
  }

  onScroll() {
      this.page++
      this.getNews();
  }

}