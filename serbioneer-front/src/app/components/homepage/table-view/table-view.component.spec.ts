import { ComponentFixture, TestBed } from '@angular/core/testing';
import { NO_ERRORS_SCHEMA } from '@angular/core';
import { PageEvent } from '@angular/material/paginator';
import { Router } from '@angular/router';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { TableViewComponent } from './table-view.component';
import { HarnessLoader } from '@angular/cdk/testing';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';

describe('TableViewComponent', () => {
  let component: TableViewComponent;
  let fixture: ComponentFixture<TableViewComponent>;
  // injektovani servisi i ostalo
  let culturalSiteService: any;
  let router: any;
  let loader: HarnessLoader;

  beforeEach(() => {
    let culturalSiteServiceMock = {
      setData: jasmine.createSpy('setData')
    }

    let routerMock = {
      navigate: jasmine.createSpy('navigate')
    }

    TestBed.configureTestingModule({
      declarations: [TableViewComponent],
      providers: [
        { provide: Router, useValue: routerMock },
        { provide: CulturalSiteService, useValue: culturalSiteServiceMock }
      ],
      imports: [
        BrowserAnimationsModule,
        MatTableModule,
        MatPaginatorModule
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(TableViewComponent);
    component = fixture.componentInstance;
    culturalSiteService = TestBed.inject(CulturalSiteService);
    router = TestBed.inject(Router)
    loader = TestbedHarnessEnvironment.loader(fixture);

    //event emiter for page changed
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
      'city'
    ]);
  });

  it('emit event on paginate change', () => {
    const pageEvent = new PageEvent();
    //'pozivamo' metodu koju testiramo
    component.onPaginateChange(pageEvent)
    //provera da li se emitovao event
    expect(component.pageChanged.emit).toHaveBeenCalledWith(pageEvent);
  })

  it('should set data when row is clicked', () => {
    const number = 1;
    component.onClickRow(number);
    expect(router.navigate).toHaveBeenCalledWith(['cultural-site/1'])
  })

});
