import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { CulturalSiteCategoryService } from 'src/app/services/cultural-site-category.service';
import { COMMA, ENTER } from '@angular/cdk/keycodes';
import { FormControl, FormGroup } from '@angular/forms';
import { Observable } from 'rxjs';
import { MatAutocomplete, MatAutocompleteSelectedEvent } from '@angular/material/autocomplete';
import { CulturalSiteData, CulturalSiteService } from 'src/app/services/cultural-site.service';
import { ToastrService } from 'ngx-toastr';
import { map, startWith } from 'rxjs/operators';
import { MatChipInputEvent } from '@angular/material/chips';
import { PageEvent } from '@angular/material/paginator';
import { FilterDTO } from 'src/app/model/filter-cultural-site.model';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-homepage',
  templateUrl: './homepage.component.html',
  styleUrls: ['./homepage.component.sass']
})
export class HomepageComponent implements OnInit {

  // for chips
  visible = true;
  selectable = true;
  removable = true;
  separatorKeysCodes: number[] = [ENTER, COMMA];
  filteredCulturalSiteCategories!: Observable<string[]>;
  culturalSiteCategorys: string[] = [];
  allCulturalSiteCategorys: string[] = [];

  // for locations
  allLocations: string[] = [];

  // filter fields
  // filter form
  filterForm: FormGroup;

  // cultural sites data
  dataSource: CulturalSiteData = {content: [], size: 0, totalElements: 0, totalPages: 0};

  // pageEvent tabele
  pageEvent: PageEvent = new PageEvent();

  // map div id
  mapHomepage = 'map-homepage';

  // zatrazen subscribed view
  isSubscribedSitesView = false;

  // user email, if there is one
  userEmail: string;

  // loading bar
  progressBar = true;

  @ViewChild('culturalSiteCategorysInput') culturalSiteCategorysInput!: ElementRef<HTMLInputElement>;
  @ViewChild('auto') matAutocomplete!: MatAutocomplete;

  constructor(
    private route: ActivatedRoute,
    private authenticationService: AuthenticationService,
    private culturalSiteCategoryService: CulturalSiteCategoryService,
    private culturalSiteService: CulturalSiteService,
    private toastr: ToastrService
  ) {
    // inicijalizacija forme
    this.filterForm = new FormGroup({
      culturalSiteCategoryCtrl: new FormControl(),
      location: new FormControl(''),
      name: new FormControl('')
    });
    // da li je zatrazen subscribed prikaz?
    this.isSubscribedSitesView = this.route.snapshot.data.subscribedView || false;
    const subscribedMap = this.route.snapshot.data.subscribedMap;
    if (subscribedMap) {
      this.mapHomepage = subscribedMap;
    }
    // dobavljanje ulogovanog korisnika, ako postoji, ako ne -> userEmail=''
    this.userEmail = this.authenticationService.getLoggedInUserEmail();
    // prvobitni pageEvent
    this.pageEvent.pageIndex = 0;
    this.pageEvent.pageSize = 5;
  }

  ngOnInit(): void {
    // dobavljanje svih locations
    this.culturalSiteService.findAllLocations()
      .subscribe((responseData) => {
        this.allLocations = responseData;
      });
    // dobavljanje cultural site categories
    this.culturalSiteCategoryService.getAllCulturalSiteCategorys()
      .pipe(
        map((responseData) => {
          const names: string[] = [];
          for (const culturalSiteCategory of responseData) {
            names.push(culturalSiteCategory.name);
          }
          return names;
      }))
      .subscribe((responseData) => {
        this.allCulturalSiteCategorys = responseData;
        // event da je doslo do promene u allculturalsitecategorys
        this.filterForm.get('culturalSiteCategoryCtrl')?.setValue('');
      });
    this.filteredCulturalSiteCategories = this.filterForm.get('culturalSiteCategoryCtrl')?.valueChanges.pipe(
        startWith(null),
        map(
          (culturalSiteCategory: string | null) =>
            culturalSiteCategory ? this._filter(culturalSiteCategory) : this.allCulturalSiteCategorys.slice()
          )) || new Observable<string[]>();
    if (!this.isSubscribedSitesView) {
      this.initDataSource();
    } else {
      this.initSubscribedDataSource();
    }
  }

  initDataSource(): void {
    this.culturalSiteService.findAllByPage(0, 5).pipe(
      map((culturalSiteData: CulturalSiteData) => this.dataSource = culturalSiteData)
    ).subscribe(() => this.progressBar = false);
  }

  initSubscribedDataSource(): void {
    this.culturalSiteService.findAllSubscribedByPage(0, 5, this.userEmail).pipe(
      map((culturalSiteData: CulturalSiteData) => this.dataSource = culturalSiteData)
    ).subscribe(() => this.progressBar = false);
  }

  onPageChange(event: PageEvent): void {
    this.pageEvent = event;
    this.onFilter();
  }

  onFilter(): void {
    this.progressBar = true;
    const page = this.pageEvent.pageIndex;
    const size = this.pageEvent.pageSize;
    const name = this.filterForm.get('name')?.value;
    const location = this.filterForm.get('location')?.value;
    const filterDto: FilterDTO = new FilterDTO(this.culturalSiteCategorys, name, location);
    if (!this.isSubscribedSitesView) {
      this.culturalSiteService.filterByPage(page, size, filterDto).pipe(
        map((filteredCulturalSiteData: CulturalSiteData) => this.dataSource = filteredCulturalSiteData)
      ).subscribe(() => this.progressBar = false);
    } else {
      this.culturalSiteService.filterSubscribedByPage(page, size, this.userEmail, filterDto).pipe(
        map((filteredCulturalSiteData: CulturalSiteData) => this.dataSource = filteredCulturalSiteData)
      ).subscribe(() => this.progressBar = false);
    }
  }

  add(event: MatChipInputEvent): void {
    const input = event.input;
    const value = event.value;

    // provera da li se uneta vrednost uopste nalazi u listi
    if (this.allCulturalSiteCategorys.indexOf(this.titleCaseWord(value)) === -1) {
      this.toastr.error('Cultural site category ' + value + ' doesnt exist');
      return;
    }

    // Add our category
    if ((value || '').trim()) {
      this.culturalSiteCategorys.push(value.trim());
      this.removeFromList(value);
    }

    // Reset the input value
    if (input) {
      input.value = '';
    }

    this.filterForm.get('culturalSiteCategoryCtrl')?.setValue(null);
  }

  remove(value: string): void {
    const index = this.culturalSiteCategorys.indexOf(value);

    if (index >= 0) {
      this.culturalSiteCategorys.splice(index, 1);
    }

    this.allCulturalSiteCategorys.push(value);
    // event da je doslo do promene u allculturalsitecategorys
    this.filterForm.get('culturalSiteCategoryCtrl')?.setValue('');
  }

  selected(event: MatAutocompleteSelectedEvent): void {
    this.culturalSiteCategorys.push(event.option.viewValue);
    this.removeFromList(event.option.viewValue);
    this.culturalSiteCategorysInput.nativeElement.value = '';
    this.filterForm.get('culturalSiteCategoryCtrl')?.setValue(null);
  }

  private _filter(value: string): string[] {
    const filterValue = value.toLowerCase();

    return this.allCulturalSiteCategorys.filter(culturalSiteCategory => culturalSiteCategory.toLowerCase().indexOf(filterValue) === 0);
  }

  titleCaseWord(word: string): string {
    if (!word) { return word; }
    return word[0].toUpperCase() + word.substr(1).toLowerCase();
  }

  removeFromList(value: string): void {
    // ukloni iz liste
    const index = this.allCulturalSiteCategorys.indexOf(value);

    if (index >= 0) {
      this.allCulturalSiteCategorys.splice(index, 1);
    }
  }

}
