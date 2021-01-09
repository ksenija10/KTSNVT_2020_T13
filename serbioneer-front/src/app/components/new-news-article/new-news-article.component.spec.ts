import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewNewsArticleComponent } from './new-news-article.component';

describe('NewNewsArticleComponent', () => {
  let component: NewNewsArticleComponent;
  let fixture: ComponentFixture<NewNewsArticleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NewNewsArticleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NewNewsArticleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
