import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { Image } from 'src/app/model/image.model';
import { CommentDto, CulturalSiteService } from 'src/app/services/cultural-site.service';
import { ImageService } from 'src/app/services/image.service';

@Component({
  selector: 'app-add-comment',
  templateUrl: './add-comment.component.html',
  styleUrls: ['./add-comment.component.sass']
})
export class AddCommentComponent implements OnInit {

  @Input() culturalSiteId!: number;
  @Input() culturalSiteName!: string;
  @Input() userIsLogged!: boolean;

  addNewComment = false;
  images: string[] = [];
  files: Blob[] = [];
  myForm: FormGroup;

  constructor(
    private culturalSiteService: CulturalSiteService,
    private imageService: ImageService,
    private toastr: ToastrService
  ) {
    this.myForm = new FormGroup({
      text: new FormControl('', [Validators.required]),
      file: new FormControl(''),
      fileSource: new FormControl('')});
   }

  ngOnInit(): void {}

  submit(): void {
    const commentText = this.myForm.get('text')?.value;
    this.culturalSiteService.createComment(this.culturalSiteId, commentText).pipe(map(
      (newComment: CommentDto) => {
        // provera da li je lista slika prazna
        if (this.files.length > 0){
          // ako nije onda dodajemo jedan po jedan fajl
          for (const file of this.files) {
            this.imageService.createForComment(newComment.id || 0, file).pipe(map(
              (image: Image) => {
                this.images = [];
                this.files = [];
                this.addNewComment = false;
                // this.addedComment.emit();
              }
            )).subscribe();
          }
        }
      }
    )).subscribe(
      // zavrsio kreiranje komentara
      response => {
        this.toastr.success('Successfully reviewed cultural site!\n' +
                            'Your review will be visible after approval.');
        this.addNewComment = false;
        this.myForm.reset();
      },
      error => {
        if (error.error.message){
          this.toastr.error(error.error.message);
        } else {
          this.toastr.error('503 Server Unavailable');
        }
      }
    );
  }

  onFileChange(event: any): void {
    if (event.target.files && event.target.files[0]) {
      for (const file of event.target.files) {
        const reader = new FileReader();
        this.files.push(file);
        reader.onload = (loadEvent: any) => {
          this.images.push(loadEvent.target.result);
          this.myForm.patchValue({
            fileSource: this.images
          });
        };
        reader.readAsDataURL(file);
      }
    }
  }

  addComments(): void {
    this.addNewComment = !this.addNewComment;
    this.images = [];
    this.myForm.reset();
  }

  getTextErrorMessage(): string {
    if (this.myForm.controls.text.touched) {
        if ( this.myForm.controls.text.hasError('required')) {
        return 'Required field';
        }
    }
    return '';
  }
}
