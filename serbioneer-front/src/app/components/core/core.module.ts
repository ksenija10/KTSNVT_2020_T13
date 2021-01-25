import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { ReactiveFormsModule } from '@angular/forms';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatButtonModule } from '@angular/material/button';
import { MatChipsModule } from '@angular/material/chips';
import { MatDialogModule } from '@angular/material/dialog';
import { MatDividerModule } from '@angular/material/divider';
import { MatExpansionModule } from '@angular/material/expansion';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSelectModule } from '@angular/material/select';
import { MatTableModule } from '@angular/material/table';
import { MatTabsModule } from '@angular/material/tabs';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { RouterModule } from '@angular/router';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { NgImageSliderModule } from 'ng-image-slider';
import { ToastrModule } from 'ngx-toastr';
import { ConfirmDeleteDialogComponent } from './confirm-dialog/confirm-dialog.component';
import { CoreRoutingModule } from './core-routing.module';
import { HeaderComponent } from './header/header.component';
import { HomepageComponent } from './homepage/homepage.component';
import { MapViewComponent } from './homepage/map-view/map-view.component';
import { TableViewComponent } from './homepage/table-view/table-view.component';
import { LoginRegisterComponent } from './login-register/login-register.component';
import { LoginComponent } from './login-register/login/login.component';
import { RegisterComponent } from './login-register/register/register.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { AddNewsArticleComponent } from './view-cultural-site/add-news-article/add-news-article.component';
import { CommentComponent } from './view-cultural-site/comment/comment.component';
import { NewsArticleComponent } from './view-cultural-site/news-article/news-article.component';
import { ViewCulturalSiteComponent } from './view-cultural-site/view-cultural-site.component';

@NgModule({
    declarations: [
        ConfirmDeleteDialogComponent,
        HeaderComponent,
        MapViewComponent,
        TableViewComponent,
        HomepageComponent,
        LoginRegisterComponent,
        LoginComponent,
        RegisterComponent,
        PageNotFoundComponent,
        AddNewsArticleComponent,
        CommentComponent,
        NewsArticleComponent,
        ViewCulturalSiteComponent
    ],
    imports: [
        RouterModule,
        CommonModule,
        CoreRoutingModule,
        ReactiveFormsModule,
        ToastrModule.forRoot({
            positionClass: 'toast-custom',
            timeOut: 2500,
          }),
        NgbModule,
        MatButtonModule,
        MatDialogModule,
        MatIconModule,
        MatTableModule,
        MatTooltipModule,
        MatPaginatorModule,
        MatFormFieldModule,
        MatChipsModule,
        MatIconModule,
        MatAutocompleteModule,
        MatSelectModule,
        MatInputModule,
        MatButtonModule,
        MatTabsModule,
        MatDividerModule,
        MatProgressBarModule,
        NgImageSliderModule,
        MatExpansionModule
    ],
    exports: [HeaderComponent]
})
export class CoreModule { }
