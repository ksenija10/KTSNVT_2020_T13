import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CulturalSite } from 'src/app/model/cultural-site.model';
import { CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';

@Component({
  selector: 'app-new-cultural-site',
  templateUrl: './new-cultural-site.component.html',
  styleUrls: ['./new-cultural-site.component.sass'],
})
export class NewCulturalSiteComponent implements OnInit {
  newCulturalSiteForm: FormGroup;

  allCategories: string[] = [];

  allCategoryTypes: string[] = [];

  category: string = '';

  categoryType: string = '';

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
      lat: new FormControl('', []),
      lng: new FormControl('', []),
      city: new FormControl('', []),
    });

    var a = 1;

    this.culturalSiteCategoryService
      .getAllCulturalSiteCategorys()
      .subscribe((responseData) => {
        this.allCategories = responseData;
        this.category = this.allCategories[0];
        this.categoryChange();
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

  categoryChange() {
    this.culturalSiteCategoryService
      .getAllCulturalCategoryTypes(this.category)
      .subscribe((responseData) => {
        this.allCategoryTypes = responseData;
      });
  }

  onSubmit() {
    if (this.newCulturalSiteForm.invalid) {
      return;
    }
    const culturalSite: CulturalSite = new CulturalSite(
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
      this.newCulturalSiteForm.value.address,
      this.newCulturalSiteForm.value.city,
      this.newCulturalSiteForm.value.description,
      0
    );
    console.log(culturalSite);

    this.culturalSiteService.createCulturalSite(culturalSite).subscribe(
      (response) => {
        this.toastr.success('Successfully added new cultural site');
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
