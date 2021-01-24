import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { ReactiveFormsModule } from "@angular/forms";
import { MatCardModule } from "@angular/material/card";
import { BrowserModule } from "@angular/platform-browser";
import { RouterModule } from "@angular/router";
import { NgImageSliderModule } from "ng-image-slider";
import { InfiniteScrollModule } from "ngx-infinite-scroll";
import { ToastrModule } from "ngx-toastr";
import { AuthUserRoutingModule } from "./auth-user-routing.module";
import { NewsComponent } from "./newsfeed/news/news.component";
import { NewsfeedComponent } from "./newsfeed/newsfeed.component";

@NgModule({
    declarations: [
        NewsComponent,
        NewsfeedComponent
    ],
    imports: [
        RouterModule,
        CommonModule,
        AuthUserRoutingModule,
        ReactiveFormsModule,
        ToastrModule.forRoot({
            positionClass: 'toast-custom',
            timeOut: 2500,
          }),
        NgImageSliderModule,
        MatCardModule,
        InfiniteScrollModule
    ]
})
export class AuthUserModule { }