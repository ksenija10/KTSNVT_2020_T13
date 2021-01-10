import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatTabsModule } from '@angular/material/tabs';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './components/header/header.component';
import { LoginRegisterComponent } from './components/login-register/login-register.component';
import { LoginComponent } from './components/login-register/login/login.component';
import { RegisterComponent } from './components/login-register/register/register.component';
import { PageNotFoundComponent } from './components/page-not-found/page-not-found.component';
import { HomepageComponent } from './components/homepage/homepage.component';
import { NewAdminComponent } from './components/admin/new-admin/new-admin.component';
import { ViewAdminComponent } from './components/admin/view-admin/view-admin.component';

import { ToastrModule } from 'ngx-toastr';
import { AuthInterceptorService } from './interceptors/auth-interceptor.service';
import { TableViewComponent } from './components/homepage/table-view/table-view.component';
import { MapViewComponent } from './components/homepage/map-view/map-view.component';
import { CulturalSitesTableComponent } from './components/homepage/table-view/cultural-sites-table/cultural-sites-table.component';
import { PendingCommentsComponent } from './components/pending-comments/pending-comments.component';
import { ApproveCommentComponent } from './components/approve-comment/approve-comment.component';
import { NewNewsArticleComponent } from './components/new-news-article/new-news-article.component';

import { MyProfileComponent } from './components/my-profile/my-profile.component';
import { ChangePasswordComponent } from './components/change-password/change-password.component';
import { MatListModule } from '@angular/material/list';
import { ScrollingModule } from '@angular/cdk/scrolling';
import { MatDividerModule } from '@angular/material/divider';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatChipsModule } from '@angular/material/chips';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatSelectModule } from '@angular/material/select';
import { NewsfeedComponent } from './components/newsfeed/newsfeed.component';
import { NewsComponent } from './components/newsfeed/news/news.component';
import { MatCardModule } from '@angular/material/card';

@NgModule({
  declarations: [
    AppComponent,
    LoginRegisterComponent,
    HeaderComponent,
    LoginComponent,
    RegisterComponent,
    PageNotFoundComponent,
    HomepageComponent,
    TableViewComponent,
    MapViewComponent,
    CulturalSitesTableComponent,
    PendingCommentsComponent,
    ApproveCommentComponent,
    NewNewsArticleComponent,
    MyProfileComponent,
    ChangePasswordComponent,
    NewAdminComponent,
    ViewAdminComponent,
    NewsfeedComponent,
    NewsComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    MatTabsModule,
    MatToolbarModule,
    MatInputModule,
    MatFormFieldModule,
    MatIconModule,
    MatButtonModule,
    BrowserAnimationsModule,
    ToastrModule.forRoot(),
    MatAutocompleteModule,
    MatChipsModule,
    MatTableModule,
    MatPaginatorModule,
    MatSelectModule,
    MatListModule,
    ScrollingModule,
    MatDividerModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatCardModule,
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptorService,
      //ako multi nije true ovo bi bio jedini interceptor i pregazio bi sve defaultne interceptore
      multi: true,
    },
    { provide: Window, useValue: window },
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
