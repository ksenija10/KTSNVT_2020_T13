import { Component, Input, OnInit } from '@angular/core';
import { NewsDTO } from 'src/app/model/news.model';

@Component({
  selector: 'app-news',
  templateUrl: './news.component.html',
  styleUrls: ['./news.component.sass']
})
export class NewsComponent implements OnInit {

  @Input() news!: NewsDTO;

  constructor() { }

  ngOnInit(): void {
  }

}
