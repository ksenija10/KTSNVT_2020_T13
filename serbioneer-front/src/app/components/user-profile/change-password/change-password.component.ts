import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { ConfirmPasswordMatcher, confirmPasswordValidator } from 'src/app/directives/confirm-password.directive';
import { PasswordDTO } from 'src/app/model/password-dto.model';
import { UserLogin } from 'src/app/model/user-login.model';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { MyProfileService } from 'src/app/services/my-profile.service';

@Component({
  selector: 'app-change-password',
  templateUrl: './change-password.component.html',
  styleUrls: ['./change-password.component.sass']
})
export class ChangePasswordComponent implements OnInit {

  hide = true;

  confirmPasswordMatcher = new ConfirmPasswordMatcher();

  changePasswordForm!: FormGroup;

  constructor(
    private myProfileService: MyProfileService,
    private authenticationService: AuthenticationService,
    private toastr: ToastrService,
    private router: Router
  ) { 
    this.changePasswordForm = new FormGroup({
      oldPassword: new FormControl('',[Validators.required]),
      passwordGroup: new FormGroup({
        password: new FormControl('',[Validators.required]),
        confirmPassword: new FormControl('',[Validators.required])
      }, {validators: confirmPasswordValidator()})
    })
  }

  ngOnInit(): void {
  }

  onSubmit() {
    if(this.changePasswordForm.invalid) {
      return;
    }

    const passwordDto: PasswordDTO = 
      new PasswordDTO(
        this.changePasswordForm.value.oldPassword,
        this.changePasswordForm.value.passwordGroup.password,
        this.changePasswordForm.value.passwordGroup.confirmPassword
      )

    this.myProfileService.updatePassword(passwordDto)
        .subscribe(
          response => {
            this.toastr.success('Password updated successfully!');
            this.changePasswordForm.reset();
            this.router.navigate(['homepage']);
            this.authenticationService.setLoggedInUser(response)
          },
          error => {
            if(error.error.message){
              this.toastr.error(error.error.message);
            } else {
              this.toastr.error('503 Server Unavailable');
            }
            this.changePasswordForm.reset();
          }
        )
  }

  getRequiredFieldErrorMessage(fieldName: string) {
    if(this.changePasswordForm.controls[fieldName].touched) {
      return this.changePasswordForm.controls[fieldName].hasError('required') ? 'Required field' : '';
    }
    return '';
  }

  getPasswordsMatch() {
    if(this.changePasswordForm.controls.passwordGroup.get('password')?.touched
        && this.changePasswordForm.controls.passwordGroup.get('confirmPassword')?.touched) {
      return this.changePasswordForm.controls.passwordGroup.hasError('passwordsDontMatch') ? 'Passwords must match' : '';
    }
    return '';
  }

  getPasswordRequiredFieldErrorMessage(fieldName: string) {
    if(this.changePasswordForm.controls.passwordGroup.get(fieldName)?.touched) {
      return this.changePasswordForm.controls.passwordGroup.get(fieldName)?.hasError('required') ? 'Required field' : '';
    }
    return '';
  }

}
