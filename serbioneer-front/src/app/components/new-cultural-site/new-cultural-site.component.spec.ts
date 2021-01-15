import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewCulturalSiteComponent } from './new-cultural-site.component';

describe('NewCulturalSiteComponent', () => {
  let component: NewCulturalSiteComponent;
  let fixture: ComponentFixture<NewCulturalSiteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NewCulturalSiteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NewCulturalSiteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
