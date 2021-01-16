import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MapCulturalSiteComponent } from './map-cultural-site.component';

describe('MapCulturalSiteComponent', () => {
  let component: MapCulturalSiteComponent;
  let fixture: ComponentFixture<MapCulturalSiteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MapCulturalSiteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MapCulturalSiteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
