import { Component, Input, Optional, Host } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { SatPopover } from '@ncstate/sat-popover';
import { filter } from 'rxjs/operators';
import { onlyContainsLettersAndSpaces } from 'src/app/util/util';

@Component({
  selector: 'app-inline-edit',
  templateUrl: './inline-edit.component.html',
  styleUrls: ['./inline-edit.component.scss']
})
export class InlineEditComponent {

  // get edited entity name
  @Input()
  get entity(): string { return this._entity; }
  set entity(x: string) {
    this._entity = x;
  }
  private _entity = '';

  /** Overrides the edit and provides a reset value when changes are cancelled. */
  @Input()
  get value(): string { return this._value; }
  set value(x: string) {
    this.edit = this._value = x;
  }
  private _value = '';

  /** Form model for the input. */
  edit = '';

  editForm: FormGroup;
  namePattern = "([A-Z]{1}[a-z]*)( [a-z]*)*"

  constructor(@Optional() @Host() public popover: SatPopover) {
    this.editForm = new FormGroup({
      editField: new FormControl('', [Validators.required, Validators.pattern(this.namePattern)])
    })
  }

  ngOnInit() {
    // subscribe to cancellations and reset form value
    if (this.popover) {
      this.popover.closed.pipe(filter(val => val == null))
        .subscribe(() => this.edit = this.value || '');
    }
  }

  onSubmit() {
    if (this.popover) {
      this.popover.close(this.edit);
    }
  }

  onCancel() {
    if (this.popover) {
      this.popover.close();
    }
  }

  getEditErrorMessage() {
      if(this.editForm.controls['editField'].hasError('pattern')) {
        if(onlyContainsLettersAndSpaces(this.editForm.controls['editField'].value)) {
          return 'Must start with capital letter';
        } else {
          return 'Cannot contain special characters or numbers'
        }
      }
      return this.editForm.controls['editField'].hasError('required') ? 'Required field' : '';
    }
}