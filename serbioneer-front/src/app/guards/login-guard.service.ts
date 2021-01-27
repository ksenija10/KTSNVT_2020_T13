import { Injectable } from '@angular/core';
import { CanActivate, Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Injectable({
    providedIn: 'root'
})
export class LoginGuard implements CanActivate {

    constructor(private router: Router,
                private toastr: ToastrService) {}

    canActivate(): boolean {
        if (localStorage.getItem('jwtToken')) {
            this.router.navigate(['/homepage']);
            this.toastr.info('Already logged in');
            return false;
        }

        return true;
    }

}
