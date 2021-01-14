import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewCulturalSiteComponent } from './view-cultural-site.component';

describe('ViewCulturalSiteComponent', () => {
  let component: ViewCulturalSiteComponent;
  let fixture: ComponentFixture<ViewCulturalSiteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ViewCulturalSiteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewCulturalSiteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
