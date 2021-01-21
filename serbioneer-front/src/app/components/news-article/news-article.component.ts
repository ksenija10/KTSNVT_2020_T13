import { Component, OnInit, Input } from '@angular/core';
import { NewsDTO } from 'src/app/model/news.model';

@Component({
  selector: 'app-news-article',
  templateUrl: './news-article.component.html',
  styleUrls: ['./news-article.component.sass']
})
export class NewsArticleComponent implements OnInit {

  @Input() news! : NewsDTO;

  newsImageSlider: Array<object> = []

  constructor() { }

  ngOnInit(): void {
    this.newsImageSlider = []
    this.news.images.map(
      imageModel => {
        this.newsImageSlider.push({image: "data:image/jpg;base64,"+imageModel.content, thumbImage: "data:image/jpg;base64,"+imageModel.content, title: imageModel.name})
      }
    )
  }

}
