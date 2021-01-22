import { ComponentFixture, TestBed } from '@angular/core/testing';
import { NO_ERRORS_SCHEMA } from '@angular/core';
import { MapViewComponent } from './map-view.component';
import { Router } from '@angular/router';

describe('MapViewComponent', () => {
  let component: MapViewComponent;
  let fixture: ComponentFixture<MapViewComponent>;
  let router: Router;

  beforeEach(() => {

    let routerMock = {
      navigate: jasmine.createSpy('navigate'),
    };

    TestBed.configureTestingModule({
      declarations: [MapViewComponent],
      providers: [
        { provide: Router, useValue: routerMock}
      ]
    });
    fixture = TestBed.createComponent(MapViewComponent);
    component = fixture.componentInstance;
    router = TestBed.inject(Router);
  });

  it('can load instance', () => {
    expect(component).toBeTruthy();
  });
});
