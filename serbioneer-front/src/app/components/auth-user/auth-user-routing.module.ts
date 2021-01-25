import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { RoleGuard } from 'src/app/guards/role-guard.service';
import { HomepageComponent } from '../core/homepage/homepage.component';
import { NewsfeedComponent } from './newsfeed/newsfeed.component';

const routes: Routes = [
    {
        path: 'newsfeed',
        component: NewsfeedComponent,
        canActivate: [RoleGuard],
        data: { expectedRoles: 'ROLE_USER' },
    },
    {
        path: 'subscribed',
        component: HomepageComponent,
        canActivate: [RoleGuard],
        data: { expectedRoles: 'ROLE_USER',
                subscribedView: true,
                subscribedMap: 'map-subscribed' },
    }
];

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})

export class AuthUserRoutingModule { }
