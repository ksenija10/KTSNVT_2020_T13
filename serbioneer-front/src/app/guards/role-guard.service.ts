import { Injectable } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import { ToastrService } from 'ngx-toastr';
import { Observable } from 'rxjs';

@Injectable({
    providedIn: 'root'
})
export class RoleGuard implements CanActivate {

    constructor(private router: Router,
                private toastr: ToastrService) {}

    canActivate(route: ActivatedRouteSnapshot): boolean {
        const expectedRoles: string = route.data.expectedRoles;
        const token = localStorage.getItem('jwtToken');
        const jwt: JwtHelperService = new JwtHelperService();

        if (!token) {
            this.router.navigate(['login-register/login']);
            this.toastr.error('401 Unauthorized access');
            return false;
        }

        const info = jwt.decodeToken(token);
        const roles: string[] = expectedRoles.split('|', 2);

        if (roles.indexOf(info.authorities[0].authority) === -1) {
            this.router.navigate(['homepage']);
            this.toastr.error('401 Unauthorized access');
            return false;
        }
        return true;
    }

}
