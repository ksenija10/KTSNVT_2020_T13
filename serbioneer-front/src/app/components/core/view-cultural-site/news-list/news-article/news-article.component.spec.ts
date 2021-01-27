import { ComponentFixture, TestBed } from '@angular/core/testing';
import { NewsArticleComponent } from './news-article.component';
import { NewsDTO } from 'src/app/model/news.model';
import { Image } from 'src/app/model/image.model';
import { By } from '@angular/platform-browser';

describe('NewsArticleComponent', () => {
  let component: NewsArticleComponent;
  let fixture: ComponentFixture<NewsArticleComponent>;

  beforeEach(async () => {

    TestBed.configureTestingModule({
      declarations: [ NewsArticleComponent ],
    }).compileComponents();

    fixture = TestBed.createComponent(NewsArticleComponent);
    component = fixture.componentInstance;
    // "prosledjivanje" @Input vrednosti
    const images = [new Image('slika1', 'content1', 1), new Image('slika2', 'content2', 2)];
    component.news = new NewsDTO('Vesti1', new Date(), 'Kulturno dobro', images, 1);
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should show news data', () => {
    component.ngOnInit();

    expect(component.newsImageSlider.length).toEqual(2);
    expect(component.newsImageSlider[0].title).toEqual('slika1');
    expect(component.newsImageSlider[0].image).toEqual('data:image/jpg;base64,content1');
    expect(component.newsImageSlider[0].thumbImage).toEqual('data:image/jpg;base64,content1');
    expect(component.newsImageSlider[1].title).toEqual('slika2');
    expect(component.newsImageSlider[1].image).toEqual('data:image/jpg;base64,content2');
    expect(component.newsImageSlider[1].thumbImage).toEqual('data:image/jpg;base64,content2');

    fixture.whenStable().then(() => {
      fixture.detectChanges();
      const newsInfo = fixture.debugElement.query(By.css('#news-info'));
      expect(newsInfo.nativeElement.textContent).toEqual('Vesti1');
    });
  });
});
