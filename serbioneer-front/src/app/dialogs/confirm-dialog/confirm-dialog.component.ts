import { Component, Inject } from "@angular/core";
import { MatDialogRef, MAT_DIALOG_DATA } from "@angular/material/dialog";

@Component({
    selector: 'app-confirm-dialog',
    templateUrl: './confirm-dialog.component.html',
    styleUrls: ['./confirm-dialog.component.sass']
  })
  export class ConfirmDeleteDialog {
    
    constructor(
      public dialogRef: MatDialogRef<ConfirmDeleteDialog>,
      @Inject(MAT_DIALOG_DATA) public data: {entity: string, name: string})
    {}

    onYes() {
      this.dialogRef.close(true);
    }

    onNo() {
      this.dialogRef.close(false);
    }
  }