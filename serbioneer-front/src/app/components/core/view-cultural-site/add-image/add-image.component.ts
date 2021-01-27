import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { CulturalSite } from 'src/app/model/cultural-site.model';
import { Image, SliderImage } from 'src/app/model/image.model';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { ImageService } from 'src/app/services/image.service';

@Component({
  selector: 'app-add-image',
  templateUrl: './add-image.component.html',
  styleUrls: ['./add-image.component.sass']
})
export class AddImageComponent implements OnInit {

  @Input() culturalSiteId!: number;
  @Input() culturalSite!: CulturalSite;
  @Output() culturalSiteChange = new EventEmitter<CulturalSite>();
  addNewImages = false;
  newImages: string[] = [];
  newImageFiles: Blob[] = [];
  myForm = new FormGroup({
    text: new FormControl('', [Validators.required]),
    file: new FormControl(''),
    fileSource: new FormControl('')});

  siteImageSlider: Array<SliderImage> = [];

  constructor(
    private imageService: ImageService,
    private toastr: ToastrService
  ) { }

  ngOnInit(): void {
  }

  submitImages(): void {
    // provera da li je lista slika prazna
    if (this.newImageFiles.length > 0){
      // ako nije onda dodajemo jedan po jedan fajl
      for (const file of this.newImageFiles) {
        this.imageService.createForCulturalSite(this.culturalSiteId, file).pipe(map(
          (image: Image) => {
            this.newImages = [];
            this.newImageFiles = [];
            this.addNewImages = false;
            this.culturalSite.images?.push(image);
            this.siteImageSlider.push({
              image: 'data:image/jpg;base64,' + image.content,
              thumbImage: 'data:image/jpg;base64,' + image.content,
              title: image.name});
          }
        )).subscribe(
          response => {
            this.toastr.success('Successfully added image for cultural site!');
            this.culturalSiteChange.emit();
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
    }
  }

  onNewImageChange(event: any): void {
    if (event.target.files && event.target.files[0]) {
      for (const file of event.target.files) {
        const reader = new FileReader();
        this.newImageFiles.push(file);
        reader.onload = (loadEvent: any) => {
          this.newImages.push(loadEvent.target.result);
          this.myForm.patchValue({
            fileSource: this.newImages
          });
        };
        reader.readAsDataURL(file);
      }
    }
  }
}
