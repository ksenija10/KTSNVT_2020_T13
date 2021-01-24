import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

const routes: Routes = [
  //login guard ne dozvoljava ulogovanom korisniku da opet pristupi login strani
  {
    path: '',
    loadChildren: () => import('./components/core/core.module').then(m => m.CoreModule),
    pathMatch: 'full'
  },
  {
    path: 'admin',
    loadChildren: () => import('./components/admin/admin.module').then(m => m.AdminModule)
  },
  {
    path: 'auth',
    loadChildren: () => import('./components/auth-user/auth-user.module').then(m => m.AuthUserModule)
  },
  {
    path: 'profile',
    loadChildren: () => import('./components/user-profile/user-profile.module').then(m => m.UserProfileModule)
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
