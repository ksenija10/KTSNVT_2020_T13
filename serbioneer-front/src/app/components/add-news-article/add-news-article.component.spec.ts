import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddNewsArticleComponent } from './add-news-article.component';

describe('AddNewsArticleComponent', () => {
  let component: AddNewsArticleComponent;
  let fixture: ComponentFixture<AddNewsArticleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddNewsArticleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddNewsArticleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
