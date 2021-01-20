import { HttpClient } from '@angular/common/http';
import {
  HttpClientTestingModule,
  HttpTestingController,
} from '@angular/common/http/testing';
import { fakeAsync, getTestBed, TestBed, tick } from '@angular/core/testing';
import { Router } from '@angular/router';
import { Image } from 'src/app/model/image.model';
import { ImageService } from '../image.service';

describe('Image service', () => {
  let injector;
  let imageService: ImageService;
  let httpMock: HttpTestingController;
  let httpClient: HttpClient;
  let router: any;

  let routerMock = {
    navigate: jasmine.createSpy('navigate'),
  };

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule],
      providers: [ImageService, { provide: Router, useValue: routerMock }],
    });

    injector = getTestBed();
    imageService = TestBed.inject(ImageService);
    httpClient = TestBed.inject(HttpClient);
    httpMock = TestBed.inject(HttpTestingController);
    router = TestBed.inject(Router);
  });

  afterEach(() => {
    httpMock.verify();
  });

  it('should be created', () => {
    expect(imageService).toBeTruthy();
  });

  it('should create new image for comment', fakeAsync(() => {
    let newId: number = 1;
    let newFile: any = 1;

    let responseImage: Image = { _id: 0, name: '', content: 0 };
    let mockImage: Image = { _id: 1, name: 'name', content: 1 };

    imageService.createForComment(newId, newFile).subscribe((data) => {
      responseImage = data;
    });

    const request = httpMock.expectOne(
      'http://localhost:8080/api/image/comment/1'
    );
    expect(request.request.method).toBe('POST');
    request.flush(mockImage);

    tick();

    expect(responseImage).toBeDefined();
    expect(responseImage._id).toEqual(1);
    expect(responseImage.content).toEqual(1);
    expect(responseImage.name).toEqual('name');
  }));

  it('should create new image for news', fakeAsync(() => {
    let newId: number = 1;
    let newFile: any = 1;

    let responseImage: Image = { _id: 0, name: '', content: 0 };
    let mockImage: Image = { _id: 1, name: 'name', content: 1 };

    imageService.createForNews(newId, newFile).subscribe((data) => {
      responseImage = data;
    });

    const request = httpMock.expectOne(
      'http://localhost:8080/api/image/news/1'
    );
    expect(request.request.method).toBe('POST');
    request.flush(mockImage);

    tick();

    expect(responseImage).toBeDefined();
    expect(responseImage._id).toEqual(1);
    expect(responseImage.content).toEqual(1);
    expect(responseImage.name).toEqual('name');
  }));

  it('should create new image for cultural site', fakeAsync(() => {
    let newId: number = 1;
    let newFile: any = 1;

    let responseImage: Image = { _id: 0, name: '', content: 0 };
    let mockImage: Image = { _id: 1, name: 'name', content: 1 };

    imageService.createForCulturalSite(newId, newFile).subscribe((data) => {
      responseImage = data;
    });

    const request = httpMock.expectOne(
      'http://localhost:8080/api/image/cultural-site/1'
    );
    expect(request.request.method).toBe('POST');
    request.flush(mockImage);

    tick();

    expect(responseImage).toBeDefined();
    expect(responseImage._id).toEqual(1);
    expect(responseImage.content).toEqual(1);
    expect(responseImage.name).toEqual('name');
  }));
});
