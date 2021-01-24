import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { ReactiveFormsModule } from "@angular/forms";
import { MatButtonModule } from "@angular/material/button";
import { MatNativeDateModule } from "@angular/material/core";
import { MatDatepickerModule } from "@angular/material/datepicker";
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatIconModule } from "@angular/material/icon";
import { MatInputModule } from "@angular/material/input";
import { BrowserModule } from "@angular/platform-browser";
import { ToastrModule } from "ngx-toastr";
import { ChangePasswordComponent } from "./change-password/change-password.component";
import { MyProfileComponent } from "./my-profile/my-profile.component";
import { UserProfileRoutingModule } from "./user-profile-routing-module";

@NgModule({
    declarations: [
        ChangePasswordComponent,
        MyProfileComponent
    ],
    imports: [
        CommonModule,
        UserProfileRoutingModule,
        ReactiveFormsModule,
        ToastrModule.forRoot({
            positionClass: 'toast-custom',
            timeOut: 2500,
          }),
        MatFormFieldModule,
        MatInputModule,
        MatIconModule,
        MatButtonModule,
        MatDatepickerModule,
        MatNativeDateModule
    ]
})

export class UserProfileModule { }