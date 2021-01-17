import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { environment } from "src/environments/environment";
import { AuthenticatedUser } from "../model/authenticated-user.model";
import { PasswordDTO } from "../model/password-dto.model";
import { UserLogin } from "../model/user-login.model";
import { UserUpdateDTO } from "../model/user-update-dto.mpdel";
import { AuthenticationService } from "./authentication.service";

@Injectable({
    providedIn: 'root'
})
export class MyProfileService{

    private headers = new HttpHeaders({'Content-Type': 'application/json'});

    private userApi: string;

    constructor(
        private http: HttpClient,
        private authenticationService: AuthenticationService
    ) {
        this.userApi = 'authenticated-user/';
        if(this.authenticationService.getLoggedInUserAuthority() === 'ROLE_ADMIN') {
            this.userApi = 'admin/';
        }
    }

    updatePersonalInformation(userUpdateDto: UserUpdateDTO): Observable<any> {
        return this.http.put<UserUpdateDTO>(
            environment.apiEndpoint + this.userApi + 'updatePersonalInformation',
            userUpdateDto,
            { headers: this.headers }
        )
    }

    getCurrentAuthenticatedUser(): Observable<any> {
        return this.http.get<AuthenticatedUser>(
            environment.apiEndpoint + this.userApi + 'view-profile',
            { headers: this.headers}
        )
    }

    updatePassword(passwordDto: PasswordDTO) {
        return this.http.put(
            environment.apiEndpoint + this.userApi + 'updatePassword',
            passwordDto,
            { headers: this.headers, observe: 'response'}
        )
    }
}