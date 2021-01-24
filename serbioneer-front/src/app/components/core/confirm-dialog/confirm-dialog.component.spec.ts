import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MatDialogModule, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ConfirmDeleteDialog } from './confirm-dialog.component';

describe('ConfirmDeleteDialog', () => {
  let component: ConfirmDeleteDialog;
  let fixture: ComponentFixture<ConfirmDeleteDialog>;
  let matDialogRef: MatDialogRef<ConfirmDeleteDialog>;

  beforeEach(() => {
    let matDialogRefMock = {
      close: jasmine.createSpy('close')
    };

    let dialogDataMock = {
      entity: "Cultural site",
      name: "Srpsko narodno pozoriste"
    }

    TestBed.configureTestingModule({
      declarations: [ConfirmDeleteDialog],
      providers: [
        { provide: MatDialogRef, useValue: matDialogRefMock },
        { provide: MAT_DIALOG_DATA, useValue: dialogDataMock}],
      imports: [
        MatDialogModule
      ]
    }).compileComponents();
    fixture = TestBed.createComponent(ConfirmDeleteDialog);
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
