import { HarnessLoader } from '@angular/cdk/testing';
import { TestbedHarnessEnvironment } from '@angular/cdk/testing/testbed';
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatInputHarness } from '@angular/material/input/testing';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ToastrService } from 'ngx-toastr';
import { of } from 'rxjs';
import { CulturalSiteService } from 'src/app/services/cultural-site.service';
import { ImageService } from 'src/app/services/image.service';

import { AddCommentComponent } from './add-comment.component';

describe('AddCommentComponent', () => {
  let component: AddCommentComponent;
  let fixture: ComponentFixture<AddCommentComponent>;
  let culturalSiteService: CulturalSiteService;
  let imageService: ImageService;
  let toastr: ToastrService;
  let loader: HarnessLoader;

  beforeEach(async () => {
    const culturalSiteServiceMock = {
      createComment: jasmine.createSpy('createComment')
        .and.returnValue(of({
            id: 1,
            name: 'Mika',
            surname: 'Mikic',
            culturalSiteName: 'Kulturno dobro',
            text: 'Komentar Mikin',
            approved: false,
            images: []
        }))
    };

    const imageServiceMock = {
      createForComment: jasmine.createSpy('createForComment')
        .and.returnValue(of({
            id: 1,
            name: 'slika'
        }))
    };

    const toastrMock = {
      success: jasmine.createSpy('success'),
      error: jasmine.createSpy('error'),
    };

    TestBed.configureTestingModule({
      declarations: [ AddCommentComponent ],
      providers: [
        { provide: CulturalSiteService, useValue: culturalSiteServiceMock },
        { provide: ImageService, useValue: imageServiceMock },
        { provide: ToastrService, useValue: toastrMock }
      ],
      imports: [
        ReactiveFormsModule,
        FormsModule,
        MatFormFieldModule,
        MatInputModule,
        BrowserAnimationsModule
      ]
    }).compileComponents();

    fixture = TestBed.createComponent(AddCommentComponent);
    component = fixture.componentInstance;
    culturalSiteService = TestBed.inject(CulturalSiteService);
    imageService  = TestBed.inject(ImageService);
    toastr = TestBed.inject(ToastrService);
    loader = TestbedHarnessEnvironment.loader(fixture);
    // "prosledjivanje" @Input vrednosti
    component.culturalSiteId = 1;
    component.culturalSiteName = 'Kulturno dobro';
    component.userIsLogged = true;
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });

  it('should create new comment', ( async () => {
    component.myForm.setValue({
        text: 'Sabacka Biblioteka was cool.',
        file: '',
        fileSource: {}
      });
    component.culturalSiteId = 1;
    component.files = [new Blob];
    component.submit();

    expect(culturalSiteService.createComment).toHaveBeenCalledWith(1, 'Sabacka Biblioteka was cool.');
    expect(imageService.createForComment).toHaveBeenCalled();
    expect(component.images.length).toEqual(0);
    expect(component.files.length).toEqual(0);
    expect(component.addNewComment).toEqual(false);
    expect(toastr.success).toHaveBeenCalledOnceWith('Successfully reviewed cultural site!\n' +
                                                    'Your review will be visible after approval.');
    expect(component.addNewComment).toEqual(false);
  }));

  it('should emit event for loading added images for comment', ( async () => {
    const event = {
        target: {
            files: [
                new Blob([''], { type: 'text/html' }),
                new Blob([''], { type: 'text/html' })
            ]
        }
    };

    component.files = [];
    component.ngOnInit();

    component.onFileChange(event);

    expect(component.files.length).toEqual(2);
  }));

  it('should add comments', (async () => {
    component.ngOnInit();
    component.addNewComment = false;

    component.addComments();

    const textInput = await loader.getHarness(
        MatInputHarness.with({ selector: '#new-comment-input' })
    );
    expect(component.addNewComment).toEqual(true);
    expect(component.images.length).toEqual(0);
    expect(await textInput.getValue()).toEqual('');
  }));

  it('should not get text error message', ( async () => {
    component.myForm.value.text = 'Sabacka Biblioteka was cool.';
    component.myForm.controls.text.setErrors(null);

    const message = component.getTextErrorMessage();

    expect(component.myForm.invalid).toBeFalsy();
    expect(component.myForm.controls.text.hasError('required')).toBeFalsy();
    expect(message).toEqual('');
  }));

  it('should get text error message', ( async () => {
    component.myForm.controls.text.markAsTouched();

    const message = component.getTextErrorMessage();

    expect(component.myForm.invalid).toBeTruthy();
    expect(component.myForm.controls.text.hasError('required')).toBeTruthy();
    expect(message).toEqual('Required field');
  }));
});
