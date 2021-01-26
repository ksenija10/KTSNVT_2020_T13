import { Component, Input, OnInit } from '@angular/core';
import { SliderImage } from 'src/app/model/image.model';
import { NewsDTO } from 'src/app/model/news.model';

@Component({
  selector: 'app-news',
  templateUrl: './news.component.html',
  styleUrls: ['./news.component.sass'],
})
export class NewsComponent implements OnInit {
  @Input() news!: NewsDTO;

  imageSlider: Array<SliderImage> = [];

  constructor() {}

  ngOnInit(): void {
    this.imageSlider = [];
    this.news.images.map(
      imageModel => {
        this.imageSlider.push({
          image: 'data:image/jpg;base64,' + imageModel.content,
          thumbImage: 'data:image/jpg;base64,' + imageModel.content,
          title: imageModel.name
        });
      }
    );
  }

}
