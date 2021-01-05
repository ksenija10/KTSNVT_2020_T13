import { Component, OnInit } from '@angular/core';
import { NgForm } from '@angular/forms';
import { Router } from '@angular/router';
import { UserLogin } from 'src/app/model/user-login.model';
import { AuthenticationService } from 'src/app/services/authentication.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.sass']
})
export class LoginComponent implements OnInit {

  constructor(
    private authService: AuthenticationService,
    private router: Router
  ) {}

  ngOnInit(): void {
  }

  onSubmit(form: NgForm) {
    // check if form is valid
    if (!form.valid) {
      return;
    }

    const email = form.value.email;
    const password = form.value.password;

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
          // preusmerenje
          this.router.navigate(['homepage']);
        },
        (error) => {
          // bice toster
          alert('ah')
        }
      )
  }

}
