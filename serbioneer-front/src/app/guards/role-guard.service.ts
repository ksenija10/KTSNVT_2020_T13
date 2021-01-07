import { ActivatedRouteSnapshot, CanActivate, Router, RouterStateSnapshot, UrlTree } from "@angular/router";
import { Observable, range } from "rxjs";
import { JwtHelperService } from '@auth0/angular-jwt';
import { Injectable } from "@angular/core";
import { ToastrService } from "ngx-toastr";

@Injectable({
    providedIn: 'root'
})
export class RoleGuard implements CanActivate {

    constructor(private router: Router,
                private toastr: ToastrService) {}

    canActivate(route: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean | UrlTree | Observable<boolean | UrlTree> | Promise<boolean | UrlTree> {
        const expectedRoles : string = route.data.expectedRoles;
        const token = localStorage.getItem('jwtToken');
        const jwt: JwtHelperService = new JwtHelperService();

        if(!token) {
            this.router.navigate(['login-register/login']);
            return false;
        }

        const info = jwt.decodeToken(token);
        const roles: string[] = expectedRoles.split('|', 2);

        if(roles.indexOf(info.authorities[0].authority) === -1) {
            this.router.navigate(['homepage']);
            this.toastr.error('401 Unauthorized acces')
            return false;
        }
        return true;
    }
    
}