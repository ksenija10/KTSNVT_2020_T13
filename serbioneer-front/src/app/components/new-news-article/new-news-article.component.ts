import { Component, OnInit, Input, Inject } from '@angular/core';
import { FormGroup, FormControl, Validators, FormsModule, ValidatorFn } from '@angular/forms';
import { CulturalSite } from 'src/app/model/cultural-site.model';
import { NewsDTO } from 'src/app/model/news.model';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { Image } from 'src/app/model/image.model';
import { Router } from '@angular/router';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';

export interface DialogData {
  id: number;
  name: string;
}

@Component({
  selector: 'app-new-news-article',
  templateUrl: './new-news-article.component.html',
  styleUrls: ['./new-news-article.component.sass']
})
export class NewNewsArticleComponent implements OnInit {

  newsForm! : FormGroup;
  images! : Image[];

  constructor(
    public dialogRef: MatDialogRef<NewNewsArticleComponent>,
    private culturalSiteService : CulturalSiteService,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) {
      this.newsForm = new FormGroup({
        text: new FormControl('', [Validators.required])
      });
    }

  onNoClick(): void {
    this.dialogRef.close();
  }

  ngOnInit(): void {}

  onSubmit(){
    if (this.newsForm.invalid) {
      return;
    }

    const newsDto: NewsDTO = 
      new NewsDTO(
        this.newsForm.value.text, 
        this.images, 
      );
    
    this.culturalSiteService.createNews(newsDto, this.data.id)
    .subscribe(
      response => {
        console.log(response);
        this.newsForm.reset();
        this.dialogRef.close();
      },
      error => {
        console.log(error.message);
        this.newsForm.reset();
      })
  }

  cancelForm(event : Event){
    this.newsForm.reset();
    this.dialogRef.close();
  }

  getTextErrorMessage() {
    if(this.newsForm.controls['text'].touched) {
      if ( this.newsForm.controls['text'].hasError('required')) {
        return 'Required field';
      }
    }
    return '';
  }

  onFileChange() {
    //prebaciti u niz bajtova
    //dodati u images
    //dodati na frontu kao prikazane
  }

}