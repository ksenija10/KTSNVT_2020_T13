import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { ImageService } from 'src/app/services/image.service';

import { AddImageComponent } from './add-image.component';

describe('AddImageComponent', () => {
  let component: AddImageComponent;
  let fixture: ComponentFixture<AddImageComponent>;
  let imageService: ImageService;
  let toastr: ToastrService;

  beforeEach(async () => {
    const imageServiceMock = {
      createForCulturalSite: jasmine.createSpy('createForCulturalSite')
          .and.returnValue(of({
              id: 1,
              name: 'slika'
          }))
    };

    const toastrMock = {
      success: jasmine.createSpy('success'),
      error: jasmine.createSpy('error'),
      info: jasmine.createSpy('info')
    };

    TestBed.configureTestingModule({
      declarations: [ AddImageComponent ],
      providers: [
        { provide: ImageService, useValue: imageServiceMock},
        { provide: ToastrService, useValue: toastrMock}
      ],
      imports: [
        ReactiveFormsModule,
        FormsModule,
        MatFormFieldModule,
        MatInputModule,
        BrowserAnimationsModule
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(AddImageComponent);
    component = fixture.componentInstance;
    imageService = TestBed.inject(ImageService);
    toastr = TestBed.inject(ToastrService);
    fixture.detectChanges();
    component.culturalSite = {
      id: 1,
      name: 'Kulturno dobro',
      address: 'Adresa 5',
      city: 'Grad',
      category: 'Kategorija',
      categoryId: 1,
      categoryType: 'Tip',
      categoryTypeId: 1,
      lat: 42,
      lng: 20,
      description: 'Opis',
      rating: 5,
      images: []
    };
    component.culturalSiteId = 1;
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should submit images', ( async () => {
    const blob = new Blob();
    component.newImageFiles = [blob];
    component.culturalSite.images = [];

    component.submitImages();

    expect(imageService.createForCulturalSite).toHaveBeenCalledWith(1, blob);
    expect(component.newImages.length).toEqual(0);
    expect(component.newImageFiles.length).toEqual(0);
    expect(component.addNewImages).toEqual(false);
    expect(component.culturalSite.images.length).toEqual(1);

    expect(toastr.success).toHaveBeenCalledOnceWith('Successfully added image for cultural site!');
  }));

  it('should emit event for loading added images for cultural site', ( async () => {
    const event = {
        target: {
            files: [
                new Blob([''], { type: 'text/html' }),
                new Blob([''], { type: 'text/html' })
            ]
        }
    };

    component.newImageFiles = [];
    component.ngOnInit();

    component.onNewImageChange(event);

    expect(component.newImageFiles.length).toEqual(2);
  }));

});
