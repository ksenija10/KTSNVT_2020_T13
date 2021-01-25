import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ConfirmDeleteDialogComponent } from './confirm-dialog.component';

describe('ConfirmDeleteDialogComponent', () => {
  let component: ConfirmDeleteDialogComponent;
  let fixture: ComponentFixture<ConfirmDeleteDialogComponent>;
  let matDialogRef: MatDialogRef<ConfirmDeleteDialogComponent>;

  beforeEach(() => {
    const matDialogRefMock = {
      close: jasmine.createSpy('close')
    };

    const dialogDataMock = {
      entity: 'Cultural site',
      name: 'Srpsko narodno pozoriste'
    };

    TestBed.configureTestingModule({
      declarations: [ConfirmDeleteDialogComponent],
      providers: [
        { provide: MatDialogRef, useValue: matDialogRefMock },
        { provide: MAT_DIALOG_DATA, useValue: dialogDataMock}],
      imports: [
        MatDialogModule
      ]
    }).compileComponents();
    fixture = TestBed.createComponent(ConfirmDeleteDialogComponent);
    component = fixture.componentInstance;
    matDialogRef = TestBed.inject(MatDialogRef);
  });

  it('can load instance', () => {
    expect(component).toBeTruthy();
  });

  it('onYes', () => {
    component.onYes();
    expect(matDialogRef.close).toHaveBeenCalledWith(true);
  });

  it('onNo', () => {
    component.onNo();
    expect(matDialogRef.close).toHaveBeenCalledWith(false);
  });
});
