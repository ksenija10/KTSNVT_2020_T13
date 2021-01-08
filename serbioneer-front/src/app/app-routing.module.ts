import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { HomepageComponent } from './components/homepage/homepage.component';
import { LoginRegisterComponent } from './components/login-register/login-register.component';
import { LoginComponent } from './components/login-register/login/login.component';
import { RegisterComponent } from './components/login-register/register/register.component';
import { NewsfeedComponent } from './components/newsfeed/newsfeed.component';
import { PageNotFoundComponent } from './components/page-not-found/page-not-found.component';
import { LoginGuard } from './guards/login-guard.service';
import { RoleGuard } from './guards/role-guard.service';

const routes: Routes = [
  //login guard ne dozvoljava ulogovanom korisniku da opet pristupi login strani
  { 
    path: '', 
    redirectTo: '/login-register/login', 
    pathMatch: 'full'
  },
  { 
    path: 'homepage',
    component: HomepageComponent
  },
  { path: 'login-register', 
    component: LoginRegisterComponent, 
    children: [
      { 
        path: '', 
        redirectTo: 'login', 
        pathMatch: 'full'
      },
      { 
        path: 'login', 
        component: LoginComponent,
        canActivate: [LoginGuard]
      },
      { 
        path: 'register', 
        component: RegisterComponent
      }
  ] },
  {
    path: 'newsfeed',
    component: NewsfeedComponent,
    canActivate: [RoleGuard],
    data: { expectedRoles: 'ROLE_USER' }
  },
  { 
    path: '**', 
    component: PageNotFoundComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
