import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';

@Component({
  selector: 'app-form-cultural-site',
  templateUrl: './form-cultural-site.component.html',
  styleUrls: ['./form-cultural-site.component.sass'],
})
export class FormCulturalSiteComponent implements OnInit {
  newCulturalSiteForm: FormGroup;

  allCategories: string[] = [];

  allCategoryTypes: string[] = [];

  category: string = '';

  type: string = '';

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
      category: new FormControl('', []),
      type: new FormControl('', []),
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
}
