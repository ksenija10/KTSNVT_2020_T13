import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, FormsModule, ValidatorFn } from '@angular/forms';
import { confirmPasswordValidator } from 'src/app/directives/confirm-password.directive';
import { AuthenticatedUser } from 'src/app/model/authenticated-user.model';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.sass']
})
export class RegisterComponent implements OnInit {

  registerForm: FormGroup;

  constructor(
    private authenticationService: AuthenticationService,
    private router: Router
    ) {
    this.registerForm = new FormGroup({
      email: new FormControl('', [Validators.email, Validators.required]),
      password: new FormControl('', [Validators.required]),
      confirmPassword: new FormControl('', [Validators.required]),
      name: new FormControl('', [Validators.required]),
      surname: new FormControl('', [Validators.required])
    },
    {validators: confirmPasswordValidator()}
    );
   }

  ngOnInit(): void {
  }

  onSubmit() {

    if(this.registerForm.invalid) {
      return;
    }

    const authUser: AuthenticatedUser = 
      new AuthenticatedUser(
        this.registerForm.value.email, 
        this.registerForm.value.password, 
        this.registerForm.value.name, 
        this.registerForm.value.surname, 
        )
    
    this.authenticationService.register(authUser)
      .subscribe(
        response => {
          console.log(response);
          // ovde mu reci hej na mejl ti je stigao mejl, prati ga da se registrujes
          this.registerForm.reset();
          this.router.navigate(['login-register/login']);
        },
        error => {
          console.log(error);
        })
  }

}
