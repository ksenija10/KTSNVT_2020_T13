import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { RoleGuard } from "src/app/guards/role-guard.service";
import { ChangePasswordComponent } from "./change-password/change-password.component";
import { MyProfileComponent } from "./my-profile/my-profile.component";

const routes: Routes = [
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
    }
]

@NgModule({
    imports: [RouterModule.forChild(routes)],
    exports: [RouterModule]
})

export class UserProfileRoutingModule { }