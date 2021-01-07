import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Observable } from 'rxjs';
import { CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import {COMMA, ENTER} from '@angular/cdk/keycodes';
import { FormControl } from '@angular/forms';
import {MatAutocompleteSelectedEvent, MatAutocomplete} from '@angular/material/autocomplete';
import {map, startWith} from 'rxjs/operators';
import {MatChipInputEvent} from '@angular/material/chips';
import { CulturalSiteCategory } from 'src/app/model/cultural-site-category.model';

@Component({
  selector: 'app-table-view',
  templateUrl: './table-view.component.html',
  styleUrls: ['./table-view.component.sass']
})
export class TableViewComponent implements OnInit {

  visible = true;
  selectable = true;
  removable = true;
  separatorKeysCodes: number[] = [ENTER, COMMA];
  culturalSiteCategoryCtrl = new FormControl();
  filteredCulturalSiteCategories: Observable<string[]>;
  culturalSiteCategorys: string[] = [];
  allCulturalSiteCategorys: string[] = [];

  @ViewChild('culturalSiteCategorysInput') culturalSiteCategorysInput!: ElementRef<HTMLInputElement>;
  @ViewChild('auto') matAutocomplete!: MatAutocomplete;

  constructor(
    private culturalSiteCategoryService: CulturalSiteCategoryService
  ) {
    this.culturalSiteCategoryService.getAllCulturalSiteCategorys()
      .subscribe((responseData) => {
        this.allCulturalSiteCategorys = responseData;
      })
    this.filteredCulturalSiteCategories = this.culturalSiteCategoryCtrl.valueChanges.pipe(
      startWith(null),
      map((culturalSiteCategory: string | null) => culturalSiteCategory
      ? this._filter(culturalSiteCategory) : this.allCulturalSiteCategorys.slice()));
   }

  ngOnInit(): void {
    
  }

  add(event: MatChipInputEvent): void {
    const input = event.input;
    const value = event.value;

    // Add our fruit
    if ((value || '').trim()) {
      this.culturalSiteCategorys.push(value.trim());
    }

    // Reset the input value
    if (input) {
      input.value = '';
    }

    this.culturalSiteCategoryCtrl.setValue(null);
  }

  remove(fruit: string): void {
    const index = this.culturalSiteCategorys.indexOf(fruit);

    if (index >= 0) {
      this.culturalSiteCategorys.splice(index, 1);
    }
  }

  selected(event: MatAutocompleteSelectedEvent): void {
    this.culturalSiteCategorys.push(event.option.viewValue);
    this.culturalSiteCategorysInput.nativeElement.value = '';
    this.culturalSiteCategoryCtrl.setValue(null);
  }

  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();

    return this.allCulturalSiteCategorys.filter(culturalSiteCategory => culturalSiteCategory.toLowerCase().indexOf(filterValue) === 0);
  }

}
