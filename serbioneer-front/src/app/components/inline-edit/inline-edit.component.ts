import { Component, Input, Optional, Host } from '@angular/core';
import { SatPopover } from '@ncstate/sat-popover';
import { filter } from 'rxjs/operators';

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

  constructor(@Optional() @Host() public popover: SatPopover) { }

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
}