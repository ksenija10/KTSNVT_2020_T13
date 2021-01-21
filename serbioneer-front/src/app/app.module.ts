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
import { NewCulturalSiteComponent } from './components/new-cultural-site/new-cultural-site.component';

import { ToastrModule } from 'ngx-toastr';
import { AuthInterceptorService } from './interceptors/auth-interceptor.service';
import { TableViewComponent } from './components/homepage/table-view/table-view.component';
import { MapViewComponent } from './components/homepage/map-view/map-view.component';
import { PendingCommentsComponent } from './components/pending-comments/pending-comments.component';
import { ApproveCommentComponent } from './components/approve-comment/approve-comment.component';

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
import { CategoriesComponent } from './components/admin/categories/categories.component';
import { ViewCulturalSiteComponent } from './components/view-cultural-site/view-cultural-site.component';

import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { NewsArticleComponent } from './components/news-article/news-article.component';
import { CommentComponent } from './components/comment/comment.component';
import { MatDialogModule } from '@angular/material/dialog';
import { AddNewsArticleComponent } from './components/add-news-article/add-news-article.component';
import { ConfirmDeleteDialog } from './dialogs/confirm-dialog/confirm-dialog.component';
import { SatPopoverModule } from '@ncstate/sat-popover';
import { InlineEditComponent } from './components/inline-edit/inline-edit.component';
import { TypesComponent } from './components/admin/categories/types/types.component';

// slike
import { NgImageSliderModule } from 'ng-image-slider';
// infinite scroll
import { InfiniteScrollModule } from 'ngx-infinite-scroll';

import { MatExpansionModule } from '@angular/material/expansion';
import { MatTooltipModule } from '@angular/material/tooltip';

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
    PendingCommentsComponent,
    ApproveCommentComponent,
    MyProfileComponent,
    ChangePasswordComponent,
    NewAdminComponent,
    ViewAdminComponent,
    NewsfeedComponent,
    NewsComponent,
    CategoriesComponent,
    ViewCulturalSiteComponent,
    NewsArticleComponent,
    CommentComponent,
    AddNewsArticleComponent,
    NewCulturalSiteComponent,
    ConfirmDeleteDialog,
    InlineEditComponent,
    TypesComponent
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
    ToastrModule.forRoot({
      positionClass: "toast-custom",
      timeOut: 2500}),
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
    NgbModule,
    MatDialogModule,
    SatPopoverModule,
    // slike
    NgImageSliderModule,
    // infinite scroll
    InfiniteScrollModule,
    MatExpansionModule,
    MatTooltipModule
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
  entryComponents: [AddNewsArticleComponent],
})
export class AppModule {}
