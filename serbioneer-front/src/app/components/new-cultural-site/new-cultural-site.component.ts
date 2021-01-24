import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Options } from 'ngx-google-places-autocomplete/objects/options/options';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { CulturalCategoryType } from 'src/app/model/cultural-category-type.model';
import { CulturalSiteCategory } from 'src/app/model/cultural-site-category.model';
import { CulturalSite, CulturalSiteDTO, CulturalSiteView } from 'src/app/model/cultural-site.model';
import { Image } from 'src/app/model/image.model';
import { CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { GeocodingService } from 'src/app/services/geocoding.service';
import { ImageService } from 'src/app/services/image.service';

export class Location {
  constructor(
    public lat: number,
    public lng: number
  ) {}
}

@Component({
  selector: 'app-new-cultural-site',
  templateUrl: './new-cultural-site.component.html',
  styleUrls: ['./new-cultural-site.component.sass'],
})
export class NewCulturalSiteComponent implements OnInit {
  newCulturalSiteForm: FormGroup;

  allCategoriesModel: CulturalSiteCategory[] = [];
  allCategoryTypesModel: CulturalCategoryType[] = [];
  categoryModel: CulturalSiteCategory = {id: 0, name: ''};
  categoryTypeModel: CulturalCategoryType = {id: 0, name: ''};

  autocompleteOptions: Options = new Options({componentRestrictions: { country: 'RS' }})

  foundAddress: string = '';
  location: Location = new Location(0, 0);

  // image import
  images: any = [];
  files: any = [];

  // for editing
  editCulturalSiteId: number;
  editCulturalSite!: CulturalSiteView;

  title: string = 'Add new cultural site';
  btnTitle: string = 'Create';

  constructor(
    private culturalSiteService: CulturalSiteService,
    private culturalSiteCategoryService: CulturalSiteCategoryService,
    private imageService: ImageService,
    private geocodingService: GeocodingService,
    private toastr: ToastrService,
    private router: Router
  ) {
    this.newCulturalSiteForm = new FormGroup({
      name: new FormControl('', [Validators.required]),
      address: new FormControl('', [Validators.required]),
      description: new FormControl('', []),
      category: new FormControl('', [Validators.required]),
      categoryType: new FormControl('', [Validators.required]),
      lat: new FormControl({value: '', disabled: true}, []),
      lng: new FormControl({value: '', disabled: true}, []),
    })
    // ako je u edit modu, popuni formu
    let siteUrl = this.router.url.split('/')
    this.editCulturalSiteId = +siteUrl[siteUrl.length - 1]
    if (!isNaN(this.editCulturalSiteId)) {
      // dobavi kulturno dobro i popuni formu
      this.title = 'Edit cultural site';
      this.btnTitle = 'Save';
      this.loadCulturalSite();
    } else {
      this.title = 'Add new cultural site';
      this.btnTitle = 'Create';
    }
    this.culturalSiteCategoryService
      .getAllCulturalSiteCategorys()
      .subscribe((responseData) => {
        this.allCategoriesModel = responseData;
        if (!this.editCulturalSite) {
          this.categoryModel = new CulturalSiteCategory(responseData[0].name, responseData[0].id);
          this.newCulturalSiteForm.get('category')?.setValue(this.categoryModel.id);
          this.categoryChange(null);
        }
      });
  }

  loadCulturalSite() {
    this.culturalSiteService.getCulturalSite(this.editCulturalSiteId).pipe(
      map((culturalSite: CulturalSiteView) => {
        this.editCulturalSite = culturalSite;
      })
    ).subscribe(
      response => {
        // popunjavanje forme
        this.newCulturalSiteForm.get('name')?.setValue(this.editCulturalSite.name);
        this.newCulturalSiteForm.get('address')?.setValue(this.editCulturalSite.address + ', ' + this.editCulturalSite.city + ', Serbia');
        this.newCulturalSiteForm.get('description')?.setValue(this.editCulturalSite.description);
        this.newCulturalSiteForm.get('category')?.setValue(this.editCulturalSite.categoryId);
        this.newCulturalSiteForm.get('categoryType')?.setValue(this.editCulturalSite.categoryTypeId);
        this.newCulturalSiteForm.get('lat')?.setValue(this.editCulturalSite.lat?.toFixed(3));
        this.newCulturalSiteForm.get('lng')?.setValue(this.editCulturalSite.lng?.toFixed(3));
        // postavljanje postojece kategorije
        this.categoryModel.id = this.editCulturalSite.categoryId!;
        this.categoryModel.name = this.editCulturalSite.category!;
        // dobavljanje svih tipova za kategoriju
        this.categoryChange(null);
      },
      error => {
        this.toastr.error('Requested cultural site does not exist.');
        this.router.navigate(['homepage']);
      }
    );
  }

  ngOnInit(): void {}

  getRequiredFieldErrorMessage(fieldName: string) {
    if (this.newCulturalSiteForm.controls[fieldName].touched) {
      return this.newCulturalSiteForm.controls[fieldName].hasError('required')
        ? 'Required field'
        : '';
    }
    return '';
  }

  categoryChange(event: any) {
    if(event) {
      this.categoryModel.id = event.value;
      this.categoryModel.name = event.source.triggerValue;
    }
    this.culturalSiteCategoryService.getAllCategoryTypes(this.categoryModel.id)
    .subscribe((responseData) => {
      this.allCategoryTypesModel = responseData;
    })
  }

  onFileChange(event : any) {
    if (event.target.files && event.target.files[0]) {
      for (let i = 0; i < event.target.files.length; i++) {
        var reader = new FileReader();
        this.files.push(event.target.files[i]);
        reader.onload = (event:any) => {
          this.images.push(event.target.result);
        }
        reader.readAsDataURL(event.target.files[i]);
      }
    }
  }

  public addressChange(address: any) { 
    //setting address from API to local variable 
    this.foundAddress = address.formatted_address;
    this.geocodingService.getLatlong(this.foundAddress)
    .subscribe(
      response => {
        this.location.lat = (response.results[0].geometry.location.lat);
        this.location.lng = (response.results[0].geometry.location.lng);
        this.newCulturalSiteForm.get('lat')?.setValue(this.location.lat.toFixed(3))
        this.newCulturalSiteForm.get('lng')?.setValue(this.location.lng.toFixed(3))
      }
    );
  }

  onSubmit() {
    if (this.newCulturalSiteForm.invalid) {
      return;
    }

    let address;
    let city;
    if(this.foundAddress) {
      let addressElems = this.foundAddress.split(', ');
      address = addressElems[0];
      city = addressElems[addressElems.length - 2];
      city = city.replace(/[0-9]/g, '').trim();
    } else {
      // nije izmenjena adresa
      address = this.editCulturalSite.address;
      city = this.editCulturalSite.city;
      this.location.lat = this.editCulturalSite.lat!;
      this.location.lng = this.editCulturalSite.lng!;
    }

    const culturalSite: CulturalSite = new CulturalSiteDTO(
      undefined,
      this.newCulturalSiteForm.value.name,
      this.newCulturalSiteForm.value.category,
      undefined,
      this.newCulturalSiteForm.value.categoryType,
      undefined,
      this.location.lat,
      this.location.lng,
      address,
      city,
      this.newCulturalSiteForm.value.description,
      0
    );

    // kreiranje ili updatovanje
    if(this.editCulturalSiteId) {
      this.culturalSiteService.updateCulturalSite(this.editCulturalSiteId, culturalSite).pipe(map(
        (savedCulturalSite: CulturalSiteDTO) => {
          //provera da li je lista slika prazna
          if(this.files.length > 0){
            //ako nije onda dodajemo jedan po jedan fajl
            for (let i = 0; i < this.files.length; i++) {
              this.imageService.createForCulturalSite(savedCulturalSite.id!, this.files[i]).pipe(map(
                (image : Image) => {
                  this.images = [];
                  this.files = [];
                }
              )).subscribe()
            }
          }
          return savedCulturalSite;
        }
      )).subscribe(
        (response) => {
          this.toastr.success('Successfully edited cultural site!');
          this.router.navigate(['/cultural-site/'+response.id]);
        },
        (error) => {
          if (error.error.message) {
            this.toastr.error(error.error.message);
          } else if (error.error.violations) {
            this.toastr.error(error.error.violations[0].message)
          } else {
            this.toastr.error('503 Server Unavailable');
          }
          this.newCulturalSiteForm.reset();
        }
      );
    } else {
      this.culturalSiteService.createCulturalSite(culturalSite).pipe(map(
        (savedCulturalSite: CulturalSiteDTO) => {
          //provera da li je lista slika prazna
          if(this.files.length > 0){
            //ako nije onda dodajemo jedan po jedan fajl
            for (let i = 0; i < this.files.length; i++) {
              this.imageService.createForCulturalSite(savedCulturalSite.id!, this.files[i]).pipe(map(
                (image : Image) => {
                  this.images = [];
                  this.files = [];
                }
              )).subscribe()
            }
          }
          return savedCulturalSite;
        }
      ))
      .subscribe(
        (response) => {
          this.toastr.success('Successfully created new cultural site!');
          this.newCulturalSiteForm.reset();
          this.router.navigate(['/cultural-site/'+response.id]);
        },
        (error) => {
          if (error.error.message) {
            this.toastr.error(error.error.message);
          } else if (error.error.violations) {
            this.toastr.error(error.error.violations[0].message)
          } else {
            this.toastr.error('503 Server Unavailable');
          }
          this.newCulturalSiteForm.reset();
        }
      );
    }
  }
}
