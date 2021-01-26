import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { NewsDTO } from 'src/app/model/news.model';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { ImageService } from 'src/app/services/image.service';

@Component({
  selector: 'app-add-news-article',
  templateUrl: 'add-news-article.component.html',
  styleUrls: ['./add-news-article.component.sass']
})
export class AddNewsArticleComponent{

  newsForm: FormGroup;
  images: string[] = [];
  files: Blob[] = [];

  constructor(
    public dialogRef: MatDialogRef<AddNewsArticleComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any,
    private culturalSiteService: CulturalSiteService,
    private imageService: ImageService,
    private toastr: ToastrService)
    {
      this.newsForm = new FormGroup({
        text: new FormControl('', [Validators.required])
      });
    }

  close(): void {
    this.dialogRef.close();
  }

  onSubmit(): void {
    if (this.newsForm.invalid) {
        return;
    }

    const newsDto: NewsDTO =
      new NewsDTO(this.newsForm.value.text, new Date(), '', [], -1);

    this.culturalSiteService.createNews(newsDto, this.data.culturalSite.id).pipe(map(
      (newNewsDto: NewsDTO) => {
        if (this.files.length > 0) {
          for (const file of this.files) {
            this.imageService.createForNews(newNewsDto.id, file).pipe(map(
              () => {
                this.dialogRef.close();
              }
            )).subscribe();
          }
        }
        else{
          this.dialogRef.close();
        }
      }
    )).subscribe(
      response => {
        this.toastr.success('Successfully added news for cultural site!');
        this.files = [];
      },
      error => {
        if (error.error.message){
          this.toastr.error(error.error.message);
          this.files = [];
        } else {
          this.toastr.error('503 Server Unavailable');
          this.files = [];
        }
      });
  }

  getTextErrorMessage(): string {
    if (this.newsForm.controls.text.touched) {
        if ( this.newsForm.controls.text.hasError('required')) {
        return 'Required field';
        }
    }
    return '';
  }

  onFileChange(event: any): void {
    if (event.target.files && event.target.files[0]) {
      const reader = new FileReader();
      for (const file of event.target.files) {
        this.files.push(file);
        reader.onload = (loadEvent: any) => {
          this.images.push(loadEvent.target.result);
          this.newsForm.patchValue({
            fileSource: this.images
          });
        };
        reader.readAsDataURL(file);
      }
    }
  }

}
