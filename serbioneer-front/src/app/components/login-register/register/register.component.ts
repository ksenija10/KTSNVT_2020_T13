import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, FormsModule, ValidatorFn } from '@angular/forms';
import { ConfirmPasswordMatcher, confirmPasswordValidator } from 'src/app/directives/confirm-password.directive';
import { AuthenticatedUser } from 'src/app/model/authenticated-user.model';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { onlyContainsLetters } from 'src/app/util/util';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.sass']
})
export class RegisterComponent implements OnInit {

  registerForm: FormGroup;

  hide = true;
  namePattern = "[A-Z][a-z]*";
  confirmPasswordMatcher = new ConfirmPasswordMatcher();

  constructor(
    private authenticationService: AuthenticationService,
    private router: Router,
    private toastr: ToastrService
    ) {
    this.registerForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      passwordGroup: new FormGroup({
        password: new FormControl('', [Validators.required]),
        confirmPassword: new FormControl('', [Validators.required])
      }, {validators: confirmPasswordValidator()}),
      name: new FormControl('', [Validators.required, Validators.pattern(this.namePattern)]),
      surname: new FormControl('', [Validators.required, Validators.pattern(this.namePattern)])
    });
   }

  ngOnInit(): void {
  }

  onSubmit() {
    if (this.registerForm.invalid) {
      return;
    }

    const authUser: AuthenticatedUser = 
      new AuthenticatedUser(
        this.registerForm.value.email, 
        this.registerForm.value.passwordGroup.password, 
        this.registerForm.value.name, 
        this.registerForm.value.surname, 
        )

    this.authenticationService.register(authUser)
      .subscribe(
        response => {
          console.log(response);
          this.toastr.success('Confirmation mail sent!');
          this.registerForm.reset();
          this.router.navigate(['login-register/login']);
        },
        error => {
          this.toastr.error(error.error.message);
          this.registerForm.reset();
        })
  }

  getEmailErrorMessage() {
    if(this.registerForm.controls['email'].touched) {
      if ( this.registerForm.controls['email'].hasError('required')) {
        return 'Required field';
      }
      return this.registerForm.controls['email'].hasError('email') ? 'Not a valid email' : '';
    }
    return '';
  }

  getRequiredFieldErrorMessage(fieldName: string) {
    if(this.registerForm.controls[fieldName].touched) {
      return this.registerForm.controls[fieldName].hasError('required') ? 'Required field' : '';
    }
    return '';
  }

  getNameErrorMessage(fieldName: string) {
    if(this.registerForm.controls[fieldName].touched) {
      if(this.registerForm.controls[fieldName].hasError('pattern')) {
        if(onlyContainsLetters(this.registerForm.controls[fieldName].value)) {
          return 'Must start with capital letter';
        } else {
          return 'Cannot contain special characters or numbers'
        }
      }
      return this.registerForm.controls[fieldName].hasError('required') ? 'Required field' : '';
    }
    return '';
  }

  getPasswordsMatch() {
    if(this.registerForm.controls.passwordGroup.get('password')?.touched
        && this.registerForm.controls.passwordGroup.get('confirmPassword')?.touched) {
      return this.registerForm.controls.passwordGroup.hasError('passwordsDontMatch') ? 'Passwords must match' : '';
    }
    return '';
  }
}
