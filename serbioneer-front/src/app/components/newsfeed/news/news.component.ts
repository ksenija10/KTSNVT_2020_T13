import { Component, Input, OnInit } from '@angular/core';
import { NewsDTOInterface } from 'src/app/model/news.model';

@Component({
  selector: 'app-news',
  templateUrl: './news.component.html',
  styleUrls: ['./news.component.sass'],
})
export class NewsComponent implements OnInit {
  @Input() news!: NewsDTOInterface;

  imageSlider: Array<object> = []
  /* {
    image: '.../iOe/xHHf4nf8AE75h3j1x64ZmZ//Z==', // Support base64 image
    thumbImage: '.../iOe/xHHf4nf8AE75h3j1x64ZmZ//Z==', // Support base64 image
    title: 'Image title', //Optional: You can use this key if want to show image with title
    alt: 'Image alt' //Optional: You can use this key if want to show image with alt
  } */

  constructor() {}

  ngOnInit(): void {
    this.imageSlider = []
    this.news.images.map(
      imageModel => {
        this.imageSlider.push({image: "data:image/jpg;base64,"+imageModel.content, thumbImage: "data:image/jpg;base64,"+imageModel.content, title: imageModel.name})
      }
    )
  }

}
