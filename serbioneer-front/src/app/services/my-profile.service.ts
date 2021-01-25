import { HttpClient, HttpHeaders, HttpResponse } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AuthenticatedUser } from '../model/authenticated-user.model';
import { PasswordDTO } from '../model/password-dto.model';
import { UserUpdateDTO } from '../model/user-update-dto.mpdel';
import { AuthenticationService } from './authentication.service';

@Injectable({
    providedIn: 'root'
})
export class MyProfileService{

    private headers = new HttpHeaders({'Content-Type': 'application/json'});

    private userApi = '';

    constructor(
        private http: HttpClient,
        private authenticationService: AuthenticationService
    ) {}

    updatePersonalInformation(userUpdateDto: UserUpdateDTO): Observable<UserUpdateDTO> {
        this.checkRole();
        return this.http.put<UserUpdateDTO>(
            environment.apiEndpoint + this.userApi + 'updatePersonalInformation',
            userUpdateDto,
            { headers: this.headers }
        );
    }

    getCurrentAuthenticatedUser(): Observable<AuthenticatedUser> {
        this.checkRole();
        return this.http.get<AuthenticatedUser>(
            environment.apiEndpoint + this.userApi + 'view-profile',
            { headers: this.headers}
        );
    }

    updatePassword(passwordDto: PasswordDTO): Observable<HttpResponse<void>> {
        this.checkRole();
        return this.http.put<void>(
            environment.apiEndpoint + this.userApi + 'updatePassword',
            passwordDto,
            { headers: this.headers, observe: 'response'}
        );
    }

    private checkRole(): void {
        if (this.authenticationService.getLoggedInUserAuthority() === 'ROLE_ADMIN') {
            this.userApi = 'admin/';
        } else {
            this.userApi = 'authenticated-user/';
        }
    }
}
