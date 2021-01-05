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

    private refreshToken() {
        // interseptor bi trebao da dodaje na svaki rikvest (sem logina) u header jwt token
        // pa ce se ovo izbaciti kada se interseptor doda
        let refreshHeaders = new HttpHeaders({'Content-Type': 'application/json', 'Authorization': 'Bearer ' + this.refreshedToken});
        return this.http.post(environment.apiEndpoint + 'refresh', {}, 
            {headers: refreshHeaders, observe: 'response'})
    }

    private refreshTokenTimeout: any;
    private refreshedToken: string = "";

    public startRefreshTokenTimer(token: string) {
        // parse json object from base64 encoded jwt token
        const jwtToken = this.parseJwt(token);
        // set a timeout to refresh the token a minute before it expires
        const expires = new Date(jwtToken.exp * 1000);
        const timeout = expires.getTime() - Date.now() - (60 * 1000);

        this.refreshedToken = token;

        this.refreshTokenTimeout = setInterval(
            () => this.refreshToken()
                .subscribe((response) => {
                    let jwtTokenBearer = response.headers.get('Authorization');
                    if (jwtTokenBearer) {
                        let jwtToken = jwtTokenBearer.split(" ")[1];
                        this.refreshedToken = jwtToken;
                    }
                }), timeout);
    }

    // poziv pri logout-u
    public stopRefreshTokenTimer() {
        clearTimeout(this.refreshTokenTimeout);
    }

    private parseJwt(jwtToken: string) {
        try {
          return JSON.parse(atob(jwtToken.split('.')[1]));
        } catch (e) {
          return null;
        }
      };
}