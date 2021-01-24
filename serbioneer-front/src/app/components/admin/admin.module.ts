import { CommonModule } from "@angular/common";
import { NgModule } from "@angular/core";
import { ReactiveFormsModule } from "@angular/forms";
import { MatNativeDateModule } from "@angular/material/core";
import { MatDatepickerModule } from "@angular/material/datepicker";
import { MatDividerModule } from "@angular/material/divider";
import { MatFormFieldModule } from "@angular/material/form-field";
import { MatIconModule } from "@angular/material/icon";
import { MatInputModule } from "@angular/material/input";
import { MatListModule } from "@angular/material/list";
import { MatPaginatorModule } from "@angular/material/paginator";
import { MatSelectModule } from "@angular/material/select";
import { MatTableModule } from "@angular/material/table";
import { MatTooltipModule } from "@angular/material/tooltip";
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { SatPopoverModule } from "@ncstate/sat-popover";
import { NgImageSliderModule } from "ng-image-slider";
import { GooglePlaceModule } from "ngx-google-places-autocomplete";
import { ToastrModule } from "ngx-toastr";
import { AdminRoutingModule } from "./admin-routing.module";
import { CategoriesComponent } from "./categories/categories.component";
import { InlineEditComponent } from "./categories/inline-edit/inline-edit.component";
import { TypesComponent } from "./categories/types/types.component";
import { NewCulturalSiteComponent } from "./new-cultural-site/new-cultural-site.component";
import { ApproveCommentComponent } from "./pending-comments/approve-comment/approve-comment.component";
import { PendingCommentsComponent } from "./pending-comments/pending-comments.component";
import { NewAdminComponent } from "./view-admin/new-admin/new-admin.component";
import { ViewAdminComponent } from "./view-admin/view-admin.component";


@NgModule({
    declarations: [
        InlineEditComponent,
        TypesComponent,
        CategoriesComponent,
        NewCulturalSiteComponent,
        ApproveCommentComponent,
        PendingCommentsComponent,
        NewAdminComponent,
        ViewAdminComponent
    ],
    imports: [
        CommonModule,
        AdminRoutingModule,
        ToastrModule.forRoot({
            positionClass: 'toast-custom',
            timeOut: 2500,
          }),
        NgImageSliderModule,
        MatTableModule,
        MatInputModule,
        MatPaginatorModule,
        ReactiveFormsModule,
        MatFormFieldModule,
        MatDividerModule,
        MatTooltipModule,
        GooglePlaceModule,
        MatSelectModule,
        MatIconModule,
        MatListModule,
        MatDatepickerModule,
        MatNativeDateModule,
        MatProgressBarModule,
        SatPopoverModule
    ]
})
export class AdminModule { }