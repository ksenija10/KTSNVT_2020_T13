import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CulturalSitesTableComponent } from './cultural-sites-table.component';

describe('CulturalSitesTableComponent', () => {
  let component: CulturalSitesTableComponent;
  let fixture: ComponentFixture<CulturalSitesTableComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CulturalSitesTableComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(CulturalSitesTableComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
