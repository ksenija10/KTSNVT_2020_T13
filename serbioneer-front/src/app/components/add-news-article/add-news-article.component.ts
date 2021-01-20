import { Component, Inject, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { map } from 'rxjs/operators';
import { NewsDTO } from 'src/app/model/news.model';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { ImageService, NewsDto } from 'src/app/services/image.service';
import { Image, ImageDTO } from "src/app/model/image.model";

@Component({
  selector: 'app-add-news-article',
  templateUrl: 'add-news-article.component.html',
  styleUrls: ['./add-news-article.component.sass']
})
export class AddNewsArticleComponent{

  newsForm : FormGroup;
  images : any = [];
  files : any = [];

  constructor(
    public dialogRef: MatDialogRef<AddNewsArticleComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private culturalSiteService : CulturalSiteService,
    private imageService : ImageService)
    {
      this.newsForm = new FormGroup({
        text: new FormControl('', [Validators.required])
      })
    }

  close() {
    this.dialogRef.close();
  }

  onSubmit(event : any){
    if (this.newsForm.invalid) {
        return;
    }

    const newsDto: NewsDTO = 
      new NewsDTO(this.newsForm.value.text,new Date(),'',[]);
    
    this.culturalSiteService.createNews(newsDto, this.data.culturalSite.id).pipe(map(
      (newsDto : NewsDto) => {
        if(this.files.length > 0){
          for(let i = 0; i < this.files.length; i++){
            this.imageService.createForNews(newsDto.id, this.files[i]).pipe(map(
              () => {
                this.dialogRef.close();
              }
            )).subscribe()
          }
        }
        else{
          this.dialogRef.close();
        }
      }
    )).subscribe(() => this.files = []);
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

  onFileChange(event : any) {
    if (event.target.files && event.target.files[0]) {
      for (let i = 0; i < event.target.files.length; i++) {
        //let name = event.target.files[i].name
        var reader = new FileReader();
        this.files.push(event.target.files[i]);
        reader.onload = (event:any) => {
          this.images.push(event.target.result);
          this.newsForm.patchValue({
            fileSource: this.images
          });
        }

        reader.readAsDataURL(event.target.files[i]);
      }
    }
  }

}
