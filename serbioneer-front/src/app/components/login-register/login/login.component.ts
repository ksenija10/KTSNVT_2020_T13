import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, NgForm, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserLogin } from 'src/app/model/user-login.model';
import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.sass']
})
export class LoginComponent implements OnInit {

  loginForm: FormGroup;

  hide = true;

  constructor(
    private authService: AuthenticationService,
    private router: Router
  ) {
    this.loginForm = new FormGroup({
      email: new FormControl('', [Validators.required, Validators.email]),
      password: new FormControl('', [Validators.required])
    })
  }

  ngOnInit(): void {
  }

  onSubmit() {
    // check if form is valid
    if (!this.loginForm.valid) {
      return;
    }

    const email = this.loginForm.value.email;
    const password = this.loginForm.value.password;

    let userLoginDto = new UserLogin(email, password);

    this.authService.login(userLoginDto)
      .subscribe(
        (response) => {
          let jwtTokenBearer = response.headers.get('Authorization');
          let jwtToken = jwtTokenBearer.split(" ")[1];
          let expiresIn = response.headers.get('Expires-In');
          // postavljanje tokena
          localStorage.setItem('jwtToken', jwtToken);
          localStorage.setItem('expiresIn', expiresIn);
          // pokretanje tajmera za refresh tokena
          this.authService.startRefreshTokenTimer(jwtToken);
          //reset forme
          this.loginForm.reset();
          // preusmerenje
          this.router.navigate(['homepage']);
        },
        (error) => {
          // bice toster
          alert('ah')
        }
      )
  }

  getEmailErrorMessage() {
    if(this.loginForm.controls['email'].touched) {
      if ( this.loginForm.controls['email'].hasError('required')) {
        return 'Required field';
      }
  
      return  this.loginForm.controls['email'].hasError('email') ? 'Not a valid email' : '';
    }
    return '';
  }

  getRequiredFieldErrorMessage(fieldName: string) {
    if(this.loginForm.controls[fieldName].touched) {
      return  this.loginForm.controls[fieldName].hasError('required') ? 'Required field' : '';
    }

    return '';
  }

}


