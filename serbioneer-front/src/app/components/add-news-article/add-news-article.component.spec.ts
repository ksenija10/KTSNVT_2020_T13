import { ChangeDetectorRef, DebugElement, NgModule } from "@angular/core";
import { ComponentFixture, fakeAsync, TestBed, tick, async } from "@angular/core/testing";
import { By } from "@angular/platform-browser";
import { of } from "rxjs";
import { CommentService } from "src/app/services/comment.service";
import {HarnessLoader} from '@angular/cdk/testing';
import {TestbedHarnessEnvironment} from '@angular/cdk/testing/testbed';
import { MatListModule } from "@angular/material/list";
import { MatPaginator, MatPaginatorModule } from "@angular/material/paginator";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { MatIcon, MatIconModule } from "@angular/material/icon";
import { AddNewsArticleComponent } from "./add-news-article.component";
import { CulturalSiteService } from "src/app/services/cultural-site.service";
import { ImageService } from "src/app/services/image.service";
import { MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from "@angular/material/dialog";
import { ToastrService } from "ngx-toastr";
import { MatFormFieldModule } from "@angular/material/form-field";
import { NewsDTO } from "src/app/model/news.model";

describe('AddNewsArticleComponent', () => {
    let component: AddNewsArticleComponent;
    let fixture: ComponentFixture<AddNewsArticleComponent>;
    let culturalSiteService: any;
    let imageService: any;
    let toastrService: any;
    let onChange: any;
  
    beforeEach(() => {
      let culturalSiteServiceMock = {
        createNews: jasmine.createSpy('createNews')
            .and.returnValue(of({
                id: 1,
                information: "Sabacka Biblioteka has new show."
            }
        ))
      }
  
      let imageSerivceMock = {
        createForNews: jasmine.createSpy('createForNews')
            .and.returnValue(of({
                _id: 1,
                name: "Picture1",
                content: 0
            }))
      }

      let toastrServiceMock = {
        success : jasmine.createSpy('success')
            .and.returnValue(of('Successfully added news for cultural site!')),
        error : jasmine.createSpy('error')
            .and.returnValue(of('503 Server Unavailable'))
      };

      let dialogRefMock = {
        close : jasmine.createSpy('close')
          .and.returnValue(of())
      }

      let onChangeMock = {
        onFileChange: jasmine.createSpy('onFileChange')
          .and.returnValue(of())
      }
  
      TestBed.configureTestingModule({
        declarations:   [ AddNewsArticleComponent ],
        providers:      [{ provide: CulturalSiteService, useValue: culturalSiteServiceMock },
                         { provide: ImageService, useValue: imageSerivceMock},
                         { provide: ToastrService, useValue: toastrServiceMock},
                         { provide: MAT_DIALOG_DATA, useValue: {} },
                         { provide: MatDialogRef, useValue: dialogRefMock },
                         { provide: onChange, useValue: onChangeMock }],
        imports: [
            MatDialogModule,
            MatFormFieldModule,
            MatListModule,
            BrowserAnimationsModule
        ]
      }).compileComponents();
  
      fixture = TestBed.createComponent(AddNewsArticleComponent);
      component = fixture.componentInstance;
      component.data = {
          culturalSite: {
            id: 1
          }
      }
      component.dialogRef = TestBed.inject(MatDialogRef);
      culturalSiteService = TestBed.inject(CulturalSiteService);
      imageService = TestBed.inject(ImageService);
      toastrService = TestBed.inject(ToastrService);
      onChange = TestBed.inject(onChange);
    });

    it('should have invalid form', ( async () => {
      component.onSubmit();
      
      expect(component.newsForm.invalid).toBeTruthy();
    }))

    it('should add news article for cultural site without images', ( async () => {
      component.newsForm.value.text = "Sabacka Biblioteka has new show."
      component.newsForm.controls['text'].setErrors(null);
      
      component.onSubmit();
      
      expect(component.newsForm.invalid).toBeFalsy();
      //ne moze called with jer ne mogu date sigurno da potrefim
      expect(culturalSiteService.createNews).toHaveBeenCalled();

      expect(component.dialogRef.close).toHaveBeenCalled();

      expect(toastrService.success).toHaveBeenCalledWith('Successfully added news for cultural site!');
    }))

    it('should add news article for cultural site with images', ( async () => {
      component.newsForm.value.text = "Sabacka Biblioteka has new show."
      component.newsForm.controls['text'].setErrors(null);
      
      component.files = [{}, {}]

      component.onSubmit();
      
      expect(component.newsForm.invalid).toBeFalsy();
      //ne moze called with jer ne mogu date sigurno da potrefim
      expect(culturalSiteService.createNews).toHaveBeenCalled();

      expect(imageService.createForNews).toHaveBeenCalled();

      expect(component.dialogRef.close).toHaveBeenCalled();
    }))

    it('should close the dialog', ( async () => {
      component.close()

      expect(component.dialogRef.close).toHaveBeenCalled();
    }))

    it('should get text error message', ( async () => {
      component.newsForm.controls['text'].markAsTouched();
      let message = component.getTextErrorMessage()
      
      expect(component.newsForm.invalid).toBeTruthy();
      expect(component.newsForm.controls['text'].hasError('required')).toBeTruthy()
      expect(message).toEqual('Required field');
    }))

    it('should not get text error message', ( async () => {
      component.newsForm.value.text = "Sabacka Biblioteka has new show."
      component.newsForm.controls['text'].setErrors(null);
      
      let message = component.getTextErrorMessage();
      
      expect(component.newsForm.invalid).toBeFalsy();
      expect(component.newsForm.controls['text'].hasError('required')).toBeFalsy()
      expect(message).toEqual('');
    }))

    it('should trigger on file change', ( async () => {
      let button = fixture.debugElement.query(By.css('#file'));
      spyOn(component, 'onFileChange');

      button.triggerEventHandler('change', {target: { files: [ {} ]} })
      
      expect(component.onFileChange).toHaveBeenCalledWith({target: { files: [ {} ]} });
    }))
})