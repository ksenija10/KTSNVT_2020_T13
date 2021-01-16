import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { Observable } from 'rxjs';
import { CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import {COMMA, ENTER} from '@angular/cdk/keycodes';
import { FormControl } from '@angular/forms';
import {MatAutocompleteSelectedEvent, MatAutocomplete} from '@angular/material/autocomplete';
import {map, startWith} from 'rxjs/operators';
import {MatChipInputEvent} from '@angular/material/chips';
import { CulturalSiteCategory } from 'src/app/model/cultural-site-category.model';
import { ToastrService } from 'ngx-toastr';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';

@Component({
  selector: 'app-table-view',
  templateUrl: './table-view.component.html',
  styleUrls: ['./table-view.component.sass']
})
export class TableViewComponent implements OnInit {

  //for chips
  visible = true;
  selectable = true;
  removable = true;
  separatorKeysCodes: number[] = [ENTER, COMMA];
  culturalSiteCategoryCtrl = new FormControl();
  filteredCulturalSiteCategories: Observable<string[]>;
  culturalSiteCategorys: string[] = [];
  allCulturalSiteCategorys: string[] = [];

  //for locations
  allLocations: string[] = [];

  //filter fields
  location: string = '';
  name: string = '';

  @ViewChild('culturalSiteCategorysInput') culturalSiteCategorysInput!: ElementRef<HTMLInputElement>;
  @ViewChild('auto') matAutocomplete!: MatAutocomplete;


  constructor(
    private culturalSiteCategoryService: CulturalSiteCategoryService,
    private culturalSiteService: CulturalSiteService,
    private toastr: ToastrService
  ) {
    //dobavljanje svih locations
    this.culturalSiteService.findAllLocations()
      .subscribe((responseData)=> {
        this.allLocations = responseData;
      })
    //dobavljanje cultural site categories
    this.culturalSiteCategoryService.getAllCulturalSiteCategorys()
      .pipe(
        map((responseData) => {
            //ovde treba jos jedna map
          let names: string[] = [];
          for (let culturalSiteCategory of responseData) {
            names.push(culturalSiteCategory.name);
          }
          return names;
      }))
      .subscribe((responseData) => {
        this.allCulturalSiteCategorys = responseData;
        //event da je doslo do promene u allculturalsitecategorys
        this.culturalSiteCategoryCtrl.setValue('');
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

    //provera da li se uneta vrednost uopste nalazi u listi
    if(this.allCulturalSiteCategorys.indexOf(this.titleCaseWord(value)) === -1) {
      this.toastr.error('Cultural site category ' + value + ' doesnt exist');
      return;
    }

    // Add our fruit
    if ((value || '').trim()) {
      this.culturalSiteCategorys.push(value.trim());  
      this.removeFromList(value);
    }

    // Reset the input value
    if (input) {
      input.value = '';
    }

    this.culturalSiteCategoryCtrl.setValue(null);
  }

  remove(value: string): void {
    const index = this.culturalSiteCategorys.indexOf(value);

    if (index >= 0) {
      this.culturalSiteCategorys.splice(index, 1);
    }

    this.allCulturalSiteCategorys.push(value);
    //event da je doslo do promene u allculturalsitecategorys
    this.culturalSiteCategoryCtrl.setValue('');
  }

  selected(event: MatAutocompleteSelectedEvent): void {
    this.culturalSiteCategorys.push(event.option.viewValue);
    this.removeFromList(event.option.viewValue);
    this.culturalSiteCategorysInput.nativeElement.value = '';
    this.culturalSiteCategoryCtrl.setValue(null);
  }

  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();

    return this.allCulturalSiteCategorys.filter(culturalSiteCategory => culturalSiteCategory.toLowerCase().indexOf(filterValue) === 0);
  }

  titleCaseWord(word: string) {
    if (!word) return word;
    return word[0].toUpperCase() + word.substr(1).toLowerCase();
  }

  removeFromList(value: string) {
    //ukloni iz liste
    const index = this.allCulturalSiteCategorys.indexOf(value);

    if (index >= 0) {
      this.allCulturalSiteCategorys.splice(index, 1);
    }
  }

  onKey(event: any ) {
    this.name = event.target.value;
  }

}
