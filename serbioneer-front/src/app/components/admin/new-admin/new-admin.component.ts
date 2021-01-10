import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import {
  ConfirmPasswordMatcher,
  confirmPasswordValidator,
} from 'src/app/directives/confirm-password.directive';
import { Admin } from 'src/app/model/admin.model';
import { AdminService } from 'src/app/services/admin.service';
import { onlyContainsLetters } from 'src/app/util/util';

@Component({
  selector: 'app-new-admin',
  templateUrl: './new-admin.component.html',
  styleUrls: ['./new-admin.component.sass'],
})
export class NewAdminComponent implements OnInit {
  newAdminForm: FormGroup;

  hide = true;
  namePattern = '[A-Z][a-z]*';
  confirmPasswordMatcher = new ConfirmPasswordMatcher();

  constructor(
    private adminService: AdminService,
    private toastr: ToastrService
  ) {
    this.newAdminForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      passwordGroup: new FormGroup(
        {
          password: new FormControl('', [Validators.required]),
          confirmPassword: new FormControl('', [Validators.required]),
        },
        { validators: confirmPasswordValidator() }
      ),
      name: new FormControl('', [
        Validators.required,
        Validators.pattern(this.namePattern),
      ]),
      surname: new FormControl('', [
        Validators.required,
        Validators.pattern(this.namePattern),
      ]),
      dateOfBirth: new FormControl('', [Validators.required]),
    });
  }

  ngOnInit(): void {}

  onSubmit() {
    if (this.newAdminForm.invalid) {
      return;
    }
    const admin: Admin = new Admin(
      this.newAdminForm.value.email,
      this.newAdminForm.value.passwordGroup.password,
      this.newAdminForm.value.name,
      this.newAdminForm.value.surname,
      this.newAdminForm.value.dateOfBirth
    );
    console.log(admin);

    this.adminService.createAdmin(admin).subscribe(
      (response) => {
        this.toastr.success('Logged in successfully!');
      },
      (error) => {
        if (error.error.message) {
          this.toastr.error(error.error.message);
        } else {
          this.toastr.error('503 Server Unavailable');
        }
        this.newAdminForm.reset();
      }
    );
  }

  getEmailErrorMessage() {
    if (this.newAdminForm.controls['email'].touched) {
      if (this.newAdminForm.controls['email'].hasError('required')) {
        return 'Required field';
      }
      return this.newAdminForm.controls['email'].hasError('email')
        ? 'Not a valid email'
        : '';
    }
    return '';
  }

  getRequiredFieldErrorMessage(fieldName: string) {
    if (this.newAdminForm.controls[fieldName].touched) {
      return this.newAdminForm.controls[fieldName].hasError('required')
        ? 'Required field'
        : '';
    }
    return '';
  }

  getNameErrorMessage(fieldName: string) {
    if (this.newAdminForm.controls[fieldName].touched) {
      if (this.newAdminForm.controls[fieldName].hasError('pattern')) {
        if (onlyContainsLetters(this.newAdminForm.controls[fieldName].value)) {
          return 'Must start with capital letter';
        } else {
          return 'Cannot contain special characters or numbers';
        }
      }
      return this.newAdminForm.controls[fieldName].hasError('required')
        ? 'Required field'
        : '';
    }
    return '';
  }

  getPasswordsMatch() {
    if (
      this.newAdminForm.controls.passwordGroup.get('password')?.touched &&
      this.newAdminForm.controls.passwordGroup.get('confirmPassword')?.touched
    ) {
      return this.newAdminForm.controls.passwordGroup.hasError(
        'passwordsDontMatch'
      )
        ? 'Passwords must match'
        : '';
    }
    return '';
  }
}