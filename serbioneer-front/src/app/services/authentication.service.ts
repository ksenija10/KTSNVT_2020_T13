import { HttpClient, HttpHeaders } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { UserLogin } from "../model/user-login.model";
import { environment } from "../../environments/environment";
import { AuthenticatedUser } from '../model/authenticated-user.model';

@Injectable({
    providedIn: 'root'
})
export class AuthenticationService {
    private headers = new HttpHeaders({'Content-Type': 'application/json'});

    constructor(
        private http: HttpClient
    ) {}

    login(userLoginDto: UserLogin): Observable<any> {
        return this.http.post('http://localhost:8080/login', userLoginDto, 
            {headers: this.headers, observe: 'response'})
    }

    register(authUserDto: AuthenticatedUser): Observable<any> {
        return this.http.post(environment.apiEndpoint + 'register', authUserDto,
            {headers: this.headers})
    }
}