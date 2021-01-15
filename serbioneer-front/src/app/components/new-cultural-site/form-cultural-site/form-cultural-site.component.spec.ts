import { ComponentFixture, TestBed } from '@angular/core/testing';

import { FormCulturalSiteComponent } from './form-cultural-site.component';

describe('FormCulturalSiteComponent', () => {
  let component: FormCulturalSiteComponent;
  let fixture: ComponentFixture<FormCulturalSiteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ FormCulturalSiteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(FormCulturalSiteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
