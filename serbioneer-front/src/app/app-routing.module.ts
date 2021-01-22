import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { NewAdminComponent } from './components/admin/new-admin/new-admin.component';
import { HomepageComponent } from './components/homepage/homepage.component';
import { LoginRegisterComponent } from './components/login-register/login-register.component';
import { LoginComponent } from './components/login-register/login/login.component';
import { RegisterComponent } from './components/login-register/register/register.component';
import { NewsfeedComponent } from './components/newsfeed/newsfeed.component';
import { PageNotFoundComponent } from './components/page-not-found/page-not-found.component';
import { PendingCommentsComponent } from './components/pending-comments/pending-comments.component';
import { LoginGuard } from './guards/login-guard.service';
import { RoleGuard } from './guards/role-guard.service';
import { ViewAdminComponent } from './components/admin/view-admin/view-admin.component';
import { MyProfileComponent } from './components/my-profile/my-profile.component';
import { ChangePasswordComponent } from './components/change-password/change-password.component';
import { CategoriesComponent } from './components/admin/categories/categories.component';
import { ViewCulturalSiteComponent } from './components/view-cultural-site/view-cultural-site.component';
import { NewCulturalSiteComponent } from './components/new-cultural-site/new-cultural-site.component';

const routes: Routes = [
  //login guard ne dozvoljava ulogovanom korisniku da opet pristupi login strani
  {
    path: '',
    redirectTo: '/login-register/login',
    pathMatch: 'full',
  },
  {
    path: 'homepage',
    component: HomepageComponent,
  },
  {
    path: 'subscribed',
    component: HomepageComponent,
    canActivate: [RoleGuard],
    data: { expectedRoles: 'ROLE_USER',
            subscribedView: true,
            subscribedMap: 'map-subscribed' },
  },
  {
    path: 'login-register',
    component: LoginRegisterComponent,
    children: [
      {
        path: '',
        redirectTo: 'login',
        pathMatch: 'full',
      },
      {
        path: 'login',
        component: LoginComponent,
        canActivate: [LoginGuard],
      },
      {
        path: 'register',
        component: RegisterComponent,
      },
    ],
  },
  {
    path: 'pending-comments',
    component: PendingCommentsComponent,
    canActivate: [RoleGuard],
    data: { expectedRoles: 'ROLE_ADMIN' },
  },
  {
    path: 'new-admin',
    component: NewAdminComponent,
    canActivate: [RoleGuard],
    data: { expectedRoles: 'ROLE_ADMIN' },
  },
  {
    path: 'view-admin',
    component: ViewAdminComponent,
    canActivate: [RoleGuard],
    data: { expectedRoles: 'ROLE_ADMIN' },
  },
  {
    path: 'categories',
    component: CategoriesComponent,
    canActivate: [RoleGuard],
    data: { expectedRoles: 'ROLE_ADMIN' },
  },
  {
    path: 'my-profile',
    component: MyProfileComponent,
    canActivate: [RoleGuard],
    data: { expectedRoles: 'ROLE_ADMIN|ROLE_USER' },
  },
  {
    path: 'change-password',
    component: ChangePasswordComponent,
    canActivate: [RoleGuard],
    data: { expectedRoles: 'ROLE_ADMIN|ROLE_USER' },
  },
  { 
    path: 'cultural-site/:id', 
    component: ViewCulturalSiteComponent
  },
  {
    path: 'new-cultural-site',
    component: NewCulturalSiteComponent,
    canActivate: [RoleGuard],
    data: { expectedRoles: 'ROLE_ADMIN' }
  },
  {
    path: 'newsfeed',
    component: NewsfeedComponent,
    canActivate: [RoleGuard],
    data: { expectedRoles: 'ROLE_USER' },
  },
  {
    path: '**',
    component: PageNotFoundComponent,
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
