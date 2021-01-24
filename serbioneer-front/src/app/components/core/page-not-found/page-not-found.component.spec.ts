import { ComponentFixture, TestBed } from '@angular/core/testing';
import { NO_ERRORS_SCHEMA } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Router } from '@angular/router';
import { PageNotFoundComponent } from './page-not-found.component';
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";

describe('PageNotFoundComponent', () => {
  let component: PageNotFoundComponent;
  let fixture: ComponentFixture<PageNotFoundComponent>;
  //injektovani servisi i ostalo
  let router: any;

  beforeEach(() => {
    let routerMock = {
      navigate: jasmine.createSpy('navigate')
    }
    TestBed.configureTestingModule({
      declarations: [PageNotFoundComponent],
      providers: [
        { provide: Router, useValue: routerMock }
      ],
      imports:[
        BrowserAnimationsModule
      ]
    }).compileComponents();
    fixture = TestBed.createComponent(PageNotFoundComponent);
    component = fixture.componentInstance;
    router = TestBed.inject(Router);
  });

  it('can load instance', () => {
    expect(component).toBeTruthy();
  });

  it('should navigate to homepage', () => {
    component.onHome();
    expect(router.navigate).toHaveBeenCalledWith(['homepage'])
  })
});
