import { Component, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';

@Component({
    selector: 'app-confirm-dialog',
    templateUrl: './confirm-dialog.component.html',
    styleUrls: ['./confirm-dialog.component.sass']
  })
  export class ConfirmDeleteDialogComponent {

    constructor(
      public dialogRef: MatDialogRef<ConfirmDeleteDialogComponent>,
      @Inject(MAT_DIALOG_DATA) public data: {entity: string, name: string})
    {}

    onYes(): void {
      this.dialogRef.close(true);
    }

    onNo(): void {
      this.dialogRef.close(false);
    }
  }
