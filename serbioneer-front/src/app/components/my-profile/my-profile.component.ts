import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { AuthenticatedUser } from 'src/app/model/authenticated-user.model';
import { UserUpdateDTO } from 'src/app/model/user-update-dto.mpdel';
import { MyProfileService } from 'src/app/services/my-profile.service';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { onlyContainsLetters } from 'src/app/util/util';

@Component({
  selector: 'app-my-profile',
  templateUrl: './my-profile.component.html',
  styleUrls: ['./my-profile.component.sass']
})
export class MyProfileComponent implements OnInit {

  myProfileForm!: FormGroup;
  namePattern = "[A-Z][a-z]*";
  datePattern = "[0-9]";
  loggedInUser!: UserUpdateDTO;
  role!: string;

  constructor(
    private myProfileService: MyProfileService,
    private toastr: ToastrService,
    private router: Router,
    private authenticationService: AuthenticationService
  ) {
    this.myProfileForm = new FormGroup({
      email: new FormControl({value: '', disabled: true}, [Validators.email, Validators.required]),
      name: new FormControl('', [Validators.required, Validators.pattern(this.namePattern)]),
      surname: new FormControl('', [Validators.required, Validators.pattern(this.namePattern)]),
      dateOfBirth: new FormControl('')
    })
    this.role = this.authenticationService.getLoggedInUserAuthority();
   }

  ngOnInit(): void {
    this.myProfileService.getCurrentAuthenticatedUser()
    .subscribe(
      response => {
        this.loggedInUser = response;
        this.myProfileForm.controls['email'].setValue(this.loggedInUser.email);
        this.myProfileForm.controls['name'].setValue(this.loggedInUser.name);
        this.myProfileForm.controls['surname'].setValue(this.loggedInUser.surname);
        this.myProfileForm.controls['dateOfBirth'].setValue(this.loggedInUser.dateOfBirth);
      }
    )
  }

  onSubmit() {

    if(this.myProfileForm.invalid) {
      return;
    }

    const userUpdateDTO: UserUpdateDTO = 
      new UserUpdateDTO(
        this.myProfileForm.value.name,
        this.myProfileForm.value.surname,
        this.myProfileForm.value.dateOfBirth
      )
    
      this.myProfileService.updatePersonalInformation(userUpdateDTO)
        .subscribe(
          response => {
            this.toastr.success('Personal information updated successfully!')
          },
          error => {
            if(error.error.message){
              this.toastr.error(error.error.message);
            } else {
              this.toastr.error('503 Server Unavailable');
            }
          }
        )
      
      this.myProfileForm.reset();
      this.router.navigate(['homepage']);
  }

  getNameErrorMessage(fieldName: string) {
    if(this.myProfileForm.controls[fieldName].touched) {
      if(this.myProfileForm.controls[fieldName].hasError('pattern')) {
        if(onlyContainsLetters(this.myProfileForm.controls[fieldName].value)) {
          return 'Must start with capital letter';
        } else {
          return 'Cannot contain special characters or numbers'
        }
      }
      return this.myProfileForm.controls[fieldName].hasError('required') ? 'Required field' : '';
    }
    return '';
  }

  getDateErrorMessage(fieldName: string) {
    if(this.myProfileForm.controls[fieldName].touched) {
      return this.myProfileForm.controls[fieldName].invalid ? 'Invalid date format' : '';
    }
    return '';
  }

}
