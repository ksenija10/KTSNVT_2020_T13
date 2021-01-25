import { HarnessLoader } from '@angular/cdk/testing';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MatPaginatorModule, PageEvent } from '@angular/material/paginator';
import { MatTableModule } from '@angular/material/table';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { Router } from '@angular/router';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { TableViewComponent } from './table-view.component';

describe('TableViewComponent', () => {
  let component: TableViewComponent;
  let fixture: ComponentFixture<TableViewComponent>;
  // injektovani servisi i ostalo
  let culturalSiteService: any;
  let router: any;
  let loader: HarnessLoader;

  beforeEach(() => {
    const culturalSiteServiceMock = {
      setData: jasmine.createSpy('setData'),
    };

    const routerMock = {
      navigate: jasmine.createSpy('navigate'),
    };

    TestBed.configureTestingModule({
      declarations: [TableViewComponent],
      providers: [
        { provide: Router, useValue: routerMock },
        { provide: CulturalSiteService, useValue: culturalSiteServiceMock },
      ],
      imports: [BrowserAnimationsModule, MatTableModule, MatPaginatorModule],
    }).compileComponents();

    fixture = TestBed.createComponent(TableViewComponent);
    component = fixture.componentInstance;
    culturalSiteService = TestBed.inject(CulturalSiteService);
    router = TestBed.inject(Router);
    loader = TestbedHarnessEnvironment.loader(fixture);

    // event emiter for page changed
    spyOn(component.pageChanged, 'emit');
  });

  it('can load instance', () => {
    expect(component).toBeTruthy();
  });

  it('displayedColumns has default value', () => {
    expect(component.displayedColumns).toEqual([
      'name',
      'category',
      'categoryType',
      'address',
      'city',
    ]);
  });

  it('emit event on paginate change', () => {
    const pageEvent = new PageEvent();
    // 'pozivamo' metodu koju testiramo
    component.onPaginateChange(pageEvent);
    // provera da li se emitovao event
    expect(component.pageChanged.emit).toHaveBeenCalledWith(pageEvent);
  });

  it('should set data when row is clicked', () => {
    const num = 1;
    component.onClickRow(num);
    expect(router.navigate).toHaveBeenCalledWith(['cultural-site/' + num]);
  });
});
