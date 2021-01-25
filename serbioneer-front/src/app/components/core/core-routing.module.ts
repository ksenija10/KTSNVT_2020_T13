import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginGuard } from 'src/app/guards/login-guard.service';
import { HomepageComponent } from './homepage/homepage.component';
import { LoginRegisterComponent } from './login-register/login-register.component';
import { LoginComponent } from './login-register/login/login.component';
import { RegisterComponent } from './login-register/register/register.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { ViewCulturalSiteComponent } from './view-cultural-site/view-cultural-site.component';

const routes: Routes = [
    {
      path: '',
      redirectTo: '/homepage',
      pathMatch: 'full',
    },
    {
        path: 'homepage',
        component: HomepageComponent,
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
        path: 'cultural-site/:id',
        component: ViewCulturalSiteComponent
    },
    {
        path: '**',
        component: PageNotFoundComponent,
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})

export class CoreRoutingModule { }
