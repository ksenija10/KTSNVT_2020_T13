import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { map } from 'rxjs/operators';
import { CulturalCategoryType } from 'src/app/model/cultural-category-type.model';
import { CulturalSiteCategory } from 'src/app/model/cultural-site-category.model';
import { CulturalSite, CulturalSiteDTO } from 'src/app/model/cultural-site.model';
import { CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';

@Component({
  selector: 'app-new-cultural-site',
  templateUrl: './new-cultural-site.component.html',
  styleUrls: ['./new-cultural-site.component.sass'],
})
export class NewCulturalSiteComponent implements OnInit {
  newCulturalSiteForm: FormGroup;

  allCategoriesModel: CulturalSiteCategory[] = [];
  allCategoryTypesModel: CulturalCategoryType[] = [];
  categoryModel: CulturalSiteCategory = {id: -1, name: ''};
  categoryTypeModel: CulturalCategoryType = {id: -1, name: ''};

  allCategories: string[] = [];

  allCategoryTypes: string[] = [];

  category: string = '';

  //categoryType: string = '';

  constructor(
    private culturalSiteService: CulturalSiteService,
    private culturalSiteCategoryService: CulturalSiteCategoryService,
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
      // city: new FormControl('', []),
    });

    this.culturalSiteCategoryService
      .getAllCulturalSiteCategorys()
      .subscribe((responseData) => {
        this.allCategoriesModel = responseData;
        this.categoryModel = new CulturalSiteCategory(responseData[0].name, responseData[0].id);
        this.newCulturalSiteForm.get('category')?.setValue(this.categoryModel.id);
        this.categoryChange(null);
      });
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

  onSubmit() {
    if (this.newCulturalSiteForm.invalid) {
      return;
    }

    let addressElems = this.newCulturalSiteForm.value.address.split(',');
    let address = addressElems.join(', ');
    let city = addressElems[addressElems.length - 1];

    const culturalSite: CulturalSite = new CulturalSiteDTO(
      -1,
      this.newCulturalSiteForm.value.name,
      this.allCategories.indexOf(this.newCulturalSiteForm.value.category) + 1,
      this.newCulturalSiteForm.value.category,
      this.allCategoryTypes.indexOf(
        this.newCulturalSiteForm.value.categoryType
      ) + 1,
      this.newCulturalSiteForm.value.categoryType,
      this.newCulturalSiteForm.value.lat,
      this.newCulturalSiteForm.value.lng,
      address,
      city,
      this.newCulturalSiteForm.value.description,
      0
    );
    console.log(culturalSite);

    this.culturalSiteService.createCulturalSite(culturalSite).subscribe(
      (response) => {
        this.toastr.success('Successfully added new cultural site!');
        this.router.navigate(['/cultural-site']);
      },
      (error) => {
        if (error.error.message) {
          this.toastr.error(error.error.message);
        } else {
          this.toastr.error('503 Server Unavailable');
        }
        this.newCulturalSiteForm.reset();
      }
    );
  }
}
