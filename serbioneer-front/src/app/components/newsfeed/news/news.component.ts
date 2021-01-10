import { Component, Input, OnInit } from '@angular/core';
import { NewsDTOInterface } from 'src/app/model/news.model';

@Component({
  selector: 'app-news',
  templateUrl: './news.component.html',
  styleUrls: ['./news.component.sass'],
})
export class NewsComponent implements OnInit {
  @Input() news!: NewsDTOInterface;

  constructor() {}

  ngOnInit(): void {
    console.log(this.news);
  }
}
