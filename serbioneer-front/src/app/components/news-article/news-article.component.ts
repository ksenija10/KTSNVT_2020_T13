import { Component, OnInit, Input } from '@angular/core';
import { NewsDTO } from 'src/app/model/news.model';

@Component({
  selector: 'app-news-article',
  templateUrl: './news-article.component.html',
  styleUrls: ['./news-article.component.sass']
})
export class NewsArticleComponent implements OnInit {

  @Input() news! : NewsDTO;

  constructor() { }

  ngOnInit(): void {
  }

}
