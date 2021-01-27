import { Routes } from '@angular/router';
import { RoleGuard } from 'src/app/guards/role-guard.service';
import { CategoriesComponent } from './categories/categories.component';
import { NewCulturalSiteComponent } from './new-cultural-site/new-cultural-site.component';
import { PendingCommentsComponent } from './pending-comments/pending-comments.component';
import { NewAdminComponent } from './view-admin/new-admin/new-admin.component';
import { ViewAdminComponent } from './view-admin/view-admin.component';

export const routes: Routes = [
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
        path: 'new-cultural-site',
        component: NewCulturalSiteComponent,
        canActivate: [RoleGuard],
        data: { expectedRoles: 'ROLE_ADMIN' }
      },
      {
        path: 'edit-cultural-site/:id',
        component: NewCulturalSiteComponent,
        canActivate: [RoleGuard],
        data: { expectedRoles: 'ROLE_ADMIN' }
      }
];
