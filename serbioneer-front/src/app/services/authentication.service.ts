import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable, ɵbypassSanitizationTrustResourceUrl } from '@angular/core';
import { BehaviorSubject, Observable, Subject } from 'rxjs';
import { UserLogin } from '../model/user-login.model';
import { environment } from '../../environments/environment';
import { AuthenticatedUser } from '../model/authenticated-user.model';
import { JwtHelperService } from '@auth0/angular-jwt';
import { Router } from '@angular/router';

@Injectable({
  providedIn: 'root',
})
export class AuthenticationService {

  public role: BehaviorSubject<string> = new BehaviorSubject<string>('');

  role$ = this.role.asObservable();

  private headers = new HttpHeaders({ 'Content-Type': 'application/json' });

  private jwtService: JwtHelperService;

  constructor(
    private http: HttpClient, 
    private router: Router
  ) {
    this.jwtService = new JwtHelperService()
  }

  register(authUserDto: AuthenticatedUser): Observable<any> {
    return this.http.post(environment.apiEndpoint + 'register', authUserDto, {
      headers: this.headers,
    });
  }

  login(userLoginDto: UserLogin): Observable<any> {
    return this.http.post('http://localhost:8080/login', userLoginDto, {
      headers: this.headers,
      observe: 'response',
    });
  }

  autoLogin(): boolean {
    const user = this.getLoggedInUser()
    // provera postojanja tokena
    if (!user) {
      return true;
    }
    // provera validnosti tokena
    if (user.exp * 1000 < Date.now()) {
      // token vise nije validan
      localStorage.removeItem('jwtToken');
      localStorage.removeItem('expiresIn');
      this.router.navigate(['login-register/login']);
      return false;
    }
    // token je validan, prosledimo rolu kao sledecu vrednost observable
    const role = this.getLoggedInUserAuthority();
    this.role.next(role);
    // pokrenemo refresh
    return true;
  }

  logout(): void {
    localStorage.removeItem('jwtToken');
    localStorage.removeItem('expiresIn');
    this.router.navigate(['login-register/login']);
    this.role.next('');
    this.stopRefreshTokenTimer()
  }

  // geteri i seteri
  setLoggedInUser(response: any) {
    // ekstrakcija tokena
    let jwtTokenBearer = response.headers.get('Authorization');
    let jwtToken = jwtTokenBearer.split(" ")[1];
    let expiresIn = response.headers.get('Expires-In');
    // postavljanje tokena
    localStorage.setItem('jwtToken', jwtToken);
    localStorage.setItem('expiresIn', expiresIn);
    // pokretanje tajmera za refresh tokena
    this.startRefreshTokenTimer(jwtToken);
 }

  getLoggedInUser() {
    const token = localStorage.getItem('jwtToken');
    if (!token) {
      return '';
    }
    const info = this.jwtService.decodeToken(token);
    return info;
  }

  getLoggedInUserAuthority(): string {
    const info = this.getLoggedInUser();
    if (info)
      return info.authorities[0].authority;
    else
      return '';
  }

  getLoggedInUserEmail() {
    const info = this.getLoggedInUser();
    if (info)
      return info.sub;
    else
      return '';
  }

  // pomocne metode
  private refreshToken() {
    return this.http.post(
      environment.apiEndpoint + 'refresh',
      {},
      { observe: 'response' }
    );
  }

  private refreshTokenTimeout: any;
  private refreshedToken: string = '';
  private expiresInNum: number = 0;

  public startRefreshTokenTimer(token: string) {
    // parse json object from base64 encoded jwt token
    const jwtToken = this.jwtService.decodeToken(token);
    // set a timeout to refresh the token a minute before it expires
    const expires = new Date(jwtToken.exp * 1000);
    const timeout = expires.getTime() - Date.now() - 60 * 1000;

    this.refreshedToken = token;

    this.refreshTokenTimeout = setInterval(
      () =>
        this.refreshToken().subscribe((response) => {
          let jwtTokenBearer = response.headers.get('Authorization');
          if (jwtTokenBearer) {
            let jwtToken = jwtTokenBearer.split(' ')[1];
            this.refreshedToken = jwtToken;
            // postavljanje tokena
            localStorage.setItem('jwtToken', this.refreshedToken);
          }
        }),
      timeout
    );
  }

  // poziv pri logout-u
  public stopRefreshTokenTimer() {
    clearInterval(this.refreshTokenTimeout);
  }

  public startAutoLoginRefreshTokenTimer() {
    const token = localStorage.getItem('jwtToken');
    if (!token)
      return
    const expiresIn = localStorage.getItem('expiresIn');
    if (!expiresIn) {
      return
    } else {
      this.expiresInNum = <number><unknown>expiresIn;
    }
    // parse json object from base64 encoded jwt token
    const jwtToken = this.jwtService.decodeToken(token);
    // set a timeout to refresh the token a minute before it expires
    const expires = new Date(jwtToken.exp * 1000);
    const timeout = expires.getTime() - Date.now() - 60 * 1000

    this.refreshedToken = token;
    this.refreshTokenTimeout = setTimeout(
      () => {
        this.intervalFunction();
        setInterval(
          () => {
            this.intervalFunction()
          }, this.expiresInNum - 60 * 1000)
      }, timeout);
  }

  private intervalFunction() {
    this.refreshToken().subscribe((response) => {
      let jwtTokenBearer = response.headers.get('Authorization');
      if (jwtTokenBearer) {
        let jwtToken = jwtTokenBearer.split(' ')[1];
        this.refreshedToken = jwtToken;
        // postavljanje tokena
        localStorage.setItem('jwtToken', this.refreshedToken);
      }
    })
  }

}
